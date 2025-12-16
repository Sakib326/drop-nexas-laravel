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

        // Register Commission & Withdrawal Management Menu
        DashboardMenu::beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-affiliate-commissions',
                    'priority' => 195,
                    'parent_id' => 'cms-plugins-ecommerce',
                    'name' => 'Commissions',
                    'icon' => 'ti ti-currency-dollar',
                    'url' => fn () => route('admin.commissions.index'),
                    'permissions' => ['customers.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-affiliate-withdrawals',
                    'priority' => 196,
                    'parent_id' => 'cms-plugins-ecommerce',
                    'name' => 'Withdrawals',
                    'icon' => 'ti ti-arrow-down-circle',
                    'url' => fn () => route('admin.withdrawals.index'),
                    'permissions' => ['customers.index'],
                ]);
        });
    }
}
