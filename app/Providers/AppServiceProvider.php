<?php

namespace App\Providers;

use App\Events\MarketplacePlatformFeeCalculated;
use App\Listeners\HandleMarketplacePlatformFeeCalculated;
use App\Observers\OrderObserver;
use Botble\Ecommerce\Models\Order;
use Illuminate\Support\Facades\Event;
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

        Event::listen(
            MarketplacePlatformFeeCalculated::class,
            HandleMarketplacePlatformFeeCalculated::class
        );
    }
}
