<?php

namespace App\Services;

use App\Models\AffiliateCommission;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Order;
use Botble\Ecommerce\Models\OrderProduct;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CommissionService
{
    // User level thresholds in BDT
    public const LEVELS = [
        1 => ['name' => 'Spark', 'threshold' => 0],
        2 => ['name' => 'Flare', 'threshold' => 100000],
        3 => ['name' => 'Pathfinder', 'threshold' => 1000000],
        4 => ['name' => 'Global Thrive', 'threshold' => 10000000],
        5 => ['name' => 'Galaxy Pulse', 'threshold' => 100000000],
        6 => ['name' => 'Empire Builder', 'threshold' => 1000000000],
    ];

    // Referral tree commission percentages
    public const REFERRAL_COMMISSIONS = [
        1 => 50, // Level 1: Seller (direct referrer)
        2 => 10, // Level 2
        3 => 5,  // Level 3
        4 => 4,  // Level 4
        5 => 2,  // Level 5
    ];

    public const LEVEL_6_PLUS_COMMISSION = 2; // Remaining 2% for level 6+
    public const GLOBAL_THRIVE_POOL = 3;      // 3% for Global Thrive pool
    public const EMPIRE_BUILDER_POOL = 2;     // 2% for Empire Builder pool

    /**
     * Distribute commissions for an order
     */
    public function distributeCommissions(Order $order): bool
    {
        try {
            DB::beginTransaction();

            // Check if already distributed
            if ($order->is_commission_distributed) {
                Log::warning("Commission already distributed for order #{$order->id}");
                return false;
            }

            // Get buyer
            $buyer = Customer::find($order->user_id);
            if (!$buyer) {
                Log::info("No customer found for order #{$order->id}");
                DB::commit();
                return true; // Not an error, guest checkout
            }

            // Calculate total profit from order items
            $orderProducts = OrderProduct::where('order_id', $order->id)->get();
            $totalProfit = 0;
            $profitableItems = [];

            foreach ($orderProducts as $orderProduct) {
                $product = $orderProduct->product;
                if (!$product) {
                    continue;
                }

                $cost = $product->cost_per_item ?? 0;
                $price = $orderProduct->price; // Use actual order price

                if ($cost > 0 && $price > $cost) {
                    $profit = ($price - $cost) * $orderProduct->qty;
                    $totalProfit += $profit;
                    $profitableItems[] = [
                        'order_product_id' => $orderProduct->id,
                        'product_id' => $product->id,
                        'profit' => $profit,
                    ];
                }
            }

            if ($totalProfit <= 0) {
                Log::info("No profit in order #{$order->id}, skipping commission");
                $order->update(['is_commission_distributed' => true]);
                DB::commit();
                return true;
            }

            // Distribute referral tree commissions
            $this->distributeReferralCommissions($buyer, $order, $totalProfit, $profitableItems);

            // Distribute global pools
            $this->distributeGlobalThrivePool($order, $totalProfit);
            $this->distributeEmpireBuilderPool($order, $totalProfit);

            // Mark as distributed
            $order->update(['is_commission_distributed' => true]);

            DB::commit();
            Log::info("Successfully distributed commissions for order #{$order->id}, total profit: {$totalProfit}");
            return true;

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Commission distribution failed for order #{$order->id}: " . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Reverse commissions for an order
     */
    public function reverseCommissions(Order $order): bool
    {
        try {
            DB::beginTransaction();

            // Get all commissions for this order
            $commissions = AffiliateCommission::where('order_id', $order->id)->get();

            foreach ($commissions as $commission) {
                $customer = $commission->customer;

                if ($customer) {
                    // Reverse balance changes
                    $customer->decrement('lifetime_earnings', $commission->commission_amount);

                    if ($commission->status === 'approved' || $commission->status === 'paid') {
                        $customer->decrement('available_balance', $commission->commission_amount);
                        $customer->decrement('total_earned', $commission->commission_amount);
                    }

                    // Recalculate user level
                    $this->updateCustomerLevel($customer);
                }

                // Delete commission record
                $commission->delete();
            }

            // Mark as not distributed
            $order->update(['is_commission_distributed' => false]);

            DB::commit();
            Log::info("Successfully reversed commissions for order #{$order->id}");
            return true;

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Commission reversal failed for order #{$order->id}: " . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Distribute referral tree commissions
     */
    protected function distributeReferralCommissions(Customer $buyer, Order $order, float $totalProfit, array $profitableItems): void
    {
        Log::info("Starting referral commission distribution for buyer: {$buyer->name} (ID: {$buyer->id}), referral_username: " . ($buyer->referral_username ?? 'None'));

        $currentUser = $buyer;
        $level = 1;
        $level6PlusUsers = [];

        // Traverse up the referral tree
        while ($currentUser->referral_username) {
            Log::info("Level {$level}: Looking for referrer with username: {$currentUser->referral_username}");
            $referrer = Customer::where('username', $currentUser->referral_username)->first();

            if (!$referrer) {
                Log::warning("Referrer not found for username: {$currentUser->referral_username}");
                break;
            }

            Log::info("Found referrer: {$referrer->name} (ID: {$referrer->id})");

            if ($level <= 5) {
                // Levels 1-5: Fixed percentages
                $percentage = self::REFERRAL_COMMISSIONS[$level];
                $commission = ($totalProfit * $percentage) / 100;

                $this->createCommission([
                    'customer_id' => $referrer->id,
                    'order_id' => $order->id,
                    'commission_type' => "referral_level_{$level}",
                    'commission_rate' => $percentage,
                    'commission_amount' => $commission,
                    'order_amount' => $order->amount,
                    'profit_amount' => $totalProfit,
                    'status' => 'approved', // Auto-approve
                ]);

            } else {
                // Level 6+: Collect users for equal split
                $level6PlusUsers[] = $referrer;
            }

            $currentUser = $referrer;
            $level++;
        }

        // Distribute remaining 2% equally among level 6+ users
        if (count($level6PlusUsers) > 0) {
            $poolAmount = ($totalProfit * self::LEVEL_6_PLUS_COMMISSION) / 100;
            $perUserAmount = $poolAmount / count($level6PlusUsers);

            foreach ($level6PlusUsers as $index => $user) {
                $this->createCommission([
                    'customer_id' => $user->id,
                    'order_id' => $order->id,
                    'commission_type' => 'referral_level_6_plus',
                    'commission_rate' => self::LEVEL_6_PLUS_COMMISSION / count($level6PlusUsers),
                    'commission_amount' => $perUserAmount,
                    'order_amount' => $order->amount,
                    'profit_amount' => $totalProfit,
                    'status' => 'approved',
                ]);
            }
        }
    }

    /**
     * Distribute Global Thrive pool
     */
    protected function distributeGlobalThrivePool(Order $order, float $totalProfit): void
    {
        // Get all Global Thrive and above users (levels 4, 5, 6)
        $globalThriveUsers = Customer::whereIn('level', [4, 5, 6])->get();

        if ($globalThriveUsers->count() === 0) {
            Log::info("No Global Thrive users found for order #{$order->id}");
            return;
        }

        $poolAmount = ($totalProfit * self::GLOBAL_THRIVE_POOL) / 100;
        $perUserAmount = $poolAmount / $globalThriveUsers->count();

        foreach ($globalThriveUsers as $user) {
            $this->createCommission([
                'customer_id' => $user->id,
                'order_id' => $order->id,
                'commission_type' => 'global_thrive_pool',
                'commission_rate' => self::GLOBAL_THRIVE_POOL / $globalThriveUsers->count(),
                'commission_amount' => $perUserAmount,
                'order_amount' => $order->amount,
                'profit_amount' => $totalProfit,
                'status' => 'approved',
            ]);
        }
    }

    /**
     * Distribute Empire Builder pool
     */
    protected function distributeEmpireBuilderPool(Order $order, float $totalProfit): void
    {
        // Get all Empire Builder users (level 6)
        $empireBuilders = Customer::where('level', 6)->get();

        if ($empireBuilders->count() === 0) {
            Log::info("No Empire Builder users found for order #{$order->id}");
            return;
        }

        $poolAmount = ($totalProfit * self::EMPIRE_BUILDER_POOL) / 100;
        $perUserAmount = $poolAmount / $empireBuilders->count();

        foreach ($empireBuilders as $user) {
            $this->createCommission([
                'customer_id' => $user->id,
                'order_id' => $order->id,
                'commission_type' => 'empire_builder_pool',
                'commission_rate' => self::EMPIRE_BUILDER_POOL / $empireBuilders->count(),
                'commission_amount' => $perUserAmount,
                'order_amount' => $order->amount,
                'profit_amount' => $totalProfit,
                'status' => 'approved',
            ]);
        }
    }

    /**
     * Create commission record and update customer balances
     */
    protected function createCommission(array $data): void
    {
        $commission = AffiliateCommission::create($data);

        $customer = Customer::find($data['customer_id']);
        if ($customer) {
            // Update lifetime earnings
            $customer->increment('lifetime_earnings', $data['commission_amount']);

            // Update available balance and total earned for approved commissions
            if ($data['status'] === 'approved') {
                $customer->increment('available_balance', $data['commission_amount']);
                $customer->increment('total_earned', $data['commission_amount']);
            }

            // Update user level
            $this->updateCustomerLevel($customer);
        }
    }

    /**
     * Update customer level based on lifetime earnings
     */
    public function updateCustomerLevel(Customer $customer): void
    {
        $earnings = $customer->lifetime_earnings;
        $newLevel = 1;
        $newLevelName = 'Spark';

        foreach (array_reverse(self::LEVELS, true) as $level => $data) {
            if ($earnings >= $data['threshold']) {
                $newLevel = $level;
                $newLevelName = $data['name'];
                break;
            }
        }

        if ($customer->level !== $newLevel) {
            $customer->update([
                'level' => $newLevel,
                'level_name' => $newLevelName,
            ]);

            Log::info("Customer #{$customer->id} upgraded to level {$newLevel}: {$newLevelName}");
        }
    }

    /**
     * Get user level name by earnings
     */
    public static function getLevelByEarnings(float $earnings): array
    {
        foreach (array_reverse(self::LEVELS, true) as $level => $data) {
            if ($earnings >= $data['threshold']) {
                return [
                    'level' => $level,
                    'name' => $data['name'],
                ];
            }
        }

        return ['level' => 1, 'name' => 'Spark'];
    }
}
