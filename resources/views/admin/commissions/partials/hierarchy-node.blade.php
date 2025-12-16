@foreach ($nodes as $node)
    <div class="tree-node level-{{ $node['depth'] }}">
        <div class="user-card">
            <strong>{{ $node['customer']->name }}</strong> ({{ $node['customer']->username }})
            <br>
            <small class="text-muted">
                {{ $node['customer']->email }}
            </small>
            <br>
            <span class="badge badge-{{ $node['customer']->getLevelBadgeColor() }}">
                Level {{ $node['customer']->level }} - {{ $node['customer']->level_name }}
            </span>
            <br>
            <small>
                <strong>Balance:</strong> ৳{{ number_format($node['customer']->available_balance, 2) }} |
                <strong>Lifetime:</strong> ৳{{ number_format($node['customer']->lifetime_earnings, 2) }}
            </small>
            <br>
            <small class="text-muted">
                Joined: {{ $node['customer']->created_at->format('d M Y') }}
            </small>
            <br>
            <div class="mt-2">
                <a href="{{ route('admin.commissions.user-history', $node['customer']->id) }}"
                    class="btn btn-xs btn-info">
                    <i class="fa fa-history"></i> Commissions
                </a>
                <a href="{{ route('admin.commissions.user-hierarchy', $node['customer']->id) }}"
                    class="btn btn-xs btn-success">
                    <i class="fa fa-sitemap"></i> Their Network
                </a>
            </div>
        </div>

        @if (!empty($node['children']))
            @include('admin.commissions.partials.hierarchy-node', ['nodes' => $node['children']])
        @endif
    </div>
@endforeach
