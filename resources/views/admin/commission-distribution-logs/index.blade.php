@extends('core/base::layouts.master')

@section('page-title')
    Commission Distribution Logs
@endsection

@push('header')
    <style>
        .distribution-logs-page .metric-card {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            background: #fff;
            min-height: 112px;
        }

        .distribution-logs-page .metric-label {
            color: #6b7280;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }

        .distribution-logs-page .metric-value {
            color: #111827;
            font-size: 1.35rem;
            font-weight: 700;
            line-height: 1.25;
            overflow-wrap: anywhere;
        }

        .distribution-logs-page .metric-hint {
            color: #6b7280;
            font-size: 0.78rem;
        }

        .distribution-logs-page .status-pill {
            border-radius: 999px;
            display: inline-flex;
            font-size: 0.75rem;
            font-weight: 700;
            padding: 0.25rem 0.65rem;
            text-transform: capitalize;
        }

        .distribution-logs-page .status-completed {
            background: #dcfce7;
            color: #166534;
        }

        .distribution-logs-page .status-partial {
            background: #fef3c7;
            color: #92400e;
        }

        .distribution-logs-page .status-failed {
            background: #fee2e2;
            color: #991b1b;
        }

        .distribution-logs-page .status-default {
            background: #e5e7eb;
            color: #374151;
        }

        .distribution-logs-page .breakdown-panel {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            margin-top: 0.75rem;
            padding: 0.75rem;
        }

        .distribution-logs-page details summary {
            cursor: pointer;
            font-weight: 700;
        }

        .distribution-logs-page .breakdown-table {
            margin-top: 0.75rem;
            margin-bottom: 0;
        }

        .distribution-logs-page .breakdown-table td,
        .distribution-logs-page .breakdown-table th {
            padding: 0.45rem 0.5rem;
        }

        .distribution-logs-page .text-nowrap {
            white-space: nowrap;
        }
    </style>
@endpush

@section('content')
    @php
        $maxAmount = (float) ($summary->max_distributable_amount ?? 0);
        $distributedAmount = (float) ($summary->amount_distributed ?? 0);
        $distributionRate = $maxAmount > 0 ? min(100, ($distributedAmount / $maxAmount) * 100) : 0;
        $statusClass = fn($status) => match ($status) {
            'completed' => 'status-completed',
            'partial' => 'status-partial',
            'failed' => 'status-failed',
            default => 'status-default',
        };
    @endphp

    <div class="container-fluid distribution-logs-page">
        <div class="d-flex align-items-center justify-content-between flex-wrap mb-3">
            <div>
                <h3 class="mb-1">Commission Distribution Logs</h3>
                <div class="text-muted">Order-level distribution totals, payout limits, recipients, and platform profit.
                </div>
            </div>
            <a href="{{ route('admin.commissions.dashboard') }}" class="btn btn-outline-primary mt-2 mt-md-0">
                <i class="fa fa-chart-line"></i> Commission Dashboard
            </a>
        </div>

        <div class="row mb-3">
            <div class="col-xl-2 col-md-4 mb-3">
                <div class="metric-card p-3">
                    <div class="metric-label">Logs</div>
                    <div class="metric-value mt-2">{{ number_format($summary->total_logs ?? 0) }}</div>
                    <div class="metric-hint">Matching records</div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 mb-3">
                <div class="metric-card p-3">
                    <div class="metric-label">Platform Fee Cut</div>
                    <div class="metric-value mt-2">{{ format_price($summary->platform_fee_cut ?? 0) }}</div>
                    <div class="metric-hint">Source amount</div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 mb-3">
                <div class="metric-card p-3">
                    <div class="metric-label">Max Distributable</div>
                    <div class="metric-value mt-2">{{ format_price($summary->max_distributable_amount ?? 0) }}</div>
                    <div class="metric-hint">Sum of max amount</div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 mb-3">
                <div class="metric-card p-3">
                    <div class="metric-label">Distributed</div>
                    <div class="metric-value mt-2">{{ format_price($summary->amount_distributed ?? 0) }}</div>
                    <div class="metric-hint">{{ number_format($distributionRate, 1) }}% of max</div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 mb-3">
                <div class="metric-card p-3">
                    <div class="metric-label">Recipients</div>
                    <div class="metric-value mt-2">{{ number_format($summary->total_recipients ?? 0) }}</div>
                    <div class="metric-hint">Total recipients</div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 mb-3">
                <div class="metric-card p-3">
                    <div class="metric-label">Total Profit</div>
                    <div class="metric-value mt-2 text-success">{{ format_price($summary->total_profit ?? 0) }}</div>
                    <div class="metric-hint">(Max + 25%) - distributed</div>
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-lg-8 mb-3">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title mb-0">Filters</h4>
                    </div>
                    <div class="card-body">
                        <form method="GET" action="{{ route('admin.commission-distribution-logs.index') }}">
                            <div class="row align-items-end">
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Order ID or Code</label>
                                    <input type="text" name="order" class="form-control" value="{{ request('order') }}"
                                        placeholder="97 or ORD-...">
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Status</label>
                                    <select name="status" class="form-control">
                                        <option value="">All Statuses</option>
                                        @foreach ($statuses as $status)
                                            <option value="{{ $status }}" @selected(request('status') === $status)>
                                                {{ ucfirst($status) }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <label class="form-label">Date From</label>
                                    <input type="date" name="date_from" class="form-control"
                                        value="{{ request('date_from') }}">
                                </div>
                                <div class="col-md-2 mb-3">
                                    <label class="form-label">Date To</label>
                                    <input type="date" name="date_to" class="form-control"
                                        value="{{ request('date_to') }}">
                                </div>
                                <div class="col-md-2 mb-3">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-filter"></i> Filter
                                    </button>
                                    <a href="{{ route('admin.commission-distribution-logs.index') }}"
                                        class="btn btn-secondary">
                                        Reset
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <h4 class="card-title mb-0">Status Summary</h4>
                    </div>
                    <div class="card-body">
                        @forelse ($statusSummary as $row)
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <div>
                                    <span class="status-pill {{ $statusClass($row->status) }}">{{ $row->status }}</span>
                                    <div class="text-muted mt-1">{{ number_format($row->count) }} logs</div>
                                </div>
                                <strong>{{ format_price($row->distributed) }}</strong>
                            </div>
                        @empty
                            <div class="text-muted text-center py-4">No distribution logs found.</div>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h4 class="card-title mb-0">Logs</h4>
                <div class="text-muted">{{ $logs->total() }} records</div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Order</th>
                                <th>Customer</th>
                                <th>Status</th>
                                <th class="text-right">Platform Fee</th>
                                <th class="text-right">Max</th>
                                <th class="text-right">Distributed</th>
                                <th class="text-right">Profit</th>
                                <th class="text-center">Recipients</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($logs as $log)
                                @php
                                    $breakdown = is_array($log->distribution_breakdown)
                                        ? $log->distribution_breakdown
                                        : [];
                                    $rowMax = (float) $log->max_distributable_amount;
                                    $rowDistributed = (float) $log->amount_distributed;
                                    $rowRate = $rowMax > 0 ? min(100, ($rowDistributed / $rowMax) * 100) : 0;
                                @endphp
                                <tr>
                                    <td class="text-nowrap">#{{ $log->id }}</td>
                                    <td>
                                        @if ($log->order_id)
                                            <a href="{{ route('orders.edit', $log->order_id) }}" target="_blank">
                                                {{ $log->order_code ?: 'Order #' . $log->order_id }}
                                            </a>
                                            <div class="text-muted">ID: {{ $log->order_id }}</div>
                                        @else
                                            <span class="text-muted">No order</span>
                                        @endif
                                        @if ($log->revenue_id)
                                            <div class="text-muted">Revenue #{{ $log->revenue_id }}</div>
                                        @endif
                                    </td>
                                    <td>
                                        @if ($log->customer_id)
                                            <a href="{{ route('admin.commissions.user-history', $log->customer_id) }}">
                                                {{ $log->customer_name ?: 'Customer #' . $log->customer_id }}
                                            </a>
                                            <div class="text-muted">{{ $log->customer_username ?: $log->customer_email }}
                                            </div>
                                        @else
                                            <span class="text-muted">Guest or deleted customer</span>
                                        @endif
                                    </td>
                                    <td>
                                        <span
                                            class="status-pill {{ $statusClass($log->status) }}">{{ $log->status }}</span>
                                        <div class="text-muted mt-1">{{ number_format($rowRate, 1) }}% distributed</div>
                                    </td>
                                    <td class="text-right text-nowrap">{{ format_price($log->platform_fee_cut) }}</td>
                                    <td class="text-right text-nowrap">{{ format_price($log->max_distributable_amount) }}
                                    </td>
                                    <td class="text-right text-nowrap">
                                        <strong>{{ format_price($log->amount_distributed) }}</strong>
                                    </td>
                                    <td class="text-right text-nowrap">
                                        <strong class="{{ $log->total_profit >= 0 ? 'text-success' : 'text-danger' }}">
                                            {{ format_price($log->total_profit) }}
                                        </strong>
                                    </td>
                                    <td class="text-center">{{ number_format($log->total_recipients) }}</td>
                                    <td class="text-nowrap">
                                        {{ $log->created_at->format('d M Y H:i') }}
                                    </td>
                                </tr>

                            @empty
                                <tr>
                                    <td colspan="10" class="text-center text-muted py-5">No distribution logs found.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer">
                {{ $logs->links() }}
            </div>
        </div>
    </div>
@endsection
