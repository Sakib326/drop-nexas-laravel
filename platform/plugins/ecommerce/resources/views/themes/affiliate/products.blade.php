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
                            <a class="nav-link active" href="{{ route('affiliate.products') }}">
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
                            <h3 class="mb-0">{{ __('Affiliate Products') }}</h3>
                        </div>
                        <div class="card-body">
                            {{-- Filters --}}
                            <form method="GET" class="mb-4">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="text" name="search" class="form-control"
                                            placeholder="{{ __('Search products...') }}"
                                            value="{{ request('search') }}">
                                    </div>
                                    <div class="col-md-3">
                                        <select name="category" class="form-control">
                                            <option value="">{{ __('All Categories') }}</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}"
                                                    {{ request('category') == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <select name="sort" class="form-control">
                                            <option value="">{{ __('Sort by') }}</option>
                                            <option value="profit_high"
                                                {{ request('sort') == 'profit_high' ? 'selected' : '' }}>
                                                {{ __('Profit: High to Low') }}
                                            </option>
                                            <option value="profit_low"
                                                {{ request('sort') == 'profit_low' ? 'selected' : '' }}>
                                                {{ __('Profit: Low to High') }}
                                            </option>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-primary w-100 btn-mobile-full">
                                            <i class="fi-rs-filter"></i> {{ __('Filter') }}
                                        </button>
                                    </div>
                                </div>
                            </form>

                            {{-- Products List --}}
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Product') }}</th>
                                            <th>{{ __('Price') }}</th>
                                            <th>{{ __('Your Profit') }}</th>
                                            <th>{{ __('Action') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($products as $product)
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="{{ RvMedia::getImageUrl($product->image, 'thumb', false, RvMedia::getDefaultImage()) }}"
                                                            alt="{{ $product->name }}"
                                                            style="width: 50px; height: 50px; object-fit: cover; margin-right: 10px;">
                                                        <div>
                                                            <strong>{{ $product->name }}</strong>
                                                            <br>
                                                            <small class="text-muted">
                                                                {{ $product->sku ?? __('N/A') }}
                                                            </small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <strong>{{ format_price($product->price) }}</strong>
                                                </td>
                                                <td>
                                                    @php
                                                        $cost = $product->cost_per_item ?? 0;
                                                        $price =
                                                            $product->sale_price > 0
                                                                ? $product->sale_price
                                                                : $product->price;
                                                        $profit = 0;

                                                        if ($cost > 0 && $price > $cost) {
                                                            $profit = ($price - $cost) * 0.5;
                                                        }
                                                    @endphp
                                                    @if ($profit > 0)
                                                        <span class="text-success">
                                                            <strong>{{ format_price($profit) }}</strong>
                                                        </span>
                                                        <br>
                                                        <small class="text-muted">(50% {{ __('commission') }})</small>
                                                    @else
                                                        <span class="text-muted">
                                                            <small>{{ __('No commission') }}</small>
                                                        </span>
                                                    @endif
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary copy-url-btn"
                                                        data-url="{{ route('public.single', $product->slug) }}?fromre={{ $customer->username }}"
                                                        title="{{ __('Copy affiliate link') }}">
                                                        <i class="fi-rs-copy"></i> {{ __('Copy Link') }}
                                                    </button>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="4" class="text-center py-4">
                                                    <p class="text-muted">{{ __('No products found.') }}</p>
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>

                            {{-- Pagination --}}
                            @if ($products->hasPages())
                                <div class="mt-4">
                                    {{ $products->links() }}
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

<style>
    .copy-url-btn {
        transition: all 0.3s ease;
    }

    .copy-url-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .copy-url-btn.copied {
        background-color: #28a745 !important;
        border-color: #28a745 !important;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.copy-url-btn').forEach(function(btn) {
            btn.addEventListener('click', function() {
                const url = this.getAttribute('data-url');
                const originalText = this.innerHTML;

                navigator.clipboard.writeText(url).then(() => {
                    this.classList.add('copied');
                    this.innerHTML = '<i class="fi-rs-check"></i> {{ __('Copied!') }}';

                    setTimeout(() => {
                        this.classList.remove('copied');
                        this.innerHTML = originalText;
                    }, 2000);
                }).catch(err => {
                    alert('{{ __('Failed to copy') }}');
                });
            });
        });

        // Mobile Menu Toggle Functionality
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
