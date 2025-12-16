<?php

use App\Http\Controllers\AffiliateController;
use Illuminate\Support\Facades\Route;

// Affiliate Dashboard Routes
Route::middleware(['web', 'customer'])
    ->prefix('affiliate')
    ->name('affiliate.')
    ->group(function () {
        Route::get('/', [AffiliateController::class, 'dashboard'])->name('dashboard');
    });
