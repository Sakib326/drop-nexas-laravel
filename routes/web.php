<?php

use App\Http\Controllers\AffiliateController;
use Illuminate\Support\Facades\Route;

// Affiliate Dashboard Routes
Route::middleware(['web', 'customer'])
    ->prefix('affiliate')
    ->name('affiliate.')
    ->group(function () {
        // Publicly accessible to any customer (if not an affiliate yet)
        Route::get('/apply', [AffiliateController::class, 'apply'])->name('apply');
        Route::post('/apply', [AffiliateController::class, 'storeApply'])->name('apply.store');

        // Protected routes (requires approved affiliate status)
        Route::middleware(['web', 'customer'])->group(function() {
            Route::get('/', [AffiliateController::class, 'dashboard'])->name('dashboard');
            Route::get('/products', [AffiliateController::class, 'products'])->name('products');
            Route::get('/downline', [AffiliateController::class, 'downline'])->name('downline');
            Route::get('/downline/{username}/children', [AffiliateController::class, 'getChildReferrals'])->name('downline.children');
            Route::get('/commissions', [AffiliateController::class, 'commissions'])->name('commissions');
            Route::get('/withdrawals', [AffiliateController::class, 'withdrawals'])->name('withdrawals');
            Route::get('/withdrawal-request', [AffiliateController::class, 'withdrawalRequest'])->name('withdrawal.request');
            Route::post('/withdrawal-request', [AffiliateController::class, 'storeWithdrawalRequest'])->name('withdrawal.store');
        });
    });

