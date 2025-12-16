@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <!-- Statistics Cards -->
                <div class="row mb-3">
                    <div class="col-md-3">
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>{{ $stats->pending_count }}</h3>
                                <p>Pending Withdrawals</p>
                                <small>৳{{ number_format($stats->pending_amount, 2) }}</small>
                            </div>
                            <div class="icon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>{{ $stats->processing_count }}</h3>
                                <p>Processing</p>
                                <small>৳{{ number_format($stats->processing_amount, 2) }}</small>
                            </div>
                            <div class="icon">
                                <i class="fa fa-spinner"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>{{ $stats->completed_count }}</h3>
                                <p>Completed</p>
                                <small>৳{{ number_format($stats->completed_amount, 2) }}</small>
                            </div>
                            <div class="icon">
                                <i class="fa fa-check"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>{{ $stats->rejected_count }}</h3>
                                <p>Rejected</p>
                                <small>৳{{ number_format($stats->rejected_amount, 2) }}</small>
                            </div>
                            <div class="icon">
                                <i class="fa fa-times"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Withdrawal Management</h3>
                    </div>

                    <div class="card-body">
                        <!-- Filters -->
                        <form method="GET" action="{{ route('admin.withdrawals.index') }}" class="mb-4">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="status" class="form-control">
                                            <option value="">All Status</option>
                                            <option value="pending" {{ request('status') == 'pending' ? 'selected' : '' }}>
                                                Pending</option>
                                            <option value="processing"
                                                {{ request('status') == 'processing' ? 'selected' : '' }}>Processing
                                            </option>
                                            <option value="completed"
                                                {{ request('status') == 'completed' ? 'selected' : '' }}>Completed</option>
                                            <option value="rejected"
                                                {{ request('status') == 'rejected' ? 'selected' : '' }}>Rejected</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Customer</label>
                                        <select name="customer_id" class="form-control">
                                            <option value="">All Customers</option>
                                            @foreach ($customers as $customer)
                                                <option value="{{ $customer->id }}"
                                                    {{ request('customer_id') == $customer->id ? 'selected' : '' }}>
                                                    {{ $customer->name }} ({{ $customer->username }})
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Method</label>
                                        <select name="withdrawal_method" class="form-control">
                                            <option value="">All Methods</option>
                                            <option value="bank"
                                                {{ request('withdrawal_method') == 'bank' ? 'selected' : '' }}>Bank
                                            </option>
                                            <option value="mfs"
                                                {{ request('withdrawal_method') == 'mfs' ? 'selected' : '' }}>MFS</option>
                                            <option value="cash"
                                                {{ request('withdrawal_method') == 'cash' ? 'selected' : '' }}>Cash
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Date From</label>
                                        <input type="date" name="date_from" class="form-control"
                                            value="{{ request('date_from') }}">
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Date To</label>
                                        <input type="date" name="date_to" class="form-control"
                                            value="{{ request('date_to') }}">
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <div class="form-group">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" class="btn btn-primary btn-block">
                                                <i class="fa fa-filter"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- Withdrawals Table -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="select-all">
                                        </th>
                                        <th>ID</th>
                                        <th>Customer</th>
                                        <th>Amount</th>
                                        <th>Method</th>
                                        <th>Account Details</th>
                                        <th>Status</th>
                                        <th>Current Balance</th>
                                        <th>Requested</th>
                                        <th>Processed</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($withdrawals as $withdrawal)
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="withdrawal_ids[]"
                                                    value="{{ $withdrawal->id }}" class="withdrawal-checkbox">
                                            </td>
                                            <td>{{ $withdrawal->id }}</td>
                                            <td>
                                                <a
                                                    href="{{ route('admin.commissions.user-balance', $withdrawal->customer_id) }}">
                                                    {{ $withdrawal->customer_name }}<br>
                                                    <small class="text-muted">{{ $withdrawal->username }}</small>
                                                </a>
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
                                            <td>৳{{ number_format($withdrawal->current_balance, 2) }}</td>
                                            <td>{{ \Carbon\Carbon::parse($withdrawal->requested_at)->format('d M Y H:i') }}
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
                                                    class="btn btn-sm btn-primary" title="Manage Withdrawal">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="{{ route('admin.withdrawals.user-history', $withdrawal->customer_id) }}"
                                                    class="btn btn-sm btn-info" title="View User Withdrawals">
                                                    <i class="fa fa-history"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="11" class="text-center">No withdrawals found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <!-- Bulk Actions -->
                        <div class="mt-3 mb-3">
                            <button type="button" class="btn btn-info" onclick="bulkUpdateStatus('processing')">
                                <i class="fa fa-spinner"></i> Mark as Processing
                            </button>
                            <button type="button" class="btn btn-success" onclick="bulkUpdateStatus('completed')">
                                <i class="fa fa-check"></i> Mark as Completed
                            </button>
                            <button type="button" class="btn btn-danger" onclick="bulkUpdateStatus('rejected')">
                                <i class="fa fa-times"></i> Mark as Rejected
                            </button>
                        </div>

                        <!-- Pagination -->
                        <div class="mt-3">
                            {{ $withdrawals->appends(request()->query())->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Select all checkbox
        document.getElementById('select-all').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.withdrawal-checkbox');
            checkboxes.forEach(checkbox => checkbox.checked = this.checked);
        });

        // Bulk update function
        function bulkUpdateStatus(status) {
            const checkboxes = document.querySelectorAll('.withdrawal-checkbox:checked');
            if (checkboxes.length === 0) {
                alert('Please select at least one withdrawal');
                return;
            }

            const ids = Array.from(checkboxes).map(cb => cb.value);

            if (!confirm(`Are you sure you want to mark ${ids.length} withdrawal(s) as ${status}?`)) {
                return;
            }

            // Create form and submit
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '{{ route('admin.withdrawals.bulk-update') }}';

            // CSRF token
            const csrfInput = document.createElement('input');
            csrfInput.type = 'hidden';
            csrfInput.name = '_token';
            csrfInput.value = '{{ csrf_token() }}';
            form.appendChild(csrfInput);

            // Status
            const statusInput = document.createElement('input');
            statusInput.type = 'hidden';
            statusInput.name = 'status';
            statusInput.value = status;
            form.appendChild(statusInput);

            // IDs
            ids.forEach(id => {
                const idInput = document.createElement('input');
                idInput.type = 'hidden';
                idInput.name = 'withdrawal_ids[]';
                idInput.value = id;
                form.appendChild(idInput);
            });

            document.body.appendChild(form);
            form.submit();
        }
    </script>
@endsection
