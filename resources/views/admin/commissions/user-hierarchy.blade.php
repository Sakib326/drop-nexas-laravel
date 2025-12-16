@extends('core/base::layouts.master')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">
                            Referral Hierarchy for {{ $customer->name }} ({{ $customer->username }})
                        </h3>
                        <div class="card-tools">
                            <a href="{{ route('admin.commissions.user-history', $customer->id) }}"
                                class="btn btn-sm btn-primary">
                                <i class="fa fa-history"></i> View Commissions
                            </a>
                        </div>
                    </div>

                    <div class="card-body">
                        <!-- Stats Overview -->
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <div class="info-box">
                                    <span class="info-box-icon bg-info"><i class="fa fa-users"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Total Members</span>
                                        <span class="info-box-number">{{ $stats['total_members'] }}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="info-box">
                                    <span class="info-box-icon bg-success"><i class="fa fa-money"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Total Downline Earnings</span>
                                        <span
                                            class="info-box-number">৳{{ number_format($stats['total_earnings'], 2) }}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="info-box">
                                    <span class="info-box-icon bg-warning"><i class="fa fa-line-chart"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Commissions Generated</span>
                                        <span
                                            class="info-box-number">৳{{ number_format($stats['total_commissions_generated'], 2) }}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="info-box">
                                    <span class="info-box-icon bg-danger"><i class="fa fa-sitemap"></i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Network Depth</span>
                                        <span
                                            class="info-box-number">{{ count(array_filter($stats['total_by_level'], fn($l) => $l['count'] > 0)) }}
                                            Levels</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Level Breakdown -->
                        <div class="mb-4">
                            <h5>Members by Level</h5>
                            <div class="table-responsive">
                                <table class="table table-sm table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Level</th>
                                            <th>Members</th>
                                            <th>Total Lifetime Earnings</th>
                                            <th>Commission Rate</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $rates = [
                                                1 => '50%',
                                                2 => '10%',
                                                3 => '5%',
                                                4 => '4%',
                                                5 => '2%',
                                                6 => '2% (split)',
                                            ];
                                        @endphp
                                        @foreach ($stats['total_by_level'] as $level => $data)
                                            <tr>
                                                <td><strong>Level {{ $level }}</strong></td>
                                                <td>{{ $data['count'] }}</td>
                                                <td>৳{{ number_format($data['total_earnings'], 2) }}</td>
                                                <td>{{ $rates[$level] ?? 'N/A' }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <hr>

                        <!-- Hierarchy Tree -->
                        <div class="hierarchy-tree">
                            <h5>Referral Tree Structure</h5>

                            @if (empty($hierarchy))
                                <p class="text-muted">No referrals found</p>
                            @else
                                <div class="tree-container">
                                    @include('admin.commissions.partials.hierarchy-node', [
                                        'nodes' => $hierarchy,
                                    ])
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .hierarchy-tree {
            font-family: monospace;
        }

        .tree-node {
            margin-left: 20px;
            padding: 10px;
            border-left: 2px solid #ddd;
            margin-bottom: 5px;
        }

        .tree-node.level-1 {
            border-left-color: #28a745;
        }

        .tree-node.level-2 {
            border-left-color: #17a2b8;
        }

        .tree-node.level-3 {
            border-left-color: #ffc107;
        }

        .tree-node.level-4 {
            border-left-color: #fd7e14;
        }

        .tree-node.level-5 {
            border-left-color: #dc3545;
        }

        .tree-node.level-6 {
            border-left-color: #6f42c1;
        }

        .user-card {
            background: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 5px;
        }
    </style>
@endsection
