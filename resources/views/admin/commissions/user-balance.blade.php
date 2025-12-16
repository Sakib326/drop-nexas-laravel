@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            Balance Details for {{ $customer->name }} ({{ $customer->username }})
                        </h3>
                    </div>

                    <div class="card-body">
                        <!-- Balance Summary Cards -->
                        <div class="row mb-4">
                            <div class="col-md-2">
                                <div class="small-box bg-success">
                                    <div class="inner">
                                        <h3>৳{{ number_format($balanceBreakdown['available_balance'], 2) }}</h3>
                                        <p>Available Balance</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-money"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="small-box bg-info">
                                    <div class="inner">
                                        <h3>৳{{ number_format($balanceBreakdown['total_earned'], 2) }}</h3>
                                        <p>Total Earned</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-line-chart"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="small-box bg-warning">
                                    <div class="inner">
                                        <h3>৳{{ number_format($balanceBreakdown['lifetime_earnings'], 2) }}</h3>
                                        <p>Lifetime Earnings</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-star"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="small-box bg-danger">
                                    <div class="inner">
                                        <h3>৳{{ number_format($balanceBreakdown['total_withdrawn'], 2) }}</h3>
                                        <p>Total Withdrawn</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-arrow-down"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="small-box bg-secondary">
                                    <div class="inner">
                                        <h3>৳{{ number_format($balanceBreakdown['pending_withdrawals'], 2) }}</h3>
                                        <p>Pending Withdrawals</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-clock-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="small-box bg-primary">
                                    <div class="inner">
                                        <h3>Level {{ $customer->level }}</h3>
                                        <p>{{ $customer->level_name }}</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-trophy"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Commissions -->
                        <div class="mb-4">
                            <h5>Recent Commissions (Last 10)</h5>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Order</th>
                                            <th>Type</th>
                                            <th>Rate</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($recentCommissions as $commission)
                                            <tr>
                                                <td>{{ \Carbon\Carbon::parse($commission->created_at)->format('d M Y H:i') }}
                                                </td>
                                                <td>
                                                    @if ($commission->order_id)
                                                        <a href="{{ route('orders.edit', $commission->order_id) }}"
                                                            target="_blank">
                                                            {{ $commission->order_code }}
                                                        </a>
                                                    @else
                                                        <span class="badge badge-secondary">Pool</span>
                                                    @endif
                                                </td>
                                                <td>{{ ucwords(str_replace('_', ' ', $commission->commission_type)) }}</td>
                                                <td>{{ number_format($commission->commission_rate, 2) }}%</td>
                                                <td><strong>৳{{ number_format($commission->commission_amount, 2) }}</strong>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center">No commissions found</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                            <a href="{{ route('admin.commissions.user-history', $customer->id) }}"
                                class="btn btn-sm btn-primary">
                                View All Commissions
                            </a>
                        </div>

                        <hr>

                        <!-- Withdrawal History -->
                        <div>
                            <h5>Withdrawal History</h5>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Date Requested</th>
                                            <th>Amount</th>
                                            <th>Method</th>
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
                                                        <span class="text-muted">Not processed</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    <a href="{{ route('admin.withdrawals.edit', $withdrawal->id) }}"
                                                        class="btn btn-xs btn-primary">
                                                        <i class="fa fa-edit"></i> Manage
                                                    </a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="7" class="text-center">No withdrawals found</td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                            <a href="{{ route('admin.withdrawals.user-history', $customer->id) }}"
                                class="btn btn-sm btn-primary">
                                View All Withdrawals
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
