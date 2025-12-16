<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Botble\Ecommerce\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommissionController extends Controller
{
    /**
     * Display a listing of all commissions
     */
    public function index(Request $request)
    {
        $query = DB::table('affiliate_commissions as ac')
            ->join('ec_customers as c', 'ac.customer_id', '=', 'c.id')
            ->leftJoin('ec_orders as o', 'ac.order_id', '=', 'o.id')
            ->select([
                'ac.id',
                'ac.customer_id',
                'ac.order_id',
                'ac.commission_type',
                'ac.commission_rate',
                'ac.order_amount',
                'ac.profit_amount',
                'ac.commission_amount',
                'ac.created_at',
                'ac.updated_at',
                'c.name as customer_name',
                'c.email as customer_email',
                'c.username',
                'o.code as order_code'
            ])
            ->orderBy('ac.created_at', 'desc');

        // Filter by customer
        if ($request->filled('customer_id')) {
            $query->where('ac.customer_id', $request->customer_id);
        }

        // Filter by commission type
        if ($request->filled('commission_type')) {
            $query->where('ac.commission_type', $request->commission_type);
        }

        // Filter by date range
        if ($request->filled('date_from')) {
            $query->where('ac.created_at', '>=', $request->date_from);
        }
        if ($request->filled('date_to')) {
            $query->where('ac.created_at', '<=', $request->date_to . ' 23:59:59');
        }

        $commissions = $query->paginate(20);

        // Get customers for filter dropdown
        $customers = Customer::select('id', 'name', 'username')
            ->orderBy('name')
            ->get();

        // Get commission types
        $commissionTypes = DB::table('affiliate_commissions')
            ->distinct()
            ->pluck('commission_type');

        return view('admin.commissions.index', compact('commissions', 'customers', 'commissionTypes'));
    }

    /**
     * Display user-specific commission history
     */
    public function userCommissions($customerId)
    {
        $customer = Customer::findOrFail($customerId);

        // Get all commissions for this customer
        $commissions = DB::table('affiliate_commissions as ac')
            ->leftJoin('ec_orders as o', 'ac.order_id', '=', 'o.id')
            ->where('ac.customer_id', $customerId)
            ->select([
                'ac.*',
                'o.code as order_code'
            ])
            ->orderBy('ac.created_at', 'desc')
            ->paginate(20);

        // Get commission summary
        $summary = DB::table('affiliate_commissions')
            ->where('customer_id', $customerId)
            ->select([
                DB::raw('COUNT(*) as total_commissions'),
                DB::raw('SUM(commission_amount) as total_earned'),
                DB::raw('SUM(CASE WHEN commission_type LIKE "referral_level_%" THEN commission_amount ELSE 0 END) as referral_earnings'),
                DB::raw('SUM(CASE WHEN commission_type = "global_thrive_pool" THEN commission_amount ELSE 0 END) as global_thrive_earnings'),
                DB::raw('SUM(CASE WHEN commission_type = "empire_builder_pool" THEN commission_amount ELSE 0 END) as empire_builder_earnings'),
            ])
            ->first();

        // Get commission breakdown by type
        $breakdown = DB::table('affiliate_commissions')
            ->where('customer_id', $customerId)
            ->select([
                'commission_type',
                DB::raw('COUNT(*) as count'),
                DB::raw('SUM(commission_amount) as total'),
                DB::raw('AVG(commission_rate) as avg_rate')
            ])
            ->groupBy('commission_type')
            ->orderBy('total', 'desc')
            ->get();

        return view('admin.commissions.user-history', compact('customer', 'commissions', 'summary', 'breakdown'));
    }

    /**
     * Display user's referral hierarchy (downline)
     */
    public function userHierarchy($customerId)
    {
        $customer = Customer::findOrFail($customerId);

        // Get direct referrals (level 1)
        $hierarchy = $this->buildHierarchyTree($customer->username, 6);

        // Get hierarchy stats
        $stats = $this->getHierarchyStats($customer->username);

        return view('admin.commissions.user-hierarchy', compact('customer', 'hierarchy', 'stats'));
    }

    /**
     * Build referral hierarchy tree recursively
     */
    private function buildHierarchyTree($username, $maxDepth = 6, $currentDepth = 1)
    {
        if ($currentDepth > $maxDepth) {
            return [];
        }

        $referrals = Customer::where('referral_username', $username)
            ->select([
                'id',
                'name',
                'username',
                'email',
                'referral_username',
                'available_balance',
                'total_earned',
                'lifetime_earnings',
                'level',
                'level_name',
                'created_at'
            ])
            ->get();

        $tree = [];
        foreach ($referrals as $referral) {
            $tree[] = [
                'customer' => $referral,
                'depth' => $currentDepth,
                'children' => $this->buildHierarchyTree($referral->username, $maxDepth, $currentDepth + 1)
            ];
        }

        return $tree;
    }

    /**
     * Get hierarchy statistics
     */
    private function getHierarchyStats($username, $maxDepth = 6)
    {
        $stats = [
            'total_by_level' => [],
            'total_members' => 0,
            'total_earnings' => 0,
            'total_commissions_generated' => 0
        ];

        for ($level = 1; $level <= $maxDepth; $level++) {
            $members = $this->getMembersAtLevel($username, $level);
            $count = count($members);

            $stats['total_by_level'][$level] = [
                'count' => $count,
                'total_earnings' => $members->sum('lifetime_earnings')
            ];

            $stats['total_members'] += $count;
            $stats['total_earnings'] += $members->sum('lifetime_earnings');
        }

        // Get total commissions this user earned from their downline
        $stats['total_commissions_generated'] = DB::table('affiliate_commissions')
            ->whereIn('customer_id', function ($query) use ($username) {
                $query->select('id')
                    ->from('ec_customers')
                    ->where('username', $username);
            })
            ->sum('commission_amount');

        return $stats;
    }

    /**
     * Get all members at a specific level
     */
    private function getMembersAtLevel($username, $targetLevel, $currentLevel = 0)
    {
        if ($currentLevel >= $targetLevel) {
            return collect();
        }

        if ($currentLevel == 0) {
            // Get direct referrals
            $referrals = Customer::where('referral_username', $username)->get();

            if ($targetLevel == 1) {
                return $referrals;
            }

            $nextLevel = collect();
            foreach ($referrals as $referral) {
                $nextLevel = $nextLevel->merge(
                    $this->getMembersAtLevel($referral->username, $targetLevel, 1)
                );
            }
            return $nextLevel;
        }

        $referrals = Customer::where('referral_username', $username)->get();

        if ($currentLevel + 1 == $targetLevel) {
            return $referrals;
        }

        $nextLevel = collect();
        foreach ($referrals as $referral) {
            $nextLevel = $nextLevel->merge(
                $this->getMembersAtLevel($referral->username, $targetLevel, $currentLevel + 1)
            );
        }

        return $nextLevel;
    }

    /**
     * Display customer balance details
     */
    public function userBalance($customerId)
    {
        $customer = Customer::findOrFail($customerId);

        // Get withdrawal history
        $withdrawals = DB::table('affiliate_withdrawals')
            ->where('customer_id', $customerId)
            ->orderBy('created_at', 'desc')
            ->get();

        // Get recent commissions
        $recentCommissions = DB::table('affiliate_commissions as ac')
            ->leftJoin('ec_orders as o', 'ac.order_id', '=', 'o.id')
            ->where('ac.customer_id', $customerId)
            ->select(['ac.*', 'o.code as order_code'])
            ->orderBy('ac.created_at', 'desc')
            ->limit(10)
            ->get();

        // Calculate balance breakdown
        $balanceBreakdown = [
            'available_balance' => $customer->available_balance,
            'total_earned' => $customer->total_earned,
            'lifetime_earnings' => $customer->lifetime_earnings,
            'total_withdrawn' => $withdrawals->where('status', 'completed')->sum('amount'),
            'pending_withdrawals' => $withdrawals->whereIn('status', ['pending', 'processing'])->sum('amount'),
        ];

        return view('admin.commissions.user-balance', compact('customer', 'withdrawals', 'recentCommissions', 'balanceBreakdown'));
    }
}
