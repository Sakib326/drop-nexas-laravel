<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Botble\Ecommerce\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class WithdrawalController extends Controller
{
    /**
     * Display a listing of all withdrawals
     */
    public function index(Request $request)
    {
        $query = DB::table('affiliate_withdrawals as aw')
            ->join('ec_customers as c', 'aw.customer_id', '=', 'c.id')
            ->select([
                'aw.*',
                'c.name as customer_name',
                'c.email as customer_email',
                'c.username',
                'c.available_balance as current_balance'
            ])
            ->orderBy('aw.created_at', 'desc');

        // Filter by status
        if ($request->filled('status')) {
            $query->where('aw.status', $request->status);
        }

        // Filter by customer
        if ($request->filled('customer_id')) {
            $query->where('aw.customer_id', $request->customer_id);
        }

        // Filter by withdrawal method
        if ($request->filled('withdrawal_method')) {
            $query->where('aw.withdrawal_method', $request->withdrawal_method);
        }

        // Filter by date range
        if ($request->filled('date_from')) {
            $query->where('aw.requested_at', '>=', $request->date_from);
        }
        if ($request->filled('date_to')) {
            $query->where('aw.requested_at', '<=', $request->date_to . ' 23:59:59');
        }

        $withdrawals = $query->paginate(20);

        // Get customers for filter dropdown
        $customers = Customer::select('id', 'name', 'username')
            ->orderBy('name')
            ->get();

        // Get statistics
        $stats = $this->getWithdrawalStats();

        return view('admin.withdrawals.index', compact('withdrawals', 'customers', 'stats'));
    }

    /**
     * Display user-specific withdrawal history
     */
    public function userWithdrawals($customerId)
    {
        $customer = Customer::findOrFail($customerId);

        $withdrawals = DB::table('affiliate_withdrawals')
            ->where('customer_id', $customerId)
            ->orderBy('requested_at', 'desc')
            ->paginate(20);

        // Get withdrawal summary
        $summary = DB::table('affiliate_withdrawals')
            ->where('customer_id', $customerId)
            ->select([
                DB::raw('COUNT(*) as total_requests'),
                DB::raw('SUM(CASE WHEN status = "completed" THEN amount ELSE 0 END) as total_withdrawn'),
                DB::raw('SUM(CASE WHEN status = "pending" THEN amount ELSE 0 END) as pending_amount'),
                DB::raw('SUM(CASE WHEN status = "processing" THEN amount ELSE 0 END) as processing_amount'),
                DB::raw('SUM(CASE WHEN status = "rejected" THEN amount ELSE 0 END) as rejected_amount'),
            ])
            ->first();

        return view('admin.withdrawals.user-history', compact('customer', 'withdrawals', 'summary'));
    }

    /**
     * Show the form for editing a withdrawal
     */
    public function edit($id)
    {
        $withdrawal = DB::table('affiliate_withdrawals as aw')
            ->join('ec_customers as c', 'aw.customer_id', '=', 'c.id')
            ->where('aw.id', $id)
            ->select([
                'aw.*',
                'c.name as customer_name',
                'c.email as customer_email',
                'c.username',
                'c.available_balance as current_balance'
            ])
            ->first();

        if (!$withdrawal) {
            return redirect()->route('admin.withdrawals.index')
                ->with('error', 'Withdrawal not found');
        }

        return view('admin.withdrawals.edit', compact('withdrawal'));
    }

    /**
     * Update withdrawal status
     */
    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,processing,completed,rejected',
            'admin_notes' => 'nullable|string|max:1000',
            'rejection_reason' => 'required_if:status,rejected|nullable|string|max:500'
        ]);

        DB::beginTransaction();

        try {
            // Get withdrawal details
            $withdrawal = DB::table('affiliate_withdrawals')->where('id', $id)->first();

            if (!$withdrawal) {
                throw new \Exception('Withdrawal not found');
            }

            $oldStatus = $withdrawal->status;
            $newStatus = $request->status;

            // Get customer
            $customer = Customer::find($withdrawal->customer_id);

            if (!$customer) {
                throw new \Exception('Customer not found');
            }

            Log::info('Withdrawal status change initiated', [
                'withdrawal_id' => $id,
                'customer_id' => $customer->id,
                'old_status' => $oldStatus,
                'new_status' => $newStatus,
                'amount' => $withdrawal->amount,
                'current_balance' => $customer->available_balance
            ]);

            // Handle balance adjustments based on status change
            $this->adjustBalanceForStatusChange(
                $customer,
                $withdrawal->amount,
                $oldStatus,
                $newStatus
            );

            // Update withdrawal record
            $updateData = [
                'status' => $newStatus,
                'admin_notes' => $request->admin_notes,
                'updated_at' => now()
            ];

            if ($newStatus === 'completed') {
                $updateData['processed_at'] = now();
            }

            if ($newStatus === 'rejected') {
                $updateData['rejection_reason'] = $request->rejection_reason;
                $updateData['processed_at'] = now();
            }

            DB::table('affiliate_withdrawals')
                ->where('id', $id)
                ->update($updateData);

            DB::commit();

            Log::info('Withdrawal status updated successfully', [
                'withdrawal_id' => $id,
                'new_status' => $newStatus,
                'new_balance' => $customer->fresh()->available_balance
            ]);

            return redirect()->back()
                ->with('success', 'Withdrawal status updated successfully');

        } catch (\Exception $e) {
            DB::rollBack();

            Log::error('Withdrawal status update failed', [
                'withdrawal_id' => $id,
                'error' => $e->getMessage()
            ]);

            return redirect()->back()
                ->with('error', 'Failed to update withdrawal status: ' . $e->getMessage());
        }
    }

    /**
     * Adjust customer balance based on status change
     */
    private function adjustBalanceForStatusChange($customer, $amount, $oldStatus, $newStatus)
    {
        Log::info('Adjusting balance for status change', [
            'customer_id' => $customer->id,
            'amount' => $amount,
            'old_status' => $oldStatus,
            'new_status' => $newStatus,
            'current_available_balance' => $customer->available_balance
        ]);

        // Status transition rules:
        // 1. pending -> processing: No balance change (already deducted when withdrawal was created)
        // 2. pending -> completed: No balance change (already deducted)
        // 3. pending -> rejected: Restore balance (refund)
        // 4. processing -> completed: No balance change
        // 5. processing -> rejected: Restore balance (refund)
        // 6. processing -> pending: No balance change
        // 7. completed -> rejected: Should not allow (money already sent)
        // 8. completed -> pending: Should not allow (money already sent)
        // 9. rejected -> pending: Deduct balance again
        // 10. rejected -> processing: Deduct balance again

        // If changing FROM completed, don't allow (except in special cases)
        if ($oldStatus === 'completed' && $newStatus !== 'completed') {
            throw new \Exception('Cannot change status from completed. Money has already been sent.');
        }

        // If changing TO completed, update total_withdrawn
        if ($newStatus === 'completed' && $oldStatus !== 'completed') {
            $customer->total_withdrawn = ($customer->total_withdrawn ?? 0) + $amount;
            $customer->save();

            Log::info('Total withdrawn updated', [
                'customer_id' => $customer->id,
                'amount_withdrawn' => $amount,
                'total_withdrawn' => $customer->total_withdrawn
            ]);
        }

        // If changing TO rejected from pending/processing, restore the balance
        if (in_array($oldStatus, ['pending', 'processing']) && $newStatus === 'rejected') {
            $customer->available_balance += $amount;
            $customer->save();

            Log::info('Balance restored due to rejection', [
                'customer_id' => $customer->id,
                'amount_restored' => $amount,
                'new_balance' => $customer->available_balance
            ]);
        }

        // If changing FROM rejected back to pending/processing, deduct balance again
        if ($oldStatus === 'rejected' && in_array($newStatus, ['pending', 'processing'])) {
            if ($customer->available_balance < $amount) {
                throw new \Exception('Customer does not have sufficient balance. Current balance: ৳' . number_format($customer->available_balance, 2));
            }

            $customer->available_balance -= $amount;
            $customer->save();

            Log::info('Balance deducted for re-processing', [
                'customer_id' => $customer->id,
                'amount_deducted' => $amount,
                'new_balance' => $customer->available_balance
            ]);
        }

        // All other transitions (pending->processing, processing->completed, etc.) don't change balance
    }

    /**
     * Get withdrawal statistics
     */
    private function getWithdrawalStats()
    {
        return DB::table('affiliate_withdrawals')
            ->select([
                DB::raw('COUNT(*) as total_requests'),
                DB::raw('SUM(amount) as total_amount'),
                DB::raw('SUM(CASE WHEN status = "pending" THEN amount ELSE 0 END) as pending_amount'),
                DB::raw('SUM(CASE WHEN status = "processing" THEN amount ELSE 0 END) as processing_amount'),
                DB::raw('SUM(CASE WHEN status = "completed" THEN amount ELSE 0 END) as completed_amount'),
                DB::raw('SUM(CASE WHEN status = "rejected" THEN amount ELSE 0 END) as rejected_amount'),
                DB::raw('COUNT(CASE WHEN status = "pending" THEN 1 END) as pending_count'),
                DB::raw('COUNT(CASE WHEN status = "processing" THEN 1 END) as processing_count'),
                DB::raw('COUNT(CASE WHEN status = "completed" THEN 1 END) as completed_count'),
                DB::raw('COUNT(CASE WHEN status = "rejected" THEN 1 END) as rejected_count'),
            ])
            ->first();
    }

    /**
     * Bulk update withdrawal statuses
     */
    public function bulkUpdate(Request $request)
    {
        $request->validate([
            'withdrawal_ids' => 'required|array',
            'withdrawal_ids.*' => 'exists:affiliate_withdrawals,id',
            'status' => 'required|in:processing,completed,rejected',
            'admin_notes' => 'nullable|string|max:1000',
            'rejection_reason' => 'required_if:status,rejected|nullable|string|max:500'
        ]);

        $successCount = 0;
        $failCount = 0;
        $errors = [];

        foreach ($request->withdrawal_ids as $id) {
            try {
                $this->updateStatus(new Request([
                    'status' => $request->status,
                    'admin_notes' => $request->admin_notes,
                    'rejection_reason' => $request->rejection_reason
                ]), $id);
                $successCount++;
            } catch (\Exception $e) {
                $failCount++;
                $errors[] = "Withdrawal #{$id}: " . $e->getMessage();
            }
        }

        $message = "Successfully updated {$successCount} withdrawal(s).";
        if ($failCount > 0) {
            $message .= " Failed: {$failCount}. Errors: " . implode('; ', $errors);
        }

        return redirect()->back()->with($failCount > 0 ? 'warning' : 'success', $message);
    }
}
