@php
    Theme::layout('full-width');
    $status = $customer->affiliate_status;
@endphp

<div class="page-content pt-50 pb-150 affiliate-apply-page">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div class="card-header bg-primary py-4 text-center">
                        <h2 class="text-white mb-0 h3">{{ __('Join Our Affiliate Program') }}</h2>
                        <p class="text-white-50 mb-0">{{ __('Turn your influence into income with our rewarding partnership') }}</p>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show border-0 shadow-sm mb-4" role="alert">
                                <div class="d-flex align-items-center">
                                    <x-core::icon name="ti ti-circle-check" class="me-2" size="md" />
                                    <div>{{ session('success') }}</div>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        @endif

                        @if (session('error'))
                            <div class="alert alert-danger alert-dismissible fade show border-0 shadow-sm mb-4" role="alert">
                                <div class="d-flex align-items-center">
                                    <x-core::icon name="ti ti-alert-triangle" class="me-2" size="md" />
                                    <div>{{ session('error') }}</div>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        @endif

                        @if ($status == \Botble\Ecommerce\Enums\AffiliateStatusEnum::PENDING)
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <div class="bg-warning bg-opacity-10 rounded-circle p-4 d-inline-flex">
                                        <x-core::icon name="ti ti-clock-hour-4" class="text-warning" size="lg" style="width: 48px; height: 48px;" />
                                    </div>
                                </div>
                                <h3 class="h4 mb-3">{{ __('Application Under Review') }}</h3>
                                <p class="text-muted mb-4 px-lg-5">
                                    {{ __('Thank you for your interest! Your application is currently being reviewed by our team. We will notify you once your status has been updated.') }}
                                </p>
                                <a href="{{ route('customer.overview') }}" class="btn btn-outline-primary px-4 py-2 rounded-pill">
                                    {{ __('Back to Dashboard') }}
                                </a>
                            </div>
                        @elseif ($status == \Botble\Ecommerce\Enums\AffiliateStatusEnum::REJECTED)
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <div class="bg-danger bg-opacity-10 rounded-circle p-4 d-inline-flex">
                                        <x-core::icon name="ti ti-circle-x" class="text-danger" size="lg" style="width: 48px; height: 48px;" />
                                    </div>
                                </div>
                                <h3 class="h4 mb-3">{{ __('Application Status') }}</h3>
                                <p class="text-muted mb-4 px-lg-5">
                                    {{ __('We regret to inform you that your affiliate application was not approved at this time. You may re-apply if you believe your circumstances have changed.') }}
                                </p>
                                <form action="{{ route('affiliate.apply.store') }}" method="POST">
                                    @csrf
                                    <button type="submit" class="btn btn-primary px-5 py-3 rounded-pill fw-bold shadow-sm">
                                        {{ __('Re-apply Now') }}
                                    </button>
                                </form>
                            </div>
                        @elseif ($status == \Botble\Ecommerce\Enums\AffiliateStatusEnum::SUSPENDED)
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <div class="bg-secondary bg-opacity-10 rounded-circle p-4 d-inline-flex">
                                        <x-core::icon name="ti ti-lock-off" class="text-secondary" size="lg" style="width: 48px; height: 48px;" />
                                    </div>
                                </div>
                                <h3 class="h4 mb-3">{{ __('Account Suspended') }}</h3>
                                <p class="text-muted mb-4 px-lg-5">
                                    {{ __('Your affiliate account has been suspended. Please contact support if you have any questions.') }}
                                </p>
                                <a href="mailto:support@nexas.com" class="btn btn-primary px-4 py-2 rounded-pill">
                                    {{ __('Contact Support') }}
                                </a>
                            </div>
                        @else
                            <div class="row align-items-center mb-5">
                                <div class="col-md-6 mb-4 mb-md-0">
                                    <h4 class="h5 fw-bold mb-4">{{ __('Why become an affiliate?') }}</h4>
                                    <ul class="list-unstyled mb-0">
                                        <li class="d-flex align-items-start mb-3">
                                            <div class="bg-success bg-opacity-10 rounded-circle p-1 me-3">
                                                <x-core::icon name="ti ti-check" class="text-success" size="xs" />
                                            </div>
                                            <span><strong>{{ __('Lucrative Commissions:') }}</strong> {{ __('Earn high percentages on every successful referral.') }}</span>
                                        </li>
                                        <li class="d-flex align-items-start mb-3">
                                            <div class="bg-success bg-opacity-10 rounded-circle p-1 me-3">
                                                <x-core::icon name="ti ti-check" class="text-success" size="xs" />
                                            </div>
                                            <span><strong>{{ __('Multi-level Rewards:') }}</strong> {{ __('Benefit from the sales of your downline team members.') }}</span>
                                        </li>
                                        <li class="d-flex align-items-start mb-3">
                                            <div class="bg-success bg-opacity-10 rounded-circle p-1 me-3">
                                                <x-core::icon name="ti ti-check" class="text-success" size="xs" />
                                            </div>
                                            <span><strong>{{ __('Marketing Resources:') }}</strong> {{ __('Access exclusive promotional materials and tools.') }}</span>
                                        </li>
                                        <li class="d-flex align-items-start">
                                            <div class="bg-success bg-opacity-10 rounded-circle p-1 me-3">
                                                <x-core::icon name="ti ti-check" class="text-success" size="xs" />
                                            </div>
                                            <span><strong>{{ __('Dedicated Support:') }}</strong> {{ __('Receive guidance from our experienced affiliate managers.') }}</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-4 bg-light rounded-4 text-center">
                                        <h4 class="h5 fw-bold mb-3">{{ __('Ready to Start?') }}</h4>
                                        <p class="text-muted mb-4">
                                            {{ __('By joining, you agree to our Affiliate Terms and Conditions. Your account will be eligible for commissions once approved.') }}
                                        </p>
                                        <form action="{{ route('affiliate.apply.store') }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-primary btn-lg w-100 py-3 rounded-pill fw-bold shadow">
                                                {{ __('Apply to Join Now') }}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a href="{{ route('public.index') }}" class="text-muted text-decoration-none small">
                        <x-core::icon name="ti ti-arrow-left" class="me-1" size="xs" />
                        {{ __('Return to Home') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .affiliate-apply-page {
        background-color: #f8f9fa;
        min-height: 80vh;
    }
    .affiliate-apply-page .card {
        transition: transform 0.3s ease;
    }
    .affiliate-apply-page .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
    }
    .affiliate-apply-page .btn-primary:hover {
        background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
        box-shadow: 0 8px 15px rgba(118, 75, 162, 0.3) !important;
    }
    .bg-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
    }
    .text-white-50 {
        color: rgba(255, 255, 255, 0.7) !important;
    }
    .rounded-4 {
        border-radius: 1.5rem !important;
    }
</style>
