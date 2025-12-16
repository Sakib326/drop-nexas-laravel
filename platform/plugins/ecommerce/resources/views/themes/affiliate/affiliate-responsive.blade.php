<style>
    /* ============================================
       AFFILIATE DASHBOARD - ULTRA RESPONSIVE CSS
       Mobile-First Approach
       ============================================ */

    /* Base Styles */
    .affiliate-dashboard-page {
        padding: 20px 0;
    }

    .affiliate-dashboard-page .container {
        padding-left: 15px;
        padding-right: 15px;
    }

    /* Mobile Menu Toggle Button */
    .mobile-menu-toggle {
        width: 100%;
        padding: 15px 20px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff;
        border: none;
        border-radius: 10px;
        display: none;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        font-weight: 600;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .mobile-menu-toggle i {
        margin-right: 10px;
        font-size: 20px;
    }

    .mobile-menu-toggle:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }

    .mobile-menu-toggle:active {
        transform: translateY(0);
    }

    /* Mobile Menu Overlay */
    .mobile-menu-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 999;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
    }

    .mobile-menu-overlay.active {
        opacity: 1;
        visibility: visible;
    }

    /* Dashboard Menu - Mobile First */
    .affiliate-dashboard-page .dashboard-menu {
        background: #fff;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    .affiliate-dashboard-page .dashboard-menu .nav-link {
        padding: 12px 15px;
        border-radius: 8px;
        margin-bottom: 5px;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        color: #253D4E;
        font-size: 14px;
        font-weight: 500;
    }

    .affiliate-dashboard-page .dashboard-menu .nav-link i {
        margin-right: 10px;
        font-size: 18px;
        min-width: 20px;
    }

    .affiliate-dashboard-page .dashboard-menu .nav-link:hover {
        background: #f7f7f7;
        color: #3BB77E;
    }

    .affiliate-dashboard-page .dashboard-menu .nav-link.active {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff;
    }

    /* Cards */
    .affiliate-dashboard-page .card {
        border: 1px solid #ececec;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        margin-bottom: 20px;
    }

    .affiliate-dashboard-page .card-header {
        background: #fff;
        border-bottom: 1px solid #ececec;
        padding: 15px 20px;
        border-radius: 10px 10px 0 0;
    }

    .affiliate-dashboard-page .card-header h3,
    .affiliate-dashboard-page .card-header h5 {
        font-size: 18px;
        font-weight: 600;
        margin: 0;
    }

    .affiliate-dashboard-page .card-body {
        padding: 20px;
    }

    /* Stat Cards - Mobile First */
    .affiliate-dashboard-page .dashboard-stat-card {
        background: #fff;
        border: 1px solid #ececec;
        border-radius: 10px;
        padding: 15px;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
        margin-bottom: 15px;
        min-height: 90px;
    }

    .affiliate-dashboard-page .dashboard-stat-card:hover {
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        transform: translateY(-3px);
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-icon {
        width: 50px;
        height: 50px;
        border-radius: 10px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
        flex-shrink: 0;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-icon i {
        font-size: 20px;
        color: #fff;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-info {
        flex: 1;
        min-width: 0;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-info h4 {
        margin: 0;
        font-size: 20px;
        font-weight: 700;
        color: #253D4E;
        word-break: break-word;
    }

    .affiliate-dashboard-page .dashboard-stat-card .card-info p {
        margin: 5px 0 0;
        font-size: 12px;
        line-height: 1.3;
    }

    /* Colored Stat Cards */
    .affiliate-dashboard-page .dashboard-stat-card.bg-success {
        background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-warning {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-secondary {
        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    }

    .affiliate-dashboard-page .dashboard-stat-card.bg-success .card-icon,
    .affiliate-dashboard-page .dashboard-stat-card.bg-primary .card-icon,
    .affiliate-dashboard-page .dashboard-stat-card.bg-warning .card-icon,
    .affiliate-dashboard-page .dashboard-stat-card.bg-secondary .card-icon {
        background: rgba(255, 255, 255, 0.2);
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

    /* Welcome Message */
    .affiliate-dashboard-page .welcome-msg {
        padding: 20px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 10px;
        color: #fff;
        margin-bottom: 20px;
    }

    .affiliate-dashboard-page .welcome-msg h5 {
        color: #fff;
        font-size: 20px;
        font-weight: 600;
        margin-bottom: 10px;
    }

    .affiliate-dashboard-page .welcome-msg p {
        color: rgba(255, 255, 255, 0.9);
        margin-bottom: 0;
        font-size: 14px;
    }

    /* Forms - Mobile Optimized */
    .affiliate-dashboard-page .form-control {
        height: 45px;
        border-radius: 8px;
        border: 1px solid #ececec;
        padding: 10px 15px;
        font-size: 14px;
    }

    .affiliate-dashboard-page .form-control:focus {
        border-color: #3BB77E;
        box-shadow: 0 0 0 0.2rem rgba(59, 183, 126, 0.15);
    }

    .affiliate-dashboard-page select.form-control {
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23253D4E' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 15px center;
        padding-right: 40px;
    }

    .affiliate-dashboard-page textarea.form-control {
        height: auto;
        resize: vertical;
    }

    .affiliate-dashboard-page .form-label {
        font-weight: 600;
        color: #253D4E;
        margin-bottom: 8px;
        font-size: 14px;
    }

    /* Buttons - Touch Friendly */
    .affiliate-dashboard-page .btn {
        border-radius: 8px;
        padding: 12px 24px;
        font-weight: 600;
        transition: all 0.3s ease;
        font-size: 14px;
        min-height: 45px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }

    .affiliate-dashboard-page .btn i {
        margin-right: 8px;
    }

    .affiliate-dashboard-page .btn-sm {
        padding: 8px 16px;
        font-size: 13px;
        min-height: 36px;
    }

    .affiliate-dashboard-page .btn-lg {
        padding: 15px 30px;
        font-size: 16px;
        min-height: 50px;
    }

    /* Tables - Mobile Responsive */
    .affiliate-dashboard-page .table-responsive {
        border-radius: 8px;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
    }

    .affiliate-dashboard-page .table {
        margin-bottom: 0;
        min-width: 600px;
    }

    .affiliate-dashboard-page .table thead th {
        background: #f7f7f7;
        border-bottom: 2px solid #ececec;
        color: #253D4E;
        font-weight: 600;
        padding: 15px;
        font-size: 13px;
        white-space: nowrap;
    }

    .affiliate-dashboard-page .table tbody td {
        padding: 15px;
        vertical-align: middle;
        border-bottom: 1px solid #ececec;
        font-size: 14px;
    }

    .affiliate-dashboard-page .table tbody tr:last-child td {
        border-bottom: none;
    }

    .affiliate-dashboard-page .table tbody tr:hover {
        background: #f9f9f9;
    }

    /* Badges */
    .affiliate-dashboard-page .badge {
        padding: 6px 12px;
        border-radius: 6px;
        font-weight: 600;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    /* Alerts */
    .affiliate-dashboard-page .alert {
        border-radius: 8px;
        padding: 15px 20px;
        border: none;
        font-size: 14px;
    }

    .affiliate-dashboard-page .alert-info {
        background: #e7f3ff;
        color: #0066cc;
    }

    .affiliate-dashboard-page .alert-success {
        background: #d4edda;
        color: #155724;
    }

    .affiliate-dashboard-page .alert-warning {
        background: #fff3cd;
        color: #856404;
    }

    .affiliate-dashboard-page .alert-danger {
        background: #f8d7da;
        color: #721c24;
    }

    /* Pagination */
    .affiliate-dashboard-page .pagination {
        justify-content: center;
        margin-top: 20px;
    }

    .affiliate-dashboard-page .page-link {
        border-radius: 6px;
        margin: 0 3px;
        min-width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
    }

    /* Tree View Styles */
    .tree-node {
        margin-left: 0;
        padding: 10px 0;
    }

    .node-content {
        display: flex;
        align-items: center;
        padding: 12px;
        background: #fff;
        border: 1px solid #ececec;
        border-radius: 8px;
        margin-bottom: 10px;
        transition: all 0.3s ease;
    }

    .node-content:hover {
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }

    .expand-btn {
        width: 30px;
        height: 30px;
        border-radius: 6px;
        border: 1px solid #ececec;
        background: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        margin-right: 10px;
        flex-shrink: 0;
        transition: all 0.3s ease;
    }

    .expand-btn:hover:not(:disabled) {
        background: #3BB77E;
        border-color: #3BB77E;
        color: #fff;
    }

    .expand-btn:disabled {
        opacity: 0.5;
        cursor: not-allowed;
    }

    .node-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
        flex-shrink: 0;
    }

    .node-icon i {
        color: #fff;
        font-size: 18px;
    }

    .node-info {
        flex: 1;
        min-width: 0;
    }

    .node-info strong {
        display: block;
        color: #253D4E;
        font-size: 14px;
        margin-bottom: 3px;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .node-info small {
        display: block;
        color: #7E7E7E;
        font-size: 12px;
        line-height: 1.4;
    }

    .node-stats {
        margin-left: 10px;
        flex-shrink: 0;
    }

    .tree-children {
        padding-left: 15px;
        border-left: 2px dashed #e0e0e0;
        margin-left: 15px;
    }

    .root-node {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff;
    }

    .root-node .node-icon {
        background: rgba(255, 255, 255, 0.2);
    }

    .root-node .node-info strong,
    .root-node .node-info small {
        color: #fff;
    }

    /* Mobile Breakpoints */
    @media (max-width: 991px) {
        .affiliate-dashboard-page .pl-50 {
            padding-left: 0 !important;
        }

        .affiliate-dashboard-page .dashboard-menu {
            margin-bottom: 30px;
        }
    }

    @media (max-width: 767px) {

        /* Mobile Menu Toggle - Show on Mobile */
        .mobile-menu-toggle {
            display: flex !important;
        }

        /* Dashboard Menu - Mobile Sidebar */
        .affiliate-dashboard-page .dashboard-menu {
            position: fixed;
            top: 0;
            left: -100%;
            width: 280px;
            height: 100vh;
            margin: 0;
            padding: 20px 15px;
            border-radius: 0;
            overflow-y: auto;
            z-index: 1000;
            transition: left 0.3s ease;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
        }

        .affiliate-dashboard-page .dashboard-menu.active {
            left: 0;
        }

        .affiliate-dashboard-page .dashboard-menu .nav-link {
            padding: 15px;
            font-size: 15px;
        }

        .affiliate-dashboard-page .dashboard-menu .nav-link i {
            font-size: 20px;
        }

        /* Mobile Layout Adjustments */
        .affiliate-dashboard-page {
            padding: 10px 0;
        }

        .affiliate-dashboard-page .page-content {
            padding-top: 20px !important;
            padding-bottom: 50px !important;
        }

        /* Card Adjustments */
        .affiliate-dashboard-page .card-header h3,
        .affiliate-dashboard-page .card-header h5 {
            font-size: 16px;
        }

        .affiliate-dashboard-page .card-body {
            padding: 15px;
        }

        /* Stat Cards - Stack on Mobile */
        .affiliate-dashboard-page .dashboard-stat-card {
            padding: 12px;
            min-height: 80px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-icon {
            width: 45px;
            height: 45px;
            margin-right: 12px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-icon i {
            font-size: 18px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-info h4 {
            font-size: 18px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-info p {
            font-size: 11px;
        }

        /* Welcome Message */
        .affiliate-dashboard-page .welcome-msg {
            padding: 15px;
        }

        .affiliate-dashboard-page .welcome-msg h5 {
            font-size: 18px;
        }

        /* Forms */
        .affiliate-dashboard-page .form-control {
            font-size: 16px;
            /* Prevents zoom on iOS */
        }

        /* Buttons Full Width on Mobile */
        .affiliate-dashboard-page .btn-mobile-full {
            width: 100%;
            margin-bottom: 10px;
        }

        /* Table Cards on Mobile */
        .affiliate-dashboard-page .table-responsive {
            margin: -15px;
            padding: 15px;
            border-radius: 0;
        }

        .affiliate-dashboard-page .table {
            font-size: 13px;
        }

        .affiliate-dashboard-page .table thead th,
        .affiliate-dashboard-page .table tbody td {
            padding: 10px 8px;
            font-size: 12px;
        }

        /* Alert Stacking */
        .affiliate-dashboard-page .alert .row {
            text-align: left !important;
        }

        .affiliate-dashboard-page .alert .row .col-md-4,
        .affiliate-dashboard-page .alert .row .col-md-6 {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .affiliate-dashboard-page .alert .row .col-md-4:last-child,
        .affiliate-dashboard-page .alert .row .col-md-6:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        /* Tree View Mobile */
        .node-content {
            padding: 10px;
            flex-wrap: wrap;
        }

        .node-icon {
            width: 35px;
            height: 35px;
            margin-right: 10px;
        }

        .node-icon i {
            font-size: 16px;
        }

        .node-info strong {
            font-size: 13px;
        }

        .node-info small {
            font-size: 11px;
        }

        .tree-children {
            padding-left: 10px;
            margin-left: 10px;
        }

        /* Navigation Menu Mobile */
        .affiliate-dashboard-page .dashboard-menu .nav-link {
            padding: 10px 12px;
            font-size: 13px;
        }

        .affiliate-dashboard-page .dashboard-menu .nav-link i {
            font-size: 16px;
            margin-right: 8px;
        }
    }

    @media (max-width: 575px) {

        /* Extra Small Devices */
        .affiliate-dashboard-page .container {
            padding-left: 10px;
            padding-right: 10px;
        }

        /* Header Actions Stack */
        .affiliate-dashboard-page .card-header {
            padding: 12px 15px;
        }

        .affiliate-dashboard-page .card-header.d-flex {
            display: block !important;
        }

        .affiliate-dashboard-page .card-header .btn {
            margin-top: 10px;
            width: 100%;
        }

        /* Filter Forms Stack */
        .affiliate-dashboard-page form .row [class*="col-"] {
            margin-bottom: 10px;
        }

        .affiliate-dashboard-page form .btn {
            width: 100%;
        }

        /* Stat Cards Smaller */
        .affiliate-dashboard-page .dashboard-stat-card {
            padding: 10px;
            min-height: 70px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-icon {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-icon i {
            font-size: 16px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-info h4 {
            font-size: 16px;
        }

        .affiliate-dashboard-page .dashboard-stat-card .card-info p {
            font-size: 10px;
        }

        /* Table Scroll Hint */
        .affiliate-dashboard-page .table-responsive::after {
            content: "← Scroll →";
            display: block;
            text-align: center;
            padding: 10px;
            font-size: 11px;
            color: #999;
            background: #f9f9f9;
        }

        /* Pagination Smaller */
        .affiliate-dashboard-page .page-link {
            min-width: 35px;
            height: 35px;
            font-size: 12px;
            margin: 0 2px;
        }
    }

    @media (max-width: 380px) {

        /* Very Small Devices */
        .affiliate-dashboard-page .dashboard-stat-card .card-info h4 {
            font-size: 14px;
        }

        .affiliate-dashboard-page .btn {
            padding: 10px 16px;
            font-size: 13px;
        }

        .affiliate-dashboard-page .table {
            min-width: 500px;
        }
    }

    /* Landscape Mobile Optimization */
    @media (max-width: 767px) and (orientation: landscape) {
        .affiliate-dashboard-page .page-content {
            padding-top: 10px !important;
            padding-bottom: 30px !important;
        }

        .affiliate-dashboard-page .dashboard-stat-card {
            min-height: 60px;
        }
    }

    /* Touch Device Optimizations */
    @media (hover: none) and (pointer: coarse) {

        .affiliate-dashboard-page .btn,
        .affiliate-dashboard-page .nav-link,
        .affiliate-dashboard-page .expand-btn {
            -webkit-tap-highlight-color: transparent;
        }

        .affiliate-dashboard-page .table tbody tr:hover {
            background: transparent;
        }

        .affiliate-dashboard-page .table tbody tr:active {
            background: #f9f9f9;
        }
    }

    /* Print Styles */
    @media print {

        .affiliate-dashboard-page .dashboard-menu,
        .affiliate-dashboard-page .btn,
        .affiliate-dashboard-page form {
            display: none !important;
        }

        .affiliate-dashboard-page .card {
            box-shadow: none;
            border: 1px solid #ddd;
        }
    }
</style>
