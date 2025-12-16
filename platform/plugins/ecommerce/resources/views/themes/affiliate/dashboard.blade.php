@php
    Theme::layout('full-width');
@endphp

<div class="page-content pt-50 pb-150 affiliate-dashboard-page">
    <div class="container">
        {{-- Mobile Menu Toggle --}}
        <button class="mobile-menu-toggle d-md-none mb-3" id="mobileMenuToggle">
            <i class="fi-rs-menu-burger"></i>
            <span>{{ __('Menu') }}</span>
        </button>

        {{-- Overlay for mobile menu --}}
        <div class="mobile-menu-overlay" id="mobileMenuOverlay"></div>

        <div class="row">
            <div class="col-md-3">
                <div class="dashboard-menu" id="dashboardMenu">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="{{ route('affiliate.dashboard') }}">
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
                                {{ __('My Contributor Partners') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.commissions') }}">
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
                        <div class="card-header">
                            <h3 class="mb-0">{{ __('Affiliate Dashboard') }}</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="welcome-msg">
                                        <h5>{{ __('Hello, :name!', ['name' => $customer->name]) }}</h5>
                                        <p class="mb-4">{{ __('Welcome to your affiliate dashboard.') }}</p>
                                    </div>
                                </div>
                            </div>

                            {{-- Balance Cards --}}
                            <div class="row mb-4">
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="dashboard-stat-card bg-success text-white">
                                        <div class="card-icon">
                                            <i class="fi-rs-wallet"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>{{ format_price($availableBalance) }}</h4>
                                            <p>{{ __('Available Balance') }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="dashboard-stat-card bg-primary text-white">
                                        <div class="card-icon">
                                            <i class="fi-rs-dollar"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>{{ format_price($totalEarned) }}</h4>
                                            <p>{{ __('Total Earned') }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="dashboard-stat-card bg-warning text-white">
                                        <div class="card-icon">
                                            <i class="fi-rs-time"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>{{ format_price($pendingCommissions) }}</h4>
                                            <p>{{ __('Pending Commissions') }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="dashboard-stat-card bg-secondary text-white">
                                        <div class="card-icon">
                                            <i class="fi-rs-bank"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>{{ format_price($totalWithdrawn) }}</h4>
                                            <p>{{ __('Total Withdrawn') }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            {{-- Stats Cards --}}
                            <div class="row mb-4">
                                <div class="col-lg-6 col-md-6 mb-4">
                                    <div class="dashboard-stat-card">
                                        <div class="card-icon">
                                            <i class="fi-rs-users"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>{{ $referralCount }}</h4>
                                            <p class="text-muted">{{ __('Total Referrals') }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 mb-4">
                                    <div class="dashboard-stat-card">
                                        <div class="card-icon">
                                            <i class="fi-rs-shopping-cart"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>{{ format_price($customer->total_sale_value ?? 0) }}</h4>
                                            <p class="text-muted">{{ __('Total Sales Value') }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <h5 class="mb-0">{{ __('Quick Stats') }}</h5>
                                        </div>
                                        <div class="card-body">
                                            <p class="text-muted">
                                                {{ __('Your affiliate statistics will appear here.') }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="mb-0">{{ __('Recent Activity') }}</h5>
                                        </div>
                                        <div class="card-body">
                                            <p class="text-muted">{{ __('No recent activity to display.') }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@include('plugins/ecommerce::themes.affiliate.affiliate-responsive')

<style>
    .affiliate-dashboard-page .dashboard-stat-card {
        background: #fff;
        border: 1px solid #ececec;
        border-radius: 10px;
        padding: 20px;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
    }

    .affiliate-dashboard-page .dashboard-stat-card:hover {
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        transform: translateY(-3px);
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-icon {
        width: 60px;
        height: 60px;
        border-radius: 10px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 20px;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-icon i {
        font-size: 24px;
        color: #fff;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-info h4 {
        margin: 0;
        font-size: 24px;
        font-weight: 700;
        color: #253D4E;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-info p {
        margin: 5px 0 0;
        font-size: 14px;
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-success .card-icon {
        background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-primary .card-icon {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-warning .card-icon {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-secondary .card-icon {
        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-success .card-info h4,
    .affiliate-dashboard-page .dashboard-stat-card.bg-primary .card-info h4,
    .affiliate-dashboard-page .dashboard-stat-card.bg-warning .card-info h4,
    .affiliate-dashboard-page .dashboard-stat-card.bg-secondary .card-info h4 {
        color: #fff;
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-success .card-info p,
    .affiliate-dashboard-page .dashboard-stat-card.bg-primary .card-info p,
    .affiliate-dashboard-page .dashboard-stat-card.bg-warning .card-info p,
    .affiliate-dashboard-page .dashboard-stat-card.bg-secondary .card-info p {
        color: rgba(255, 255, 255, 0.9);
    }

    .affiliate-dashboard-page .welcome-msg {
        padding: 20px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 10px;
        color: #fff;
        margin-bottom: 30px;
    }

    .affiliate-dashboard-page .welcome-msg h5 {
        color: #fff;
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .affiliate-dashboard-page .welcome-msg p {
        color: rgba(255, 255, 255, 0.9);
        margin-bottom: 0;
    }

    .affiliate-dashboard-page .card {
        border: 1px solid #ececec;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .affiliate-dashboard-page .card-header {
        background: #f8f9fa;
        border-bottom: 1px solid #ececec;
        padding: 15px 20px;
    }

    .affiliate-dashboard-page .card-header h5,
    .affiliate-dashboard-page .card-header h3 {
        color: #253D4E;
        font-weight: 600;
    }
</style>

<script>
    // Mobile Menu Toggle Functionality
    document.addEventListener('DOMContentLoaded', function() {
        const toggleBtn = document.getElementById('mobileMenuToggle');
        const menu = document.getElementById('dashboardMenu');
        const overlay = document.getElementById('mobileMenuOverlay');

        if (toggleBtn && menu && overlay) {
            // Open menu on toggle button click
            toggleBtn.addEventListener('click', function() {
                menu.classList.add('active');
                overlay.classList.add('active');
            });

            // Close menu on overlay click
            overlay.addEventListener('click', function() {
                menu.classList.remove('active');
                overlay.classList.remove('active');
            });

            // Close menu when clicking on a menu link
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
