@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Customer Information</h4>
                    </div>
                    <div class="card-body">
                        <p><strong>Name:</strong> {{ $customer->name }}</p>
                        <p><strong>Username:</strong> {{ $customer->username }}</p>
                        <p><strong>Email:</strong> {{ $customer->email }}</p>
                        <p><strong>Available Balance:</strong> ৳{{ number_format($customer->available_balance, 2) }}</p>
                        <p><strong>Total Earned:</strong> ৳{{ number_format($customer->total_earned, 2) }}</p>

                        <hr>

                        <div class="btn-group-vertical w-100">
                            <a href="{{ route('admin.commissions.user-history', $customer->id) }}" class="btn btn-info">
                                <i class="fa fa-history"></i> View Commissions
                            </a>
                            <a href="{{ route('admin.commissions.user-balance', $customer->id) }}" class="btn btn-success">
                                <i class="fa fa-money"></i> View Balance Details
                            </a>
                            <a href="{{ route('customers.edit', $customer->id) }}" class="btn btn-secondary">
                                <i class="fa fa-edit"></i> Edit Customer
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Summary Card -->
                <div class="card mt-3">
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">Withdrawal Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <small class="text-muted">Total Requests</small>
                            <h4>{{ number_format($summary->total_requests) }}</h4>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Total Withdrawn</small>
                            <h4 class="text-success">৳{{ number_format($summary->total_withdrawn, 2) }}</h4>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Pending Amount</small>
                            <h5 class="text-warning">৳{{ number_format($summary->pending_amount, 2) }}</h5>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Processing Amount</small>
                            <h5 class="text-info">৳{{ number_format($summary->processing_amount, 2) }}</h5>
                        </div>
                        <div>
                            <small class="text-muted">Rejected Amount</small>
                            <h5 class="text-danger">৳{{ number_format($summary->rejected_amount, 2) }}</h5>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Withdrawal History</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Date Requested</th>
                                        <th>Amount</th>
                                        <th>Method</th>
                                        <th>Account Details</th>
                                        <th>Status</th>
                                        <th>Processed Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($withdrawals as $withdrawal)
                                        <tr>
                                            <td>{{ $withdrawal->id }}</td>
                                            <td>{{ \Carbon\Carbon::parse($withdrawal->requested_at)->format('d M Y H:i') }}
                                            </td>
                                            <td><strong>৳{{ number_format($withdrawal->amount, 2) }}</strong></td>
                                            <td>
                                                <span class="badge badge-secondary">
                                                    {{ strtoupper($withdrawal->withdrawal_method) }}
                                                </span>
                                            </td>
                                            <td>
                                                <small>{{ \Illuminate\Support\Str::limit($withdrawal->account_details, 30) }}</small>
                                            </td>
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
                                            <td>
                                                @if ($withdrawal->processed_at)
                                                    {{ \Carbon\Carbon::parse($withdrawal->processed_at)->format('d M Y H:i') }}
                                                @else
                                                    <span class="text-muted">-</span>
                                                @endif
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.withdrawals.edit', $withdrawal->id) }}"
                                                    class="btn btn-xs btn-primary">
                                                    <i class="fa fa-edit"></i> Manage
                                                </a>
                                            </td>
                                        </tr>
                                        @if ($withdrawal->rejection_reason)
                                            <tr>
                                                <td colspan="8" class="bg-danger text-white">
                                                    <small><strong>Rejection Reason:</strong>
                                                        {{ $withdrawal->rejection_reason }}</small>
                                                </td>
                                            </tr>
                                        @endif
                                        @if ($withdrawal->admin_notes)
                                            <tr>
                                                <td colspan="8" class="bg-info text-white">
                                                    <small><strong>Admin Notes:</strong>
                                                        {{ $withdrawal->admin_notes }}</small>
                                                </td>
                                            </tr>
                                        @endif
                                    @empty
                                        <tr>
                                            <td colspan="8" class="text-center">No withdrawals found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <div class="mt-3">
                            {{ $withdrawals->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
