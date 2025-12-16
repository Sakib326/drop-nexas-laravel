<?php

namespace App\Providers;

use App\Observers\OrderObserver;
use Botble\Base\Supports\DashboardMenu;
use Botble\Ecommerce\Models\Order;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Register Order Observer for commission distribution
        Order::observe(OrderObserver::class);
    }
}
