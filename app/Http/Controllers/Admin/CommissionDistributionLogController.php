<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CommissionDistributionLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommissionDistributionLogController extends Controller
{
    public function index(Request $request)
    {
        $baseQuery = CommissionDistributionLog::query()
            ->leftJoin('ec_orders as orders', 'commission_distribution_logs.order_id', '=', 'orders.id')
            ->leftJoin('ec_customers as customers', 'orders.user_id', '=', 'customers.id');

        if ($request->filled('status')) {
            $baseQuery->where('commission_distribution_logs.status', $request->input('status'));
        }

        if ($request->filled('order')) {
            $order = trim((string) $request->input('order'));

            $baseQuery->where(function ($query) use ($order): void {
                $query
                    ->where('commission_distribution_logs.order_id', $order)
                    ->orWhere('orders.code', 'like', '%' . $order . '%');
            });
        }

        if ($request->filled('date_from')) {
            $baseQuery->where('commission_distribution_logs.created_at', '>=', $request->input('date_from'));
        }

        if ($request->filled('date_to')) {
            $baseQuery->where('commission_distribution_logs.created_at', '<=', $request->input('date_to') . ' 23:59:59');
        }

        $query = (clone $baseQuery)
            ->select([
                'commission_distribution_logs.*',
                'orders.code as order_code',
                'orders.user_id as customer_id',
                'customers.name as customer_name',
                'customers.email as customer_email',
                'customers.username as customer_username',
                DB::raw('((commission_distribution_logs.max_distributable_amount * 1.25) - commission_distribution_logs.amount_distributed) as total_profit'),
            ])
            ->orderByDesc('commission_distribution_logs.created_at');

        $summary = (clone $baseQuery)
            ->toBase()
            ->selectRaw('
                COUNT(*) as total_logs,
                COALESCE(SUM(commission_distribution_logs.platform_fee_cut), 0) as platform_fee_cut,
                COALESCE(SUM(commission_distribution_logs.max_distributable_amount), 0) as max_distributable_amount,
                COALESCE(SUM(commission_distribution_logs.amount_distributed), 0) as amount_distributed,
                COALESCE(SUM(commission_distribution_logs.total_recipients), 0) as total_recipients,
                COALESCE(SUM((commission_distribution_logs.max_distributable_amount * 1.25) - commission_distribution_logs.amount_distributed), 0) as total_profit
            ')
            ->first();

        $statusSummary = (clone $baseQuery)
            ->toBase()
            ->selectRaw('commission_distribution_logs.status, COUNT(*) as count, COALESCE(SUM(commission_distribution_logs.amount_distributed), 0) as distributed')
            ->groupBy('commission_distribution_logs.status')
            ->orderBy('commission_distribution_logs.status')
            ->get();

        $logs = $query->paginate(20)->withQueryString();

        $statuses = CommissionDistributionLog::query()
            ->whereNotNull('status')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');

        return view('admin.commission-distribution-logs.index', compact('logs', 'summary', 'statusSummary', 'statuses'));
    }
}
