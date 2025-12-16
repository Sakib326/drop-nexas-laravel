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
                                {{ __('My Downline') }}
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
                            <h3 class="mb-0">{{ __('My Downline Network') }}</h3>
                        </div>
                        <div class="card-body">
                            {{-- Search Form --}}
                            <form method="GET" class="mb-4">
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
                            <div class="downline-tree">
                                {{-- Root User --}}
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

                                    {{-- Direct Referrals --}}
                                    @if ($referrals->count() > 0)
                                        <div class="tree-children">
                                            @foreach ($referrals as $referral)
                                                <div class="tree-node level-1"
                                                    data-username="{{ $referral->username }}">
                                                    <div class="node-content">
                                                        <button class="expand-btn"
                                                            @if ($referral->referrals_count > 0) data-username="{{ $referral->username }}"
                                                                @else
                                                                    disabled @endif>
                                                            <i
                                                                class="fi-rs-{{ $referral->referrals_count > 0 ? 'plus' : 'minus' }}-small"></i>
                                                        </button>
                                                        <div class="node-icon">
                                                            <i class="fi-rs-user"></i>
                                                        </div>
                                                        <div class="node-info">
                                                            <strong>{{ $referral->name }}</strong>
                                                            <br>
                                                            <small
                                                                class="text-muted">{{ '@' . $referral->username }}</small>
                                                            <br>
                                                            <small class="text-muted">{{ __('Joined') }}:
                                                                {{ $referral->created_at->format('M d, Y') }}</small>
                                                        </div>
                                                        <div class="node-stats">
                                                            @if ($referral->referrals_count > 0)
                                                                <span
                                                                    class="badge bg-success">{{ $referral->referrals_count }}
                                                                    {{ __('referrals') }}</span>
                                                            @endif
                                                        </div>
                                                    </div>
                                                    {{-- Placeholder for lazy-loaded children --}}
                                                    <div class="tree-children" style="display: none;"></div>
                                                </div>
                                            @endforeach
                                        </div>
                                    @else
                                        <div class="text-center py-4">
                                            <p class="text-muted">{{ __('No referrals yet.') }}</p>
                                        </div>
                                    @endif
                                </div>
                            </div>

                            {{-- Pagination --}}
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

@include('plugins/ecommerce::themes.affiliate.affiliate-responsive')

<style>
    .downline-tree {
        padding: 20px 0;
    }

    .tree-node {
        margin-left: 0;
        position: relative;
    }

    .tree-node.level-1,
    .tree-node.level-2,
    .tree-node.level-3 {
        margin-left: 40px;
    }

    .node-content {
        display: flex;
        align-items: center;
        padding: 15px;
        background: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        margin-bottom: 10px;
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
        width: 30px;
        height: 30px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        margin-right: 10px;
        transition: all 0.3s ease;
    }

    .expand-btn:not(:disabled):hover {
        background: #3BB77E;
        color: white;
    }

    .expand-btn:disabled {
        opacity: 0.3;
        cursor: not-allowed;
    }

    .expand-btn.expanded i:before {
        content: "\f286" !important;
        /* minus icon */
    }

    .node-icon {
        width: 45px;
        height: 45px;
        background: #3BB77E;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
        color: white;
        font-size: 20px;
    }

    .root-node .node-icon {
        background: rgba(255, 255, 255, 0.3);
    }

    .node-info {
        flex: 1;
    }

    .node-stats {
        margin-left: 10px;
    }

    .tree-children {
        padding-left: 20px;
        border-left: 2px dashed #e0e0e0;
        margin-left: 20px;
    }

    .loading-indicator {
        text-align: center;
        padding: 10px;
        color: #999;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const loadedNodes = new Set();

        document.querySelectorAll('.expand-btn:not(:disabled)').forEach(btn => {
            btn.addEventListener('click', function() {
                const username = this.getAttribute('data-username');
                const treeNode = this.closest('.tree-node');
                const childrenContainer = treeNode.querySelector('.tree-children');

                if (this.classList.contains('expanded')) {
                    // Collapse
                    this.classList.remove('expanded');
                    childrenContainer.style.display = 'none';
                } else {
                    // Expand
                    this.classList.add('expanded');
                    childrenContainer.style.display = 'block';

                    // Load children if not already loaded
                    if (!loadedNodes.has(username)) {
                        loadChildren(username, childrenContainer);
                        loadedNodes.add(username);
                    }
                }
            });
        });

        function loadChildren(username, container) {
            console.log('Loading children for:', username);
            container.innerHTML =
                '<div class="loading-indicator"><i class="fi-rs-loading"></i> {{ __('Loading...') }}</div>';

            fetch(`{{ url('affiliate/downline') }}/${username}/children`)
                .then(response => {
                    console.log('Response status:', response.status);
                    return response.json();
                })
                .then(data => {
                    console.log('Received data:', data);
                    if (data.length === 0) {
                        container.innerHTML =
                            '<div class="text-center py-2"><small class="text-muted">{{ __('No referrals') }}</small></div>';
                        return;
                    }

                    let html = '';
                    data.forEach(child => {
                        html += `
                        <div class="tree-node" data-username="${child.username}">
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
                            <div class="tree-children" style="display: none;"></div>
                        </div>
                    `;
                    });

                    container.innerHTML = html;

                    // Attach event listeners to new expand buttons
                    const newButtons = container.querySelectorAll('.expand-btn:not(:disabled)');
                    console.log('Attaching listeners to', newButtons.length, 'new buttons');

                    newButtons.forEach(btn => {
                        btn.addEventListener('click', function() {
                            console.log('Button clicked for:', this.getAttribute(
                                'data-username'));
                            const username = this.getAttribute('data-username');
                            const treeNode = this.closest('.tree-node');
                            const childrenContainer = treeNode.querySelector(
                                '.tree-children');

                            if (this.classList.contains('expanded')) {
                                // Collapse
                                console.log('Collapsing node');
                                this.classList.remove('expanded');
                                childrenContainer.style.display = 'none';
                            } else {
                                // Expand
                                console.log('Expanding node');
                                this.classList.add('expanded');
                                childrenContainer.style.display = 'block';

                                if (!loadedNodes.has(username)) {
                                    console.log('Loading new children for:', username);
                                    loadChildren(username, childrenContainer);
                                    loadedNodes.add(username);
                                } else {
                                    console.log('Children already loaded for:', username);
                                }
                            }
                        });
                    });
                })
                .catch(error => {
                    console.error('Error loading children:', error);
                    container.innerHTML =
                        '<div class="text-center py-2 text-danger"><small>{{ __('Error loading data') }}</small></div>';
                });
        }

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
