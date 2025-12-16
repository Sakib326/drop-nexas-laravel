@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Commission Management</h3>
                    </div>

                    <div class="card-body">
                        <!-- Filters -->
                        <form method="GET" action="{{ route('admin.commissions.index') }}" class="mb-4">
                            <div class="row">
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

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Commission Type</label>
                                        <select name="commission_type" class="form-control">
                                            <option value="">All Types</option>
                                            @foreach ($commissionTypes as $type)
                                                <option value="{{ $type }}"
                                                    {{ request('commission_type') == $type ? 'selected' : '' }}>
                                                    {{ ucwords(str_replace('_', ' ', $type)) }}
                                                </option>
                                            @endforeach
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

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>&nbsp;</label>
                                        <div>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-filter"></i> Filter
                                            </button>
                                            <a href="{{ route('admin.commissions.index') }}" class="btn btn-secondary">
                                                <i class="fa fa-refresh"></i> Reset
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- Commissions Table -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Customer</th>
                                        <th>Order Code</th>
                                        <th>Commission Type</th>
                                        <th>Rate</th>
                                        <th>Order Amount</th>
                                        <th>Profit Amount</th>
                                        <th>Commission Amount</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($commissions as $commission)
                                        <tr>
                                            <td>{{ $commission->id }}</td>
                                            <td>
                                                <a
                                                    href="{{ route('admin.commissions.user-history', $commission->customer_id) }}">
                                                    {{ $commission->customer_name }}<br>
                                                    <small class="text-muted">{{ $commission->username }}</small>
                                                </a>
                                            </td>
                                            <td>
                                                @if ($commission->order_id)
                                                    <a href="{{ route('orders.edit', $commission->order_id) }}"
                                                        target="_blank">
                                                        {{ $commission->order_code }}
                                                    </a>
                                                @else
                                                    <span class="badge badge-secondary">Pool Distribution</span>
                                                @endif
                                            </td>
                                            <td>
                                                @if (str_contains($commission->commission_type, 'referral_level'))
                                                    <span class="badge badge-success">
                                                        {{ ucwords(str_replace('_', ' ', $commission->commission_type)) }}
                                                    </span>
                                                @elseif($commission->commission_type == 'global_thrive_pool')
                                                    <span class="badge badge-info">Global Thrive Pool</span>
                                                @elseif($commission->commission_type == 'empire_builder_pool')
                                                    <span class="badge badge-warning">Empire Builder Pool</span>
                                                @else
                                                    {{ ucwords(str_replace('_', ' ', $commission->commission_type)) }}
                                                @endif
                                            </td>
                                            <td>{{ number_format($commission->commission_rate, 2) }}%</td>
                                            <td>৳{{ number_format($commission->order_amount, 2) }}</td>
                                            <td>৳{{ number_format($commission->profit_amount, 2) }}</td>
                                            <td><strong>৳{{ number_format($commission->commission_amount, 2) }}</strong>
                                            </td>
                                            <td>{{ \Carbon\Carbon::parse($commission->created_at)->format('d M Y H:i') }}
                                            </td>
                                            <td>
                                                <a href="{{ route('admin.commissions.user-history', $commission->customer_id) }}"
                                                    class="btn btn-sm btn-info" title="View User History">
                                                    <i class="fa fa-history"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="10" class="text-center">No commissions found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <div class="mt-3">
                            {{ $commissions->appends(request()->query())->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
