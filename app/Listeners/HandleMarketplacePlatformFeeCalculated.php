<?php

namespace App\Listeners;

use App\Events\MarketplacePlatformFeeCalculated;
use App\Models\AffiliateCommission;
use App\Models\CommissionDistributionLog;
use App\Services\CommissionService;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Order;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class HandleMarketplacePlatformFeeCalculated
{
    protected const DISTRIBUTION_CONFIG_PATH = 'config/commission_distribution.json';

    public function handle(MarketplacePlatformFeeCalculated $event): void
    {
        $revenue = $event->revenue;
        $order = $event->order;
        $totalPlatformFeeCut = (float) $revenue->fee;

        if ($totalPlatformFeeCut <= 0) {
            Log::info('[Marketplace] Platform fee calculation skipped because the commission base is zero.', [
                'event' => $event->revenueWasCreated ? 'created' : 'updated',
                'revenue_id' => $revenue->getKey(),
                'order_id' => $order->getKey(),
            ]);

            return;
        }

        $this->distributeCommissions($order, $totalPlatformFeeCut, $revenue->getKey());

        Log::info('[Marketplace] Platform fee commission distribution completed.', [
            'event' => $event->revenueWasCreated ? 'created' : 'updated',
            'revenue_id' => $revenue->getKey(),
            'order_id' => $order->getKey(),
            'total_platform_fee_cut' => $totalPlatformFeeCut,
        ]);
    }

    protected function distributeCommissions(Order $order, float $baseAmount, int $revenueId = 0): void
    {
        DB::transaction(function () use ($order, $baseAmount, $revenueId): void {
            $buyer = Customer::find($order->user_id);
            $distributionConfig = $this->distributionConfig();

            if (! $buyer) {
                Log::info("Marketplace commission distribution skipped for order #{$order->id}: buyer not found");

                return;
            }

            Log::info("Marketplace commission distribution started for order #{$order->id}", [
                'buyer_id' => $buyer->id,
                'buyer_name' => $buyer->name,
                'base_amount' => $baseAmount,
                'referral_username' => $buyer->referral_username ?? null,
            ]);

            $context = [
                'buyer' => $buyer,
                'order' => $order,
                'revenue_id' => $revenueId,
                'base_amount' => $baseAmount,
                'level7_plus_users' => [],
                'config' => $distributionConfig,
                'distribution_tracking' => [
                    'total_distributed' => 0,
                    'total_recipients' => 0,
                    'step_details' => [],
                ],
            ];

            $startCommissionCount = AffiliateCommission::whereOrderId($order->id)->count();

            foreach ($this->commissionSteps($distributionConfig) as $stepKey) {
                $this->dispatchCommissionStep($stepKey, $context);
            }

            $endCommissionCount = AffiliateCommission::whereOrderId($order->id)->count();

            if ($endCommissionCount > $startCommissionCount) {
                $newCommissions = AffiliateCommission::whereOrderId($order->id)
                    ->latest()
                    ->limit($endCommissionCount - $startCommissionCount)
                    ->get();

                $totalDistributed = (float) $newCommissions->sum('commission_amount');
                $totalRecipients = $newCommissions->count();

                $this->logDistributionSummary($context, $totalDistributed, $totalRecipients, $newCommissions);
            }
        });
    }

    protected function commissionSteps(array $distributionConfig): array
    {
        $configuredSteps = $distributionConfig['steps'] ?? [];

        if (! is_array($configuredSteps) || $configuredSteps === []) {
            return $this->defaultDistributionConfig()['steps'];
        }

        return array_values(array_filter($configuredSteps, 'is_string'));
    }

    protected function dispatchCommissionStep(string $stepKey, array &$context): void
    {
        if ($stepKey === 'referral_commissions') {
            $this->distributeReferralCommissions($context);

            return;
        }

        if (str_ends_with($stepKey, '_pool')) {
            $this->distributeConfiguredPool($context, $stepKey);

            return;
        }

        Log::warning('Marketplace commission distribution step skipped due to unknown key.', [
            'step_key' => $stepKey,
        ]);
    }

    protected function distributeReferralCommissions(array &$context): void
    {
        $buyer = $context['buyer'];
        $order = $context['order'];
        $baseAmount = $context['base_amount'];
        $referralConfig = $context['config']['referral'] ?? [];
        $maxDirectLevel = (int) ($referralConfig['direct_levels_max'] ?? 6);
        $levelRates = $referralConfig['level_rates'] ?? [];
        $commissionTypePattern = (string) ($referralConfig['commission_type_pattern'] ?? 'referral_level_%d');
        $requiresAffiliateApproval = (bool) ($referralConfig['requires_affiliate_approval'] ?? true);
        $level7PlusContextKey = (string) ($referralConfig['level_7_plus_context_key'] ?? 'level7_plus_users');

        Log::info("Starting referral commission distribution for buyer: {$buyer->name} (ID: {$buyer->id}), referral_username: " . ($buyer->referral_username ?? 'None'));

        $currentUser = $buyer;
        $level = 1;
        $level7PlusUsers = [];

        while ($currentUser->referral_username) {
            Log::info("Level {$level}: Looking for referrer with username: {$currentUser->referral_username}");
            $referrer = Customer::where('username', $currentUser->referral_username)->first();

            if (! $referrer) {
                Log::warning("Referrer not found for username: {$currentUser->referral_username}");
                break;
            }

            Log::info("Found referrer: {$referrer->name} (ID: {$referrer->id})");

            $isEligible = ! $requiresAffiliateApproval || (
                $referrer->is_affiliate
                && $referrer->affiliate_status == \Botble\Ecommerce\Enums\AffiliateStatusEnum::APPROVED
            );

            if ($level <= $maxDirectLevel) {
                if ($isEligible) {
                    $percentage = (float) ($levelRates[$level] ?? 0);

                    if ($percentage <= 0) {
                        Log::info("Marketplace commission: level {$level} has zero rate, skipping commission record.");
                        $currentUser = $referrer;
                        $level++;

                        continue;
                    }

                    $commission = ($baseAmount * $percentage) / 100;

                    $this->createCommission([
                        'customer_id' => $referrer->id,
                        'order_id' => $order->id,
                        'commission_type' => sprintf($commissionTypePattern, $level),
                        'commission_rate' => $percentage,
                        'commission_amount' => $commission,
                        'order_amount' => $order->amount,
                        'profit_amount' => $baseAmount,
                        'status' => 'approved',
                    ]);

                    Log::info("Marketplace commission: distributed level {$level} commission to referrer ID: {$referrer->id}");
                } else {
                    Log::info("Marketplace commission: referrer ID: {$referrer->id} is not eligible, skipping level {$level}");
                }
            } else {
                if ($isEligible) {
                    $level7PlusUsers[] = $referrer;
                }
            }

            $currentUser = $referrer;
            $level++;
        }

        $context[$level7PlusContextKey] = $level7PlusUsers;
    }

    protected function distributeLevel7PlusPool(array $context): void
    {
        $this->distributeConfiguredPool($context, 'level_7_plus_pool');
    }

    protected function distributeGlobalThrivePool(array $context): void
    {
        $this->distributeConfiguredPool($context, 'global_thrive_pool');
    }

    protected function distributeEmpireBuilderPool(array $context): void
    {
        $this->distributeConfiguredPool($context, 'empire_builder_pool');
    }

    protected function distributeConfiguredPool(array $context, string $poolKey): void
    {
        $poolConfig = $context['config']['pools'][$poolKey] ?? [];
        $order = $context['order'];
        $baseAmount = $context['base_amount'];
        $usersContextKey = (string) ($poolConfig['users_context_key'] ?? '');
        $percentage = (float) ($poolConfig['percentage'] ?? 0);
        $commissionType = (string) ($poolConfig['commission_type'] ?? $poolKey);

        if ($usersContextKey !== '') {
            $users = $context[$usersContextKey] ?? [];

            $this->distributePoolCommissions($order, $baseAmount, $users, $percentage, $commissionType);

            return;
        }

        $eligibleLevels = $this->resolveEligibleLevels($context, $poolKey, []);

        if ($eligibleLevels === []) {
            Log::info("No users configured for pool #{$poolKey} on order #{$order->id}");

            return;
        }

        $users = Customer::whereIn('level', $eligibleLevels)->get();

        if ($users->count() === 0) {
            Log::info("No users found for pool #{$poolKey} on order #{$order->id}");

            return;
        }

        $this->distributePoolCommissions($order, $baseAmount, $users, $percentage, $commissionType);
    }

    protected function resolveEligibleLevels(array $context, string $poolKey, array $fallbackLevels): array
    {
        $poolConfig = $context['config']['pools'][$poolKey] ?? [];
        $slugList = $poolConfig['eligible_level_slugs'] ?? [];

        if (is_array($slugList) && $slugList !== []) {
            $levels = $this->normalizeLevelsConfig($context['config']['levels'] ?? []);
            $slugToLevel = [];

            foreach ($levels as $level => $data) {
                if ($data['slug'] !== '') {
                    $slugToLevel[$data['slug']] = $level;
                }
            }

            $resolvedLevels = [];

            foreach ($slugList as $slug) {
                if (! is_string($slug)) {
                    continue;
                }

                $normalizedSlug = trim($slug);

                if ($normalizedSlug !== '' && isset($slugToLevel[$normalizedSlug])) {
                    $resolvedLevels[] = $slugToLevel[$normalizedSlug];
                }
            }

            $resolvedLevels = array_values(array_unique($resolvedLevels));

            if ($resolvedLevels !== []) {
                return $resolvedLevels;
            }

            Log::warning('Marketplace commission pool has eligible_level_slugs but none could be resolved. Falling back to eligible_levels.', [
                'pool_key' => $poolKey,
                'eligible_level_slugs' => $slugList,
            ]);
        }

        $eligibleLevels = $poolConfig['eligible_levels'] ?? $fallbackLevels;

        if (! is_array($eligibleLevels)) {
            return [];
        }

        $normalizedLevels = [];

        foreach ($eligibleLevels as $level) {
            $levelNumber = (int) $level;

            if ($levelNumber > 0) {
                $normalizedLevels[] = $levelNumber;
            }
        }

        return array_values(array_unique($normalizedLevels));
    }

    protected function distributePoolCommissions(Order $order, float $baseAmount, iterable $users, float $percentage, string $commissionType): void
    {
        $userList = [];

        foreach ($users as $user) {
            $userList[] = $user;
        }

        $userCount = count($userList);

        if ($userCount === 0 || $percentage <= 0) {
            return;
        }

        $poolAmount = ($baseAmount * $percentage) / 100;
        $perUserAmount = $poolAmount / $userCount;
        $perUserRate = $percentage / $userCount;

        foreach ($userList as $user) {
            $this->createCommission([
                'customer_id' => $user->id,
                'order_id' => $order->id,
                'commission_type' => $commissionType,
                'commission_rate' => $perUserRate,
                'commission_amount' => $perUserAmount,
                'order_amount' => $order->amount,
                'profit_amount' => $baseAmount,
                'status' => 'approved',
            ]);
        }
    }

    protected function distributionConfig(): array
    {
        $defaultConfig = $this->defaultDistributionConfig();
        $configPath = base_path(self::DISTRIBUTION_CONFIG_PATH);

        if (! is_readable($configPath)) {
            Log::warning('Marketplace distribution config file not readable. Falling back to defaults.', [
                'path' => $configPath,
            ]);

            return $defaultConfig;
        }

        $content = file_get_contents($configPath);

        if ($content === false) {
            Log::warning('Marketplace distribution config file could not be read. Falling back to defaults.', [
                'path' => $configPath,
            ]);

            return $defaultConfig;
        }

        $decoded = json_decode($content, true);

        if (! is_array($decoded)) {
            Log::warning('Marketplace distribution config file is invalid JSON. Falling back to defaults.', [
                'path' => $configPath,
                'json_error' => json_last_error_msg(),
            ]);

            return $defaultConfig;
        }

        return array_replace_recursive($defaultConfig, $decoded);
    }

    protected function defaultDistributionConfig(): array
    {
        return [
            'steps' => [
                'referral_commissions',
                'level_7_plus_pool',
                'global_thrive_pool',
                'empire_builder_pool',
                'pathfinder_pool',
                'galaxy_pulse_pool',
            ],
            'levels' => [
                1 => ['name' => 'Spark', 'threshold' => 0, 'slug' => 'spark'],
                2 => ['name' => 'Flare', 'threshold' => 10000, 'slug' => 'flare'],
                3 => ['name' => 'Blaze', 'threshold' => 30000, 'slug' => 'blaze'],
                4 => ['name' => 'Pathfinder', 'threshold' => 70000, 'slug' => 'pathfinder'],
                5 => ['name' => 'Global Thrive', 'threshold' => 1000000, 'slug' => 'global_thrive'],
                6 => ['name' => 'Galaxy Pulse', 'threshold' => 10000000, 'slug' => 'galaxy_pulse'],
                7 => ['name' => 'Empire Builder', 'threshold' => 100000000, 'slug' => 'empire_builder'],
            ],
            'referral' => [
                'direct_levels_max' => 6,
                'level_rates' => CommissionService::REFERRAL_COMMISSIONS,
                'requires_affiliate_approval' => true,
                'commission_type_pattern' => 'referral_level_%d',
                'level_7_plus_context_key' => 'level7_plus_users',
            ],
            'pools' => [
                'level_7_plus_pool' => [
                    'percentage' => CommissionService::LEVEL_7_PLUS_COMMISSION,
                    'commission_type' => 'referral_level_7_plus',
                    'users_context_key' => 'level7_plus_users',
                ],
                'global_thrive_pool' => [
                    'percentage' => CommissionService::GLOBAL_THRIVE_POOL,
                    'commission_type' => 'global_thrive_pool',
                    'eligible_level_slugs' => ['global_thrive'],
                ],
                'empire_builder_pool' => [
                    'percentage' => CommissionService::EMPIRE_BUILDER_POOL,
                    'commission_type' => 'empire_builder_pool',
                    'eligible_level_slugs' => ['empire_builder'],
                ],
                'pathfinder_pool' => [
                    'percentage' => 2,
                    'commission_type' => 'pathfinder_pool',
                    'eligible_level_slugs' => ['pathfinder'],
                ],
                'galaxy_pulse_pool' => [
                    'percentage' => 1,
                    'commission_type' => 'galaxy_pulse_pool',
                    'eligible_level_slugs' => ['galaxy_pulse'],
                ],
            ],
        ];
    }

    protected function normalizeLevelsConfig(array $levels): array
    {
        if ($levels === []) {
            $levels = CommissionService::LEVELS;
        }

        $normalizedLevels = [];

        foreach ($levels as $level => $data) {
            if (! is_array($data)) {
                continue;
            }

            $levelKey = (int) $level;

            if ($levelKey <= 0) {
                continue;
            }

            $normalizedLevels[$levelKey] = [
                'name' => (string) ($data['name'] ?? ''),
                'threshold' => (float) ($data['threshold'] ?? 0),
                'slug' => (string) ($data['slug'] ?? ''),
            ];
        }

        return $normalizedLevels;
    }

    protected function createCommission(array $data): void
    {
        AffiliateCommission::create($data);

        $customer = Customer::find($data['customer_id']);

        if ($customer) {
            $customer->increment('lifetime_earnings', $data['commission_amount']);

            if ($data['status'] === 'approved') {
                $customer->increment('available_balance', $data['commission_amount']);
                $customer->increment('total_earned', $data['commission_amount']);
            }

            $this->updateCustomerLevel($customer);
        }
    }

    public function updateCustomerLevel(Customer $customer): void
    {
        $earnings = $customer->lifetime_earnings;
        $newLevel = 1;
        $newLevelName = 'Spark';
        $normalizedLevels = $this->normalizeLevelsConfig($this->distributionConfig()['levels'] ?? []);

        if ($normalizedLevels === []) {
            $normalizedLevels = CommissionService::LEVELS;
        }

        krsort($normalizedLevels);

        foreach ($normalizedLevels as $level => $data) {
            if ($earnings >= (float) $data['threshold']) {
                $newLevel = $level;
                $newLevelName = (string) $data['name'];
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

    protected function logDistributionSummary(array $context, float $totalDistributed, int $totalRecipients, $commissions): void
    {
        $baseAmount = $context['base_amount'];
        $order = $context['order'];
        $revenueId = $context['revenue_id'] ?? 0;
        $config = $context['config'];

        // Calculate max distributable amount based on all configured steps
        $maxDistributableAmount = 0;
        $stepBreakdown = [];

        // Referral commissions max
        $referralConfig = $config['referral'] ?? [];
        $levelRates = $referralConfig['level_rates'] ?? [];
        $referralMax = 0;
        foreach ($levelRates as $rate) {
            $referralMax += ($baseAmount * $rate) / 100;
        }
        $maxDistributableAmount += $referralMax;
        $stepBreakdown['referral_commissions'] = [
            'max' => $referralMax,
            'distributed' => $commissions->where('commission_type', 'like', 'referral_level_%')->sum('commission_amount'),
        ];

        // Pool commissions max
        $poolConfigs = $config['pools'] ?? [];
        foreach ($poolConfigs as $poolKey => $poolConfig) {
            $percentage = (float) ($poolConfig['percentage'] ?? 0);
            $poolMax = ($baseAmount * $percentage) / 100;
            $maxDistributableAmount += $poolMax;
            
            $commissionType = (string) ($poolConfig['commission_type'] ?? $poolKey);
            $stepBreakdown[$poolKey] = [
                'max' => $poolMax,
                'distributed' => $commissions->where('commission_type', $commissionType)->sum('commission_amount'),
            ];
        }

        // Create single summary record for the order
        CommissionDistributionLog::updateOrCreate(
            ['order_id' => $order->id],
            [
                'revenue_id' => $revenueId,
                'platform_fee_cut' => $baseAmount,
                'max_distributable_amount' => $maxDistributableAmount,
                'amount_distributed' => $totalDistributed,
                'total_recipients' => $totalRecipients,
                'distribution_breakdown' => $stepBreakdown,
                'status' => abs($totalDistributed - $maxDistributableAmount) < 0.01 ? 'completed' : 'partial',
                'notes' => "Order #{$order->id} - {$totalRecipients} recipients received commissions",
            ]
        );

        Log::info("Distribution summary logged for order #{$order->id}", [
            'max_distributable' => $maxDistributableAmount,
            'amount_distributed' => $totalDistributed,
            'total_recipients' => $totalRecipients,
        ]);
    }
}
