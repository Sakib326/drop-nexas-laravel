@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <!-- Customer Info Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Customer Information</h4>
                    </div>
                    <div class="card-body">
                        <p><strong>Name:</strong> {{ $customer->name }}</p>
                        <p><strong>Username:</strong> {{ $customer->username }}</p>
                        <p><strong>Email:</strong> {{ $customer->email }}</p>
                        <p><strong>Level:</strong>
                            <span class="badge badge-{{ $customer->getLevelBadgeColor() }}">
                                Level {{ $customer->level }} - {{ $customer->level_name }}
                            </span>
                        </p>
                        <p><strong>Lifetime Earnings:</strong> ৳{{ number_format($customer->lifetime_earnings, 2) }}</p>
                        <p><strong>Available Balance:</strong> ৳{{ number_format($customer->available_balance, 2) }}</p>
                        <p><strong>Total Earned:</strong> ৳{{ number_format($customer->total_earned, 2) }}</p>

                        <hr>

                        <div class="btn-group-vertical w-100">
                            <a href="{{ route('admin.commissions.user-hierarchy', $customer->id) }}" class="btn btn-info">
                                <i class="fa fa-sitemap"></i> View Hierarchy
                            </a>
                            <a href="{{ route('admin.commissions.user-balance', $customer->id) }}" class="btn btn-success">
                                <i class="fa fa-money"></i> View Balance Details
                            </a>
                            <a href="{{ route('admin.withdrawals.user-history', $customer->id) }}" class="btn btn-warning">
                                <i class="fa fa-arrow-down"></i> View Withdrawals
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
                        <h4 class="mb-0">Commission Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <small class="text-muted">Total Commissions</small>
                            <h4>{{ number_format($summary->total_commissions) }}</h4>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Total Earned</small>
                            <h4 class="text-success">৳{{ number_format($summary->total_earned, 2) }}</h4>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Referral Earnings</small>
                            <h5>৳{{ number_format($summary->referral_earnings, 2) }}</h5>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted">Global Thrive Earnings</small>
                            <h5>৳{{ number_format($summary->global_thrive_earnings, 2) }}</h5>
                        </div>
                        <div>
                            <small class="text-muted">Empire Builder Earnings</small>
                            <h5>৳{{ number_format($summary->empire_builder_earnings, 2) }}</h5>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Commission History -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Commission History</h3>
                    </div>
                    <div class="card-body">
                        <!-- Breakdown by Type -->
                        <div class="mb-4">
                            <h5>Breakdown by Type</h5>
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead>
                                        <tr>
                                            <th>Type</th>
                                            <th>Count</th>
                                            <th>Avg Rate</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($breakdown as $item)
                                            <tr>
                                                <td>{{ ucwords(str_replace('_', ' ', $item->commission_type)) }}</td>
                                                <td>{{ $item->count }}</td>
                                                <td>{{ number_format($item->avg_rate, 2) }}%</td>
                                                <td><strong>৳{{ number_format($item->total, 2) }}</strong></td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <hr>

                        <!-- Commission List -->
                        <h5>All Commissions</h5>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Date</th>
                                        <th>Order</th>
                                        <th>Type</th>
                                        <th>Rate</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($commissions as $commission)
                                        <tr>
                                            <td>{{ $commission->id }}</td>
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
                                            <td>
                                                @if (str_contains($commission->commission_type, 'referral_level'))
                                                    <span class="badge badge-success">
                                                        {{ ucwords(str_replace('_', ' ', $commission->commission_type)) }}
                                                    </span>
                                                @elseif($commission->commission_type == 'global_thrive_pool')
                                                    <span class="badge badge-info">Global Thrive</span>
                                                @elseif($commission->commission_type == 'empire_builder_pool')
                                                    <span class="badge badge-warning">Empire Builder</span>
                                                @endif
                                            </td>
                                            <td>{{ number_format($commission->commission_rate, 2) }}%</td>
                                            <td><strong>৳{{ number_format($commission->commission_amount, 2) }}</strong>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-center">No commissions found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <div class="mt-3">
                            {{ $commissions->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
