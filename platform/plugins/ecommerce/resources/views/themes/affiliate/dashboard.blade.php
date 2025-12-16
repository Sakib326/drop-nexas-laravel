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
                            <a class="nav-link active" href="{{ route('affiliate.dashboard') }}">
                                <i class="fi-rs-home"></i>
                                {{ __('Dashboard') }}
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

                            <div class="row mb-4">
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="dashboard-stat-card">
                                        <div class="card-icon">
                                            <i class="fi-rs-dollar"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>$0.00</h4>
                                            <p class="text-muted">{{ __('Total Earnings') }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="dashboard-stat-card">
                                        <div class="card-icon">
                                            <i class="fi-rs-users"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>0</h4>
                                            <p class="text-muted">{{ __('Total Referrals') }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="dashboard-stat-card">
                                        <div class="card-icon">
                                            <i class="fi-rs-shopping-cart"></i>
                                        </div>
                                        <div class="card-info">
                                            <h4>0</h4>
                                            <p class="text-muted">{{ __('Successful Sales') }}</p>
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
