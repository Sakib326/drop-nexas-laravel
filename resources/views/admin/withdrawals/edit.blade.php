@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="card-title mb-0">Manage Withdrawal #{{ $withdrawal->id }}</h3>
                    </div>

                    <form method="POST" action="{{ route('admin.withdrawals.update-status', $withdrawal->id) }}">
                        @csrf
                        @method('PUT')

                        <div class="card-body">
                            <!-- Withdrawal Details -->
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <h5>Withdrawal Information</h5>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th width="40%">ID</th>
                                            <td>{{ $withdrawal->id }}</td>
                                        </tr>
                                        <tr>
                                            <th>Amount</th>
                                            <td><strong
                                                    class="text-success">৳{{ number_format($withdrawal->amount, 2) }}</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Method</th>
                                            <td>
                                                <span class="badge badge-secondary">
                                                    {{ strtoupper($withdrawal->withdrawal_method) }}
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Current Status</th>
                                            <td>
                                                @if ($withdrawal->status == 'completed')
                                                    <span class="badge badge-success">Completed</span>
                                                @elseif($withdrawal->status == 'processing')
                                                    <span class="badge badge-info">Processing</span>
                                                @elseif($withdrawal->status == 'pending')
                                                    <span class="badge badge-warning">Pending</span>
                                                @else
                                                    <span class="badge badge-danger">Rejected</span>
                                                @endif
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Requested At</th>
                                            <td>{{ \Carbon\Carbon::parse($withdrawal->requested_at)->format('d M Y, H:i A') }}
                                            </td>
                                        </tr>
                                        @if ($withdrawal->processed_at)
                                            <tr>
                                                <th>Processed At</th>
                                                <td>{{ \Carbon\Carbon::parse($withdrawal->processed_at)->format('d M Y, H:i A') }}
                                                </td>
                                            </tr>
                                        @endif
                                    </table>
                                </div>

                                <div class="col-md-6">
                                    <h5>Customer Information</h5>
                                    <table class="table table-bordered">
                                        <tr>
                                            <th width="40%">Name</th>
                                            <td>
                                                <a href="{{ route('customers.edit', $withdrawal->customer_id) }}"
                                                    target="_blank">
                                                    {{ $withdrawal->customer_name }}
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Username</th>
                                            <td>{{ $withdrawal->username }}</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>{{ $withdrawal->customer_email }}</td>
                                        </tr>
                                        <tr>
                                            <th>Current Balance</th>
                                            <td><strong>৳{{ number_format($withdrawal->current_balance, 2) }}</strong></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <a href="{{ route('admin.commissions.user-balance', $withdrawal->customer_id) }}"
                                                    class="btn btn-sm btn-info btn-block">
                                                    <i class="fa fa-eye"></i> View Full Balance Details
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <!-- Account Details -->
                            <div class="mb-4">
                                <h5>Account Details</h5>
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <pre class="mb-0">{{ $withdrawal->account_details }}</pre>
                                    </div>
                                </div>
                            </div>

                            @if ($withdrawal->rejection_reason)
                                <div class="mb-4">
                                    <h5>Rejection Reason</h5>
                                    <div class="alert alert-danger">
                                        {{ $withdrawal->rejection_reason }}
                                    </div>
                                </div>
                            @endif

                            @if ($withdrawal->admin_notes)
                                <div class="mb-4">
                                    <h5>Previous Admin Notes</h5>
                                    <div class="alert alert-info">
                                        {{ $withdrawal->admin_notes }}
                                    </div>
                                </div>
                            @endif

                            <hr>

                            <!-- Status Update Form -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="status">Update Status <span class="text-danger">*</span></label>
                                        <select name="status" id="status" class="form-control" required>
                                            <option value="pending"
                                                {{ $withdrawal->status == 'pending' ? 'selected' : '' }}>Pending</option>
                                            <option value="processing"
                                                {{ $withdrawal->status == 'processing' ? 'selected' : '' }}>Processing
                                            </option>
                                            <option value="completed"
                                                {{ $withdrawal->status == 'completed' ? 'selected' : '' }}>Completed
                                            </option>
                                            <option value="rejected"
                                                {{ $withdrawal->status == 'rejected' ? 'selected' : '' }}>Rejected</option>
                                        </select>
                                        @if ($withdrawal->status == 'completed')
                                            <small class="text-danger">
                                                <i class="fa fa-warning"></i> Cannot change status from completed
                                            </small>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="form-group" id="rejection-reason-group" style="display: none;">
                                <label for="rejection_reason">Rejection Reason <span class="text-danger">*</span></label>
                                <textarea name="rejection_reason" id="rejection_reason" class="form-control" rows="3"
                                    placeholder="Enter the reason for rejection...">{{ old('rejection_reason', $withdrawal->rejection_reason) }}</textarea>
                                <small class="text-muted">This will be visible to the customer</small>
                            </div>

                            <div class="form-group">
                                <label for="admin_notes">Admin Notes (Optional)</label>
                                <textarea name="admin_notes" id="admin_notes" class="form-control" rows="3"
                                    placeholder="Add any internal notes...">{{ old('admin_notes', $withdrawal->admin_notes) }}</textarea>
                                <small class="text-muted">For internal use only, not visible to customer</small>
                            </div>

                            <!-- Balance Impact Warning -->
                            <div class="alert alert-warning" id="balance-warning" style="display: none;">
                                <i class="fa fa-warning"></i> <strong>Balance Impact:</strong>
                                <p class="mb-0" id="balance-impact-text"></p>
                            </div>
                        </div>

                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-save"></i> Update Withdrawal Status
                            </button>
                            <a href="{{ route('admin.withdrawals.index') }}" class="btn btn-secondary">
                                <i class="fa fa-arrow-left"></i> Back to List
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Quick Actions Sidebar -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">Quick Actions</h4>
                    </div>
                    <div class="card-body">
                        <div class="btn-group-vertical w-100">
                            <a href="{{ route('admin.commissions.user-history', $withdrawal->customer_id) }}"
                                class="btn btn-info mb-2">
                                <i class="fa fa-history"></i> View Commission History
                            </a>
                            <a href="{{ route('admin.withdrawals.user-history', $withdrawal->customer_id) }}"
                                class="btn btn-success mb-2">
                                <i class="fa fa-list"></i> View All Withdrawals
                            </a>
                            <a href="{{ route('admin.commissions.user-hierarchy', $withdrawal->customer_id) }}"
                                class="btn btn-warning mb-2">
                                <i class="fa fa-sitemap"></i> View Network Hierarchy
                            </a>
                            <a href="{{ route('customers.edit', $withdrawal->customer_id) }}"
                                class="btn btn-secondary mb-2" target="_blank">
                                <i class="fa fa-user"></i> Edit Customer Profile
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Status Change Guide -->
                <div class="card mt-3">
                    <div class="card-header bg-secondary text-white">
                        <h4 class="mb-0">Status Change Guide</h4>
                    </div>
                    <div class="card-body">
                        <small>
                            <p><strong>Pending → Processing:</strong> No balance change</p>
                            <p><strong>Processing → Completed:</strong> No balance change</p>
                            <p><strong>Pending/Processing → Rejected:</strong> Balance will be restored</p>
                            <p><strong>Rejected → Pending/Processing:</strong> Balance will be deducted again</p>
                            <p class="text-danger"><strong>Completed → Any:</strong> Not allowed (money already sent)</p>
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const statusSelect = document.getElementById('status');
            const rejectionGroup = document.getElementById('rejection-reason-group');
            const rejectionTextarea = document.getElementById('rejection_reason');
            const balanceWarning = document.getElementById('balance-warning');
            const balanceImpactText = document.getElementById('balance-impact-text');

            const originalStatus = '{{ $withdrawal->status }}';
            const withdrawalAmount = {{ $withdrawal->amount }};
            const currentBalance = {{ $withdrawal->current_balance }};

            function updateFormDisplay() {
                const newStatus = statusSelect.value;

                // Show/hide rejection reason
                if (newStatus === 'rejected') {
                    rejectionGroup.style.display = 'block';
                    rejectionTextarea.required = true;
                } else {
                    rejectionGroup.style.display = 'none';
                    rejectionTextarea.required = false;
                }

                // Show balance impact warning
                let impactText = '';
                let showWarning = false;

                if (['pending', 'processing'].includes(originalStatus) && newStatus === 'rejected') {
                    impactText =
                        `Customer's balance will be restored by ৳${withdrawalAmount.toFixed(2)}. New balance will be: ৳${(currentBalance + withdrawalAmount).toFixed(2)}`;
                    showWarning = true;
                } else if (originalStatus === 'rejected' && ['pending', 'processing'].includes(newStatus)) {
                    impactText =
                        `Customer's balance will be deducted by ৳${withdrawalAmount.toFixed(2)}. New balance will be: ৳${(currentBalance - withdrawalAmount).toFixed(2)}`;
                    showWarning = true;
                    if (currentBalance < withdrawalAmount) {
                        impactText +=
                            '<br><strong class="text-danger">WARNING: Customer has insufficient balance!</strong>';
                    }
                }

                if (showWarning) {
                    balanceImpactText.innerHTML = impactText;
                    balanceWarning.style.display = 'block';
                } else {
                    balanceWarning.style.display = 'none';
                }
            }

            statusSelect.addEventListener('change', updateFormDisplay);
            updateFormDisplay(); // Initial call
        });
    </script>
@endsection
