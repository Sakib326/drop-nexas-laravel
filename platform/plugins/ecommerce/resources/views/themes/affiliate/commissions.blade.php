@php
    Theme::layout('full-width');
@endphp

<div class="page-content pt-50 pb-150 affiliate-dashboard-page">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="dashboard-menu">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.dashboard') }}">
                                <i class="fi-rs-home"></i>
                                {{ __('Dashboard') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.products') }}">
                                <i class="fi-rs-shopping-bag"></i>
                                {{ __('Products') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.downline') }}">
                                <i class="fi-rs-users"></i>
                                {{ __('My Downline') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="{{ route('affiliate.commissions') }}">
                                <i class="fi-rs-dollar"></i>
                                {{ __('Commissions') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.withdrawals') }}">
                                <i class="fi-rs-bank"></i>
                                {{ __('Withdrawals') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('customer.overview') }}">
                                <i class="fi-rs-user"></i>
                                {{ __('My Account') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('customer.logout') }}">
                                <i class="fi-rs-sign-out"></i>
                                {{ __('Logout') }}
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content account dashboard-content pl-50">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">{{ __('Commission History') }}</h3>
                        </div>
                        <div class="card-body">
                            {{-- Filters --}}
                            <form method="GET" class="mb-4">
                                <div class="row">
                                    <div class="col-md-3">
                                        <select name="status" class="form-control">
                                            <option value="">{{ __('All Status') }}</option>
                                            <option value="pending"
                                                {{ request('status') == 'pending' ? 'selected' : '' }}>
                                                {{ __('Pending') }}</option>
                                            <option value="approved"
                                                {{ request('status') == 'approved' ? 'selected' : '' }}>
                                                {{ __('Approved') }}</option>
                                            <option value="paid" {{ request('status') == 'paid' ? 'selected' : '' }}>
                                                {{ __('Paid') }}</option>
                                            <option value="returned"
                                                {{ request('status') == 'returned' ? 'selected' : '' }}>
                                                {{ __('Returned') }}</option>
                                            <option value="rejected"
                                                {{ request('status') == 'rejected' ? 'selected' : '' }}>
                                                {{ __('Rejected') }}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <select name="type" class="form-control">
                                            <option value="">{{ __('All Types') }}</option>
                                            <option value="direct_sale"
                                                {{ request('type') == 'direct_sale' ? 'selected' : '' }}>
                                                {{ __('Direct Sale') }}</option>
                                            <option value="downline_level_1"
                                                {{ request('type') == 'downline_level_1' ? 'selected' : '' }}>
                                                {{ __('Level 1') }}</option>
                                            <option value="downline_level_2"
                                                {{ request('type') == 'downline_level_2' ? 'selected' : '' }}>
                                                {{ __('Level 2') }}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="date" name="from" class="form-control"
                                            value="{{ request('from') }}" placeholder="{{ __('From') }}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="date" name="to" class="form-control"
                                            value="{{ request('to') }}" placeholder="{{ __('To') }}">
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-primary w-100">
                                            <i class="fi-rs-filter"></i> {{ __('Filter') }}
                                        </button>
                                    </div>
                                </div>
                            </form>

                            {{-- Commission List --}}
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Date') }}</th>
                                            <th>{{ __('Order/Product') }}</th>
                                            <th>{{ __('Type') }}</th>
                                            <th>{{ __('Amount') }}</th>
                                            <th>{{ __('Status') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($commissions as $commission)
                                            <tr>
                                                <td>
                                                    <small>{{ $commission->created_at->format('M d, Y') }}</small><br>
                                                    <small
                                                        class="text-muted">{{ $commission->created_at->format('H:i A') }}</small>
                                                </td>
                                                <td>
                                                    @if ($commission->order_id)
                                                        <strong>{{ __('Order') }}
                                                            #{{ $commission->order_id }}</strong><br>
                                                    @endif
                                                    @if ($commission->product)
                                                        <small
                                                            class="text-muted">{{ $commission->product->name }}</small>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if ($commission->commission_type == 'direct_sale')
                                                        <span class="badge bg-primary">{{ __('Direct Sale') }}</span>
                                                    @elseif($commission->commission_type == 'downline_level_1')
                                                        <span class="badge bg-info">{{ __('Level 1') }}</span>
                                                    @elseif($commission->commission_type == 'downline_level_2')
                                                        <span class="badge bg-secondary">{{ __('Level 2') }}</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    <strong
                                                        class="text-success">{{ format_price($commission->commission_amount) }}</strong>
                                                    <br>
                                                    <small
                                                        class="text-muted">{{ $commission->commission_rate }}%</small>
                                                </td>
                                                <td>
                                                    @if ($commission->status == 'pending')
                                                        <span class="badge bg-warning">{{ __('Pending') }}</span>
                                                    @elseif($commission->status == 'approved')
                                                        <span class="badge bg-success">{{ __('Approved') }}</span>
                                                    @elseif($commission->status == 'paid')
                                                        <span class="badge bg-primary">{{ __('Paid') }}</span>
                                                    @elseif($commission->status == 'returned')
                                                        <span class="badge bg-dark">{{ __('Returned') }}</span>
                                                    @elseif($commission->status == 'rejected')
                                                        <span class="badge bg-danger">{{ __('Rejected') }}</span>
                                                    @endif
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center py-4">
                                                    <p class="text-muted">{{ __('No commission records found.') }}</p>
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            {{-- Pagination --}}
                            @if ($commissions->hasPages())
                                <div class="mt-4">
                                    {{ $commissions->links() }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
