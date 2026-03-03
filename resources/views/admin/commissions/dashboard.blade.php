@extends('core/base::layouts.master')

@section('page-title')
    Commission Dashboard
@endsection

@push('header')
    <link rel="stylesheet" href="{{ asset('vendor/core/core/base/libraries/apexchart/apexcharts.css') }}">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --glass-bg: rgba(255, 255, 255, 0.75);
            --glass-border: rgba(255, 255, 255, 0.4);
            --shadow-3d: 0 10px 30px -5px rgba(0, 0, 0, 0.1), 0 5px 15px -5px rgba(0, 0, 0, 0.04);
            --accent-primary: #6366f1;
            --accent-success: #10b981;
            --accent-warning: #f59e0b;
            --accent-purple: #8b5cf6;
            --accent-danger: #ef4444;
        }

        .commission-dashboard {
            font-family: 'Outfit', sans-serif;
            padding: 20px 0;
            background: #f8fafc;
        }

        /* --- Animations --- */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulseGlow {
            0% { box-shadow: 0 0 0 0 rgba(99, 102, 241, 0.4); }
            70% { box-shadow: 0 0 0 15px rgba(99, 102, 241, 0); }
            100% { box-shadow: 0 0 0 0 rgba(99, 102, 241, 0); }
        }

        .animate-in {
            animation: fadeInUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) both;
        }

        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.2s; }
        .delay-3 { animation-delay: 0.3s; }
        .delay-4 { animation-delay: 0.4s; }

        /* --- Premium Cards --- */
        .commission-dashboard .card {
            background: var(--glass-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            box-shadow: var(--shadow-3d);
            transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
            overflow: hidden;
        }

        .commission-dashboard .card:hover {
            transform: translateY(-8px) scale(1.01);
            box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.15);
            border-color: rgba(99, 102, 241, 0.3);
        }

        .commission-dashboard .stat-card .card-body {
            display: flex;
            align-items: center;
            gap: 24px; /* Reliable spacing between icon and text */
            padding: 1.5rem !important;
        }

        .commission-dashboard .stat-card .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            transition: all 0.3s ease;
            position: relative;
            flex-shrink: 0;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .commission-dashboard .stat-card:hover .stat-icon {
            transform: rotate(10deg) scale(1.1);
        }

        .commission-dashboard .stat-value {
            font-size: 1.85rem;
            font-weight: 700;
            letter-spacing: -0.5px;
            color: #1e293b;
        }

        .commission-dashboard .stat-card-vibrant .stat-value,
        .commission-dashboard .stat-card-vibrant .stat-label {
            color: #fff !important;
        }

        .commission-dashboard .stat-card-vibrant .stat-label {
            opacity: 0.9;
        }

        .commission-dashboard .stat-label {
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #64748b;
            margin-top: 4px;
        }

        /* --- Table & List Styles --- */
        .commission-dashboard .table thead th {
            background: rgba(241, 245, 249, 0.5);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.05em;
            font-weight: 700;
            color: #475569;
            padding: 15px 20px;
        }

        .commission-dashboard .table td {
            vertical-align: middle;
            padding: 15px 20px;
            border-bottom: 1px solid rgba(226, 232, 240, 0.5);
        }

        .commission-dashboard .badge-type {
            font-family: inherit;
            font-size: 0.75rem;
            font-weight: 700;
            padding: 6px 14px;
            border-radius: 100px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        /* --- Top Earner List --- */
        .top-earner-item {
            display: flex;
            align-items: center;
            gap: 16px; /* Robust spacing between avatar and info */
            margin-bottom: 20px;
            padding: 8px;
            border-radius: 12px;
            transition: all 0.2s ease;
        }

        .top-earner-item:hover {
            background: rgba(99, 102, 241, 0.04);
        }

        .top-earner-avatar {
            width: 44px;
            height: 44px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            flex-shrink: 0;
        }

        /* --- 3D Progress Bars --- */
        .trend-bar {
            background: #f1f5f9;
            border-radius: 100px;
            height: 8px;
            overflow: hidden;
            box-shadow: inset 0 2px 4px rgba(0,0,0,0.05);
        }

        .trend-bar-fill {
            height: 100%;
            border-radius: 100px;
            position: relative;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .section-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: #1e293b;
            display: flex;
            align-items: center;
        }

        .section-title i {
            width: 32px;
            height: 32px;
            background: #eff6ff;
            color: #3b82f6;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }

        /* --- Chart Containers --- */
        .chart-container {
            min-height: 250px;
            filter: drop-shadow(0 10px 15px rgba(0,0,0,0.05));
        }

        .col-xl-5th {
            flex: 0 0 20%;
            max-width: 20%;
            padding: 0 12px; /* Increased gutter */
        }

        @media (max-width: 1200px) {
            .col-xl-5th {
                flex: 0 0 33.3333%;
                max-width: 33.3333%;
            }
        }

        @media (max-width: 991px) {
            .col-xl-5th {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        @media (max-width: 575px) {
            .col-xl-5th {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }

        /* Custom Scrollbar */
        .commission-dashboard ::-webkit-scrollbar { width: 6px; }
        .commission-dashboard ::-webkit-scrollbar-track { background: transparent; }
        .commission-dashboard ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
        .commission-dashboard ::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
    </style>
@endpush

@section('content')
    <div class="commission-dashboard">

        {{-- ===== DATE FILTER BAR ===== --}}
        <div class="card mb-4" style="border-radius:12px;border:none;box-shadow:0 2px 12px rgba(0,0,0,.08)">
            <div class="card-body py-3">
                <form method="GET" action="{{ route('admin.commissions.dashboard') }}" class="d-flex align-items-end flex-wrap gap-2">
                    <div class="mr-3">
                        <label class="d-block" style="font-size:.75rem;font-weight:600;text-transform:uppercase;color:#6c757d;margin-bottom:4px">From</label>
                        <input type="date" name="date_from" class="form-control form-control-sm" style="min-width:150px" value="{{ $dateFrom }}">
                    </div>
                    <div class="mr-3">
                        <label class="d-block" style="font-size:.75rem;font-weight:600;text-transform:uppercase;color:#6c757d;margin-bottom:4px">To</label>
                        <input type="date" name="date_to" class="form-control form-control-sm" style="min-width:150px" value="{{ $dateTo }}">
                    </div>
                    <div class="mr-3">
                        <button type="submit" class="btn btn-primary btn-sm px-4">
                            <i class="fa fa-filter mr-1"></i> Apply
                        </button>
                        <a href="{{ route('admin.commissions.dashboard') }}" class="btn btn-secondary btn-sm ml-1">Reset</a>
                    </div>
                    {{-- Quick presets --}}
                    <div class="quick-filter ml-auto d-flex align-items-center flex-wrap gap-1" style="margin-top:4px">
                        <span style="font-size:.75rem;color:#6c757d;font-weight:600;margin-right:6px">Quick:</span>
                        @php
                            $presets = [
                                'Today'       => [now()->toDateString(), now()->toDateString()],
                                'This Week'   => [now()->startOfWeek()->toDateString(), now()->toDateString()],
                                'This Month'  => [now()->startOfMonth()->toDateString(), now()->toDateString()],
                                'Last Month'  => [now()->subMonth()->startOfMonth()->toDateString(), now()->subMonth()->endOfMonth()->toDateString()],
                                'Last 3M'     => [now()->subMonths(3)->toDateString(), now()->toDateString()],
                            ];
                        @endphp
                        @foreach($presets as $label => [$from, $to])
                            <a href="{{ route('admin.commissions.dashboard', ['date_from' => $from, 'date_to' => $to]) }}"
                               class="btn btn-sm {{ $dateFrom === $from && $dateTo === $to ? 'btn-primary' : 'btn-outline-secondary' }}"
                               style="font-size:.75rem;padding:3px 10px">{{ $label }}</a>
                        @endforeach
                    </div>
                </form>
            </div>
        </div>

        {{-- ===== ROW 1 — SUMMARY CARDS ===== --}}
        <div class="row mb-5 no-gutters" style="margin: 0 -12px;">

            {{-- Total Distributed --}}
            <div class="col-xl-5th mb-3 animate-in">
                <div class="card stat-card stat-card-vibrant h-100 p-0" style="background: linear-gradient(135deg, #4f46e5, #6366f1); border:none; box-shadow: 0 10px 25px -5px rgba(79, 70, 229, 0.4);">
                    <div class="card-body">
                        <div class="stat-icon" style="background: rgba(255,255,255,0.15); color: #fff; border: 1px solid rgba(255,255,255,0.2);">
                            <i class="fas fa-building-columns"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="stat-value">৳{{ number_format($totalCommissionsDistributed, 0) }}</div>
                            <div class="stat-label">Total Allocated</div>
                            <small style="color:rgba(255,255,255,0.7); font-weight:500">{{ number_format($totalCommissionRecords) }} txns</small>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Available Balance --}}
            <div class="col-xl-5th mb-3 animate-in delay-1">
                <div class="card stat-card stat-card-vibrant h-100 p-0" style="background: linear-gradient(135deg, #059669, #10b981); border:none; box-shadow: 0 15px 30px -5px rgba(16, 185, 129, 0.4); animation: pulseGlow 3s infinite;">
                    <div class="card-body">
                        <div class="stat-icon" style="background: rgba(255,255,255,0.2); color: #fff; border: 1px solid rgba(255,255,255,0.25);">
                            <i class="fas fa-wallet text-white"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="stat-value">৳{{ number_format($availableBalance, 0) }}</div>
                            <div class="stat-label">System Liability</div>
                            <small style="color:rgba(255,255,255,0.75); font-weight:600">All-time Available</small>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Completed Cashouts --}}
            <div class="col-xl-5th mb-3 animate-in delay-2">
                <div class="card stat-card stat-card-vibrant h-100 p-0" style="background: linear-gradient(135deg, #2563eb, #3b82f6); border:none; box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4);">
                    <div class="card-body">
                        <div class="stat-icon" style="background: rgba(255,255,255,0.15); color: #fff; border: 1px solid rgba(255,255,255,0.2);">
                            <i class="fas fa-circle-check"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="stat-value">৳{{ number_format($cashoutStats->completed_amount ?? 0, 0) }}</div>
                            <div class="stat-label">Paid Out</div>
                            <small style="color:rgba(255,255,255,0.7); font-weight:500">{{ number_format($cashoutStats->completed_count ?? 0) }} completed</small>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Pending Cashouts --}}
            <div class="col-xl-5th mb-3 animate-in delay-3">
                <div class="card stat-card stat-card-vibrant h-100 p-0" style="background: linear-gradient(135deg, #ea580c, #f97316); border:none; box-shadow: 0 10px 25px -5px rgba(234, 88, 12, 0.4);">
                    <div class="card-body">
                        <div class="stat-icon" style="background: rgba(255,255,255,0.15); color: #fff; border: 1px solid rgba(255,255,255,0.2);">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="stat-value text-white">৳{{ number_format($cashoutStats->pending_amount ?? 0, 0) }}</div>
                            <div class="stat-label">In Queue</div>
                            <small style="color:rgba(255,255,255,0.7); font-weight:500">{{ number_format($cashoutStats->pending_count ?? 0) }} requests</small>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Active Affiliates --}}
            <div class="col-xl-5th mb-3 animate-in delay-4">
                <div class="card stat-card stat-card-vibrant h-100 p-0" style="background: linear-gradient(135deg, #7c3aed, #8b5cf6); border:none; box-shadow: 0 10px 25px -5px rgba(124, 58, 237, 0.4);">
                    <div class="card-body">
                        <div class="stat-icon" style="background: rgba(255,255,255,0.15); color: #fff; border: 1px solid rgba(255,255,255,0.2);">
                            <i class="fas fa-users-viewfinder"></i>
                        </div>
                        <div class="flex-grow-1">
                            <div class="stat-value">{{ number_format($activeAffiliates) }}</div>
                            <div class="stat-label">Active Users</div>
                            <small style="color:rgba(255,255,255,0.7); font-weight:500">Earnings this period</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- ===== ROW 2 — BREAKDOWN + TOP EARNERS ===== --}}
        <div class="row mb-4">

            {{-- Commission Type Breakdown --}}
            <div class="col-lg-7 mb-3">
                <div class="card h-100" style="border-radius:12px;border:none;box-shadow:0 2px 12px rgba(0,0,0,.08)">
                    <div class="card-header d-flex justify-content-between align-items-center" style="background:transparent;border-bottom:1px solid #f0f0f0">
                        <span class="section-title"><i class="fa fa-pie-chart mr-2 text-primary"></i>Commission Distribution by Type</span>
                        <a href="{{ route('admin.commissions.index', ['date_from' => $dateFrom, 'date_to' => $dateTo]) }}"
                           class="btn btn-sm btn-outline-primary" style="font-size:.75rem">View All →</a>
                    </div>
                    <div class="card-body p-0">
                        <div class="row align-items-center">
                            <div class="col-md-6 border-right">
                                @if($commissionBreakdown->isEmpty())
                                    <div class="text-center text-muted py-5">
                                        <i class="fa fa-inbox fa-2x mb-2 d-block"></i>No commission data for this period
                                    </div>
                                @else
                                    @php $maxTotal = $commissionBreakdown->max('total_distributed'); @endphp
                                    <table class="table mb-0" style="font-size:.875rem">
                                        <thead>
                                            <tr style="background:#f8f9fa">
                                                <th class="border-0 pl-4">Type</th>
                                                <th class="border-0 text-right pr-4">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($commissionBreakdown as $row)
                                                @php
                                                    $type = $row->commission_type;
                                                    if (str_contains($type, 'referral_level')) {
                                                        $badgeColor = '#3699FF'; $bg = '#e8f4ff';
                                                    } elseif ($type === 'global_thrive_pool') {
                                                        $badgeColor = '#1BC5BD'; $bg = '#e6f9f0';
                                                    } elseif ($type === 'empire_builder_pool') {
                                                        $badgeColor = '#FFA800'; $bg = '#fff8e6';
                                                    } elseif (str_contains($type, 'reversal')) {
                                                        $badgeColor = '#F64E60'; $bg = '#fee8eb';
                                                    } else {
                                                        $badgeColor = '#8950FC'; $bg = '#f3e8ff';
                                                    }
                                                @endphp
                                                <tr>
                                                    <td class="pl-4">
                                                        <div class="d-flex align-items-center">
                                                            <div style="width:30px;height:30px;border-radius:8px;background:{{ $bg }};color:{{ $badgeColor }};display:flex;align-items:center;justify-content:center;font-size:14px;margin-right:10px;flex-shrink:0">
                                                                <i class="fas fa-coins"></i>
                                                            </div>
                                                            <div class="flex-grow-1">
                                                                <div style="font-weight: 700; color: #1e293b; font-size: 0.9rem;">
                                                                    @php
                                                                        $label = match($row->commission_type) {
                                                                            'referral_level_1' => 'Direct Sale Bonus',
                                                                            'referral_level_2' => 'Alliance Bonus Lvl 1',
                                                                            'referral_level_3' => 'Alliance Bonus Lvl 2',
                                                                            'referral_level_4' => 'Alliance Bonus Lvl 3',
                                                                            'referral_level_5' => 'Alliance Bonus Lvl 4',
                                                                            'referral_level_6' => 'Alliance Bonus Lvl 5',
                                                                            'referral_level_7_plus' => 'Alliance Bonus Lvl 6+',
                                                                            default => ucwords(str_replace('_', ' ', $row->commission_type)),
                                                                        };
                                                                    @endphp
                                                                    {{ $label }}
                                                                </div>
                                                                <small class="text-muted" style="font-weight: 600; font-size: 0.75rem;">
                                                                    {{ $row->record_count }} records
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="text-right pr-4">
                                                        <strong style="color:{{ $badgeColor }}">৳{{ number_format($row->total_distributed, 0) }}</strong>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                @endif
                            </div>
                            <div class="col-md-6">
                                <div id="commission-type-chart" class="chart-container"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Top Earners --}}
            <div class="col-lg-5 mb-3">
                <div class="card h-100" style="border-radius:12px;border:none;box-shadow:0 2px 12px rgba(0,0,0,.08)">
                    <div class="card-header d-flex justify-content-between align-items-center" style="background:transparent;border-bottom:1px solid #f0f0f0">
                        <span class="section-title"><i class="fas fa-trophy text-warning"></i>Top Earners</span>
                        <small class="text-muted">{{ \Carbon\Carbon::parse($dateFrom)->format('d M') }} – {{ \Carbon\Carbon::parse($dateTo)->format('d M Y') }}</small>
                    </div>
                    <div class="card-body">
                        @if($topEarners->isEmpty())
                            <div class="text-center text-muted py-4">
                                <i class="fas fa-users fa-2x mb-2 d-block"></i>No earners in this period
                            </div>
                        @else
                            @foreach($topEarners as $i => $earner)
                                <div class="top-earner-item animate-in" style="animation-delay: {{ $i * 0.1 }}s">
                                    <div class="position-relative">
                                        <span class="top-earner-avatar" style="{{ $i === 0 ? 'background:linear-gradient(135deg,#FFA800,#FF6B00)' : ($i === 1 ? 'background:linear-gradient(135deg,#B0B8C1,#6c757d)' : ($i === 2 ? 'background:linear-gradient(135deg,#CD7F32,#8B4513)' : 'background:#f1f5f9;color:#64748b')) }}">
                                            {{ strtoupper(substr($earner->customer_name, 0, 1)) }}
                                        </span>
                                        <span style="position:absolute;top:-5px;right:-5px;background:#fff;border-radius:50%;width:20px;height:20px;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:800;box-shadow:0 2px 4px rgba(0,0,0,0.1);color:#1e293b">
                                            #{{ $i + 1 }}
                                        </span>
                                    </div>
                                    <div class="flex-grow-1 min-width-0">
                                        <div class="d-flex align-items-center">
                                            <a href="{{ route('admin.commissions.user-history', $earner->customer_id) }}"
                                               style="font-weight:700;font-size:.9rem;color:#1e293b;text-decoration:none">
                                                {{ $earner->customer_name }}
                                            </a>
                                            @if($earner->level_name)
                                                <span class="ml-2" style="font-size:10px;text-transform:uppercase;letter-spacing:0.5px;background:#f1f5f9;color:#64748b;font-weight:700;border-radius:4px;padding:1px 6px">
                                                    {{ $earner->level_name }}
                                                </span>
                                            @endif
                                        </div>
                                        <div class="mt-1">
                                            <small class="text-muted"><i class="fas fa-at mr-1" style="font-size:10px"></i>{{ $earner->username }}</small>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <strong class="text-success d-block" style="font-size:1rem">৳{{ number_format($earner->total_earned, 0) }}</strong>
                                        <small class="text-muted" style="font-size:10px;font-weight:600">{{ $earner->commission_count }} records</small>
                                    </div>
                                </div>
                                @if(!$loop->last)<hr class="my-2" style="border-top:1px dashed #eee">@endif
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
        </div>

        {{-- ===== ROW 3 — CASHOUT BREAKDOWN + DAILY TREND ===== --}}
        <div class="row mb-4">

            {{-- Cashout Status Breakdown --}}
            <div class="col-lg-4 mb-3">
                <div class="card h-100" style="border-radius:12px;border:none;box-shadow:0 2px 12px rgba(0,0,0,.08)">
                    <div class="card-header" style="background:transparent;border-bottom:1px solid #f0f0f0">
                        <span class="section-title"><i class="fa fa-exchange mr-2 text-success"></i>Cashout Breakdown</span>
                    </div>
                    <div class="card-body">
                        @php
                            $cashoutRows = [
                                ['label' => 'Completed', 'amount' => $cashoutStats->completed_amount ?? 0, 'count' => $cashoutStats->completed_count ?? 0, 'color' => '#1BC5BD', 'bg' => '#e6f9f0', 'icon' => 'circle-check'],
                                ['label' => 'Pending / Processing', 'amount' => $cashoutStats->pending_amount ?? 0, 'count' => $cashoutStats->pending_count ?? 0, 'color' => '#FFA800', 'bg' => '#fff8e6', 'icon' => 'clock'],
                                ['label' => 'Rejected', 'amount' => $cashoutStats->rejected_amount ?? 0, 'count' => $cashoutStats->rejected_count ?? 0, 'color' => '#F64E60', 'bg' => '#fee8eb', 'icon' => 'circle-xmark'],
                            ];
                            $totalCashout = collect($cashoutRows)->sum('amount');
                        @endphp
                        @foreach($cashoutRows as $row)
                            <div class="d-flex align-items-center mb-3">
                                <div style="width:38px;height:38px;border-radius:10px;background:{{ $row['bg'] }};color:{{ $row['color'] }};display:flex;align-items:center;justify-content:center;font-size:16px;margin-right:12px;flex-shrink:0">
                                    <i class="fas fa-{{ $row['icon'] }}"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <div style="font-weight:600;font-size:.8rem">{{ $row['label'] }}</div>
                                    <div class="trend-bar mt-1">
                                        <div class="trend-bar-fill"
                                             style="width:{{ $totalCashout > 0 ? round(($row['amount']/$totalCashout)*100) : 0 }}%;background:{{ $row['color'] }}"></div>
                                    </div>
                                </div>
                                <div class="text-right ml-3" style="min-width:100px">
                                    <strong style="color:{{ $row['color'] }}">৳{{ number_format($row['amount'], 0) }}</strong>
                                    <div><small class="text-muted">{{ number_format($row['count']) }} req.</small></div>
                                </div>
                            </div>
                        @endforeach

                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <span style="font-weight:700">Total Cashouts</span>
                            <strong class="text-primary">৳{{ number_format($totalCashout, 0) }}</strong>
                        </div>

                        <div class="mt-3">
                            <a href="{{ route('admin.withdrawals.index', ['date_from' => $dateFrom, 'date_to' => $dateTo]) }}"
                               class="btn btn-sm btn-outline-success btn-block">
                                <i class="fa fa-list mr-1"></i> View All Withdrawals
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Daily Trend Table --}}
            <div class="col-lg-8 mb-3">
                <div class="card h-100" style="border-radius:12px;border:none;box-shadow:0 2px 12px rgba(0,0,0,.08)">
                    <div class="card-header d-flex justify-content-between align-items-center" style="background:transparent;border-bottom:1px solid #f0f0f0">
                        <span class="section-title"><i class="fa fa-bar-chart mr-2 text-primary"></i>Daily Commission Trend</span>
                        <small class="text-muted">{{ $dailyTrend->count() }} active days</small>
                    </div>
                    <div class="card-body p-0">
                        <div class="p-3">
                            <div id="daily-trend-chart" class="chart-container"></div>
                        </div>
                        <div style="max-height:220px;overflow-y:auto">
                            @if($dailyTrend->isEmpty())
                                <div class="text-center text-muted py-5">
                                    <i class="fa fa-bar-chart fa-2x mb-2 d-block"></i>No data in this period
                                </div>
                            @else
                                @php $maxDay = $dailyTrend->max('total'); @endphp
                                <table class="table table-sm mb-0 trend-bar-row" style="font-size:.85rem">
                                    <thead>
                                        <tr style="background:#f8f9fa">
                                            <th class="border-0 pl-4">Date</th>
                                            <th class="border-0 text-center">Records</th>
                                            <th class="border-0 text-right pr-4">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($dailyTrend->sortByDesc('date') as $day)
                                            <tr>
                                                <td class="pl-4">
                                                    {{ \Carbon\Carbon::parse($day->date)->format('d M') }}
                                                </td>
                                                <td class="text-center">{{ number_format($day->count) }}</td>
                                                <td class="text-right pr-4">
                                                    <strong class="text-primary">৳{{ number_format($day->total, 0) }}</strong>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- ===== ACTION LINKS ===== --}}
        <div class="row">
            <div class="col-12">
                <div class="card" style="border-radius:12px;border:none;box-shadow:0 2px 12px rgba(0,0,0,.08)">
                    <div class="card-body py-3 d-flex flex-wrap gap-2">
                        <a href="{{ route('admin.commissions.index') }}" class="btn btn-primary mr-2">
                            <i class="fa fa-list mr-1"></i> All Commissions
                        </a>
                        <a href="{{ route('admin.withdrawals.index') }}" class="btn btn-success mr-2">
                            <i class="fa fa-exchange mr-1"></i> All Withdrawals
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

@push('footer')
    <script src="{{ asset('vendor/core/core/base/libraries/apexchart/apexcharts.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            // Options that are common to all charts for modern look
            var commonOptions = {
                chart: {
                    dropShadow: {
                        enabled: true,
                        top: 4,
                        left: 0,
                        blur: 8,
                        opacity: 0.1
                    },
                    fontFamily: "'Outfit', sans-serif"
                },
                states: {
                    hover: { filter: { type: 'darken', value: 0.95 } }
                }
            };

            // --- Commission Type Pie Chart ---
            var typeData = @json($chartTypeData);

            if (typeData.length > 0) {
                new ApexCharts(document.querySelector("#commission-type-chart"), $.extend(true, {}, commonOptions, {
                    series: typeData.map(d => d.value),
                    chart: { type: 'donut', height: 280 },
                    labels: typeData.map(d => d.label),
                    colors: typeData.map(d => d.color),
                    stroke: { width: 0 },
                    legend: { position: 'bottom', fontSize: '12px', fontWeight: 600 },
                    dataLabels: { enabled: false },
                    plotOptions: {
                        pie: {
                            donut: {
                                size: '75%',
                                labels: {
                                    show: true,
                                    total: {
                                        show: true,
                                        label: 'Total',
                                        formatter: function (w) {
                                            return "৳" + w.globals.seriesTotals.reduce((a, b) => a + b, 0).toLocaleString();
                                        }
                                    }
                                }
                            }
                        }
                    }
                })).render();
            }

            // --- Daily Trend Bar Chart ---
            var trendData = @json($chartTrendData);

            if (trendData.length > 0) {
                new ApexCharts(document.querySelector("#daily-trend-chart"), $.extend(true, {}, commonOptions, {
                    series: [{
                        name: 'Distributed Amount',
                        data: trendData.map(d => d.value)
                    }],
                    chart: {
                        type: 'bar',
                        height: 220,
                        toolbar: { show: false }
                    },
                    colors: ['#6366f1'],
                    plotOptions: {
                        bar: {
                            borderRadius: 6,
                            columnWidth: '45%',
                            distributed: false,
                            dataLabels: { position: 'top' }
                        }
                    },
                    grid: { borderColor: '#f1f5f9', strokeDashArray: 4 },
                    dataLabels: { enabled: false },
                    xaxis: {
                        categories: trendData.map(d => d.date),
                        axisBorder: { show: false },
                        axisTicks: { show: false },
                        labels: { style: { colors: '#64748b', fontWeight: 500 } }
                    },
                    yaxis: {
                        labels: {
                            formatter: function (val) { return "৳" + (val/1000).toFixed(1) + "k"; },
                            style: { colors: '#64748b' }
                        }
                    },
                    fill: {
                        type: 'gradient',
                        gradient: {
                            shade: 'light',
                            type: "vertical",
                            shadeIntensity: 0.5,
                            gradientToColors: ['#818cf8'],
                            inverseColors: true,
                            opacityFrom: 0.9,
                            opacityTo: 0.7,
                            stops: [0, 100]
                        }
                    }
                })).render();
            }
        });
    </script>
@endpush
