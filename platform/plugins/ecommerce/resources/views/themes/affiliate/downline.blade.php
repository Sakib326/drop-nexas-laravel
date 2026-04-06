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
                            <a class="nav-link active" href="{{ route('affiliate.downline') }}">
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
                        <div class="card-header">
                            <h3 class="mb-0">{{ __('My Contributor Partners Network') }}</h3>
                        </div>
                        <div class="card-body">
                            {{-- Breadcrumbs for Drill-down --}}
                            <nav aria-label="breadcrumb" class="downline-breadcrumb-wrapper mb-4" id="downlineBreadcrumb" style="display: none;">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#" data-username="root">{{ __('Home') }}</a></li>
                                </ol>
                            </nav>

                            {{-- Search Form --}}
                            <form method="GET" class="mb-4" id="downlineSearchForm">
                                <div class="row">
                                    <div class="col-md-9">
                                        <input type="text" name="search" class="form-control"
                                            placeholder="{{ __('Search by name, username or email...') }}"
                                            value="{{ request('search') }}">
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary w-100">
                                            <i class="fi-rs-search"></i> {{ __('Search') }}
                                        </button>
                                    </div>
                                </div>
                            </form>

                            {{-- Tree View --}}
                            <div class="downline-tree" id="downlineTree">
                                {{-- Root Node Info (Hidden when drilled down) --}}
                                <div id="rootNodeWrapper">
                                    <div class="tree-node level-0">
                                        <div class="node-content root-node">
                                            <div class="node-icon">
                                                <i class="fi-rs-user"></i>
                                            </div>
                                            <div class="node-info">
                                                <strong>{{ $customer->name }}</strong> <span
                                                    class="badge bg-primary">{{ __('You') }}</span>
                                                <br>
                                                <small class="text-muted">{{ '@' . $customer->username }}</small>
                                            </div>
                                            <div class="node-stats">
                                                <span class="badge bg-info">{{ $referrals->total() }}
                                                    {{ __('referrals') }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <h4 class="mt-4 mb-3">{{ __('Your Direct Referrals') }}</h4>
                                </div>

                                {{-- Active List Container --}}
                                <div id="downlineList">
                                    @if ($referrals->count() > 0)
                                        @foreach ($referrals as $referral)
                                            <div class="tree-node list-item" data-username="{{ $referral->username }}" data-name="{{ $referral->name }}">
                                                <div class="node-content">
                                                    <button class="expand-btn"
                                                        @if ($referral->referrals_count > 0) data-username="{{ $referral->username }}"
                                                            @else
                                                                disabled @endif>
                                                        <i class="fi-rs-{{ $referral->referrals_count > 0 ? 'plus' : 'minus' }}-small"></i>
                                                    </button>
                                                    <div class="node-icon">
                                                        <i class="fi-rs-user"></i>
                                                    </div>
                                                    <div class="node-info">
                                                        <strong>{{ $referral->name }}</strong>
                                                        <br>
                                                        <small class="text-muted">{{ '@' . $referral->username }}</small>
                                                        <br>
                                                        <small class="text-muted">{{ __('Joined') }}:
                                                            {{ $referral->created_at->format('M d, Y') }}</small>
                                                    </div>
                                                    <div class="node-stats">
                                                        @if ($referral->referrals_count > 0)
                                                            <span class="badge bg-success">{{ $referral->referrals_count }} {{ __('referrals') }}</span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <div class="text-center py-4">
                                            <p class="text-muted">{{ __('No referrals yet.') }}</p>
                                        </div>
                                    @endif
                                </div>
                            </div>

                            {{-- Pagination (Only at root) --}}
                            <div id="paginationWrapper">
                                @if ($referrals->hasPages())
                                    <div class="mt-4">
                                        {{ $referrals->links() }}
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .downline-tree {
        padding: 20px 0;
    }

    .tree-node {
        margin-left: 0;
        position: relative;
    }

    .node-content {
        display: flex;
        align-items: center;
        padding: 10px 15px;
        background: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        margin-bottom: 8px;
        transition: all 0.3s ease;
    }

    .node-content:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-color: #3BB77E;
    }

    .root-node {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
    }

    .root-node .text-muted {
        color: rgba(255, 255, 255, 0.8) !important;
    }

    .expand-btn {
        background: #f0f0f0;
        border: none;
        width: 24px;
        height: 24px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        margin-right: 8px;
        transition: all 0.3s ease;
        font-size: 12px;
    }

    .expand-btn:not(:disabled):hover {
        background: #3BB77E;
        color: white;
    }

    .expand-btn:disabled {
        opacity: 0.3;
        cursor: not-allowed;
    }

    .node-icon {
        width: 32px;
        height: 32px;
        background: #3BB77E;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
        color: white;
        font-size: 14px;
    }

    .root-node .node-icon {
        background: rgba(255, 255, 255, 0.3);
    }

    .node-info {
        flex: 1;
        line-height: 1.2;
    }

    .node-info strong {
        font-size: 14px;
    }

    .node-info small {
        font-size: 11px;
    }

    .node-stats {
        margin-left: 8px;
    }

    .node-stats .badge {
        font-size: 10px;
        padding: 4px 8px;
    }

    .loading-indicator {
        text-align: center;
        padding: 20px;
        color: #999;
    }
</style>

@include('plugins/ecommerce::themes.affiliate.affiliate-responsive')

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const listContainer = document.getElementById('downlineList');
        const paginationWrapper = document.getElementById('paginationWrapper');
        
        if (!listContainer || !paginationWrapper) return;

        const initialRootHtml = listContainer.innerHTML;
        const initialPaginationHtml = paginationWrapper.innerHTML;

        const rootUsername = 'root';
        const rootName = '{{ $customer->name }}';

        let navigationStack = [{
            username: rootUsername,
            name: rootName,
            html: initialRootHtml,
            paginationHtml: initialPaginationHtml
        }];

        const breadcrumbContainer = document.getElementById('downlineBreadcrumb');
        const breadcrumbList = breadcrumbContainer.querySelector('.breadcrumb');
        const searchForm = document.getElementById('downlineSearchForm');
        const rootWrapper = document.getElementById('rootNodeWrapper');

        function updateBreadcrumbs() {
            if (navigationStack.length <= 1) {
                breadcrumbContainer.style.display = 'none';
                return;
            }

            breadcrumbContainer.style.display = 'block';
            let html = '';
            navigationStack.forEach((item, index) => {
                if (index === navigationStack.length - 1) {
                    html += `<li class="breadcrumb-item active" aria-current="page">${item.name}</li>`;
                } else {
                    html +=
                        `<li class="breadcrumb-item"><a href="#" data-index="${index}">${item.name}</a></li>`;
                }
            });
            breadcrumbList.innerHTML = html;

            breadcrumbList.querySelectorAll('a').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    navigateToIndex(parseInt(this.getAttribute('data-index')));
                });
            });
        }

        function navigateToIndex(index) {
            const target = navigationStack[index];
            navigationStack = navigationStack.slice(0, index + 1);

            listContainer.innerHTML = target.html;
            paginationWrapper.innerHTML = target.paginationHtml || '';

            if (target.username === rootUsername) {
                rootWrapper.style.display = 'block';
                searchForm.style.display = 'block';
            } else {
                rootWrapper.style.display = 'none';
                searchForm.style.display = 'none';
            }

            attachEventListeners();
            updateBreadcrumbs();
        }

        function handleExpandClick(btn) {
            const username = btn.getAttribute('data-username');
            const name = btn.closest('.node-content').querySelector('.node-info strong').innerText;

            listContainer.innerHTML =
                '<div class="loading-indicator"><i class="fi-rs-loading"></i> {{ __('Loading...') }}</div>';
            rootWrapper.style.display = 'none';
            searchForm.style.display = 'none';
            paginationWrapper.innerHTML = '';

            fetch(`{{ url('affiliate/downline') }}/${username}/children`)
                .then(response => response.json())
                .then(data => {
                    let html = '';
                    if (data.length === 0) {
                        html =
                            '<div class="text-center py-4"><p class="text-muted">{{ __('No referrals found for this partner.') }}</p></div>';
                    } else {
                        data.forEach(child => {
                            html += `
                                <div class="tree-node list-item" data-username="${child.username}">
                                    <div class="node-content">
                                        <button class="expand-btn" ${child.has_children ? `data-username="${child.username}"` : 'disabled'}>
                                            <i class="fi-rs-${child.has_children ? 'plus' : 'minus'}-small"></i>
                                        </button>
                                        <div class="node-icon">
                                            <i class="fi-rs-user"></i>
                                        </div>
                                        <div class="node-info">
                                            <strong>${child.name}</strong><br>
                                            <small class="text-muted">${'@' + child.username}</small><br>
                                            <small class="text-muted">{{ __('Joined') }}: ${child.created_at}</small>
                                        </div>
                                        <div class="node-stats">
                                            ${child.referrals_count > 0 ? `<span class="badge bg-success">${child.referrals_count} {{ __('referrals') }}</span>` : ''}
                                        </div>
                                    </div>
                                </div>
                            `;
                        });
                    }

                    navigationStack.push({
                        username: username,
                        name: name,
                        html: html,
                        paginationHtml: ''
                    });

                    listContainer.innerHTML = html;
                    attachEventListeners();
                    updateBreadcrumbs();
                })
                .catch(error => {
                    console.error('Error:', error);
                    listContainer.innerHTML =
                        '<div class="text-center py-4 text-danger"><p>{{ __('Error loading data. Please try again.') }}</p></div>';
                });
        }

        function attachEventListeners() {
            listContainer.querySelectorAll('.expand-btn:not(:disabled)').forEach(btn => {
                btn.onclick = function() {
                    handleExpandClick(this);
                };
            });
        }

        // Initial attachment
        attachEventListeners();

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
