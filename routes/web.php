<?php

use App\Http\Controllers\AffiliateController;
use Illuminate\Support\Facades\Route;

// Affiliate Dashboard Routes
Route::middleware(['web', 'customer'])
    ->prefix('affiliate')
    ->name('affiliate.')
    ->group(function () {
        Route::get('/', [AffiliateController::class, 'dashboard'])->name('dashboard');
        Route::get('/products', [AffiliateController::class, 'products'])->name('products');
        Route::get('/downline', [AffiliateController::class, 'downline'])->name('downline');
        Route::get('/downline/{username}/children', [AffiliateController::class, 'getChildReferrals'])->name('downline.children');
    });
