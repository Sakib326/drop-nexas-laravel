@php
    Theme::layout('full-width');
@endphp

<div class="page-content pt-50 pb-150 affiliate-dashboard-page">
    <div class="container">
        <!-- Mobile Menu Toggle -->
        <button class="mobile-menu-toggle d-md-none mb-3" id="mobileMenuToggle">
            <i class="fi-rs-menu-burger"></i>
            <span class="ms-2">Menu</span>
        </button>

        <!-- Mobile Overlay -->
        <div class="mobile-menu-overlay" id="mobileMenuOverlay"></div>

        <div class="row">
            <div class="col-md-3">
                <div class="dashboard-menu" id="dashboardMenu">
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
                            <a class="nav-link" href="{{ route('affiliate.commissions') }}">
                                <i class="fi-rs-dollar"></i>
                                {{ __('Commissions') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="{{ route('affiliate.withdrawals') }}">
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
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center flex-wrap">
                            <h3 class="mb-0">{{ __('Withdrawal History') }}</h3>
                            <a href="{{ route('affiliate.withdrawal.request') }}"
                                class="btn btn-primary btn-mobile-full mt-2 mt-md-0">
                                <i class="fi-rs-plus"></i> {{ __('Request Withdrawal') }}
                            </a>
                        </div>
                        <div class="card-body">
                            {{-- Balance Info --}}
                            <div class="alert alert-info mb-4">
                                <div class="row text-center">
                                    <div class="col-md-4">
                                        <strong>{{ __('Available Balance') }}</strong><br>
                                        <h4 class="mb-0 mt-2">{{ format_price($customer->available_balance ?? 0) }}
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <strong>{{ __('Total Earned') }}</strong><br>
                                        <h4 class="mb-0 mt-2">{{ format_price($customer->total_earned ?? 0) }}</h4>
                                    </div>
                                    <div class="col-md-4">
                                        <strong>{{ __('Total Withdrawn') }}</strong><br>
                                        <h4 class="mb-0 mt-2">{{ format_price($customer->total_withdrawn ?? 0) }}</h4>
                                    </div>
                                </div>
                            </div>

                            {{-- Filters --}}
                            <form method="GET" class="mb-4">
                                <div class="row">
                                    <div class="col-md-4">
                                        <select name="status" class="form-control">
                                            <option value="">{{ __('All Status') }}</option>
                                            <option value="pending"
                                                {{ request('status') == 'pending' ? 'selected' : '' }}>
                                                {{ __('Pending') }}</option>
                                            <option value="processing"
                                                {{ request('status') == 'processing' ? 'selected' : '' }}>
                                                {{ __('Processing') }}</option>
                                            <option value="completed"
                                                {{ request('status') == 'completed' ? 'selected' : '' }}>
                                                {{ __('Completed') }}</option>
                                            <option value="rejected"
                                                {{ request('status') == 'rejected' ? 'selected' : '' }}>
                                                {{ __('Rejected') }}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-primary w-100 btn-mobile-full">
                                            <i class="fi-rs-filter"></i> {{ __('Filter') }}
                                        </button>
                                    </div>
                                </div>
                            </form>

                            {{-- Withdrawal List --}}
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Date') }}</th>
                                            <th>{{ __('Amount') }}</th>
                                            <th>{{ __('Method') }}</th>
                                            <th>{{ __('Status') }}</th>
                                            <th>{{ __('Details') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($withdrawals as $withdrawal)
                                            <tr>
                                                <td>
                                                    <small>{{ $withdrawal->created_at->format('M d, Y') }}</small><br>
                                                    <small
                                                        class="text-muted">{{ $withdrawal->created_at->format('H:i A') }}</small>
                                                </td>
                                                <td>
                                                    <strong>{{ format_price($withdrawal->amount) }}</strong>
                                                </td>
                                                <td>
                                                    @if ($withdrawal->withdrawal_method == 'bank')
                                                        <span class="badge bg-primary">{{ __('Bank') }}</span>
                                                    @elseif($withdrawal->withdrawal_method == 'mfs')
                                                        <span class="badge bg-info">{{ __('MFS') }}</span>
                                                    @elseif($withdrawal->withdrawal_method == 'cash')
                                                        <span class="badge bg-success">{{ __('Cash') }}</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if ($withdrawal->status == 'pending')
                                                        <span class="badge bg-warning">{{ __('Pending') }}</span>
                                                    @elseif($withdrawal->status == 'processing')
                                                        <span class="badge bg-info">{{ __('Processing') }}</span>
                                                    @elseif($withdrawal->status == 'completed')
                                                        <span class="badge bg-success">{{ __('Completed') }}</span>
                                                        @if ($withdrawal->processed_at)
                                                            <br><small
                                                                class="text-muted">{{ $withdrawal->processed_at->format('M d, Y') }}</small>
                                                        @endif
                                                    @elseif($withdrawal->status == 'rejected')
                                                        <span class="badge bg-danger">{{ __('Rejected') }}</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if ($withdrawal->account_details)
                                                        @foreach ($withdrawal->account_details as $key => $value)
                                                            <small><strong>{{ ucfirst($key) }}:</strong>
                                                                {{ $value }}</small><br>
                                                        @endforeach
                                                    @endif
                                                    @if ($withdrawal->rejection_reason)
                                                        <div class="mt-2">
                                                            <small
                                                                class="text-danger"><strong>{{ __('Reason') }}:</strong>
                                                                {{ $withdrawal->rejection_reason }}</small>
                                                        </div>
                                                    @endif
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center py-4">
                                                    <p class="text-muted">{{ __('No withdrawal records found.') }}</p>
                                                    <a href="{{ route('affiliate.withdrawal.request') }}"
                                                        class="btn btn-primary">
                                                        {{ __('Request Your First Withdrawal') }}
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            {{-- Pagination --}}
                            @if ($withdrawals->hasPages())
                                <div class="mt-4">
                                    {{ $withdrawals->links() }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@include('plugins/ecommerce::themes.affiliate.affiliate-responsive')

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const toggleBtn = document.getElementById('mobileMenuToggle');
        const menu = document.getElementById('dashboardMenu');
        const overlay = document.getElementById('mobileMenuOverlay');

        if (toggleBtn && menu && overlay) {
            toggleBtn.addEventListener('click', function() {
                menu.classList.add('active');
                overlay.classList.add('active');
            });

            overlay.addEventListener('click', function() {
                menu.classList.remove('active');
                overlay.classList.remove('active');
            });

            const menuLinks = menu.querySelectorAll('a');
            menuLinks.forEach(function(link) {
                link.addEventListener('click', function() {
                    menu.classList.remove('active');
                    overlay.classList.remove('active');
                });
            });
        }
    });
</script>
