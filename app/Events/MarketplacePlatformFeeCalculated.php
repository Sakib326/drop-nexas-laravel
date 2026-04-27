<?php

namespace App\Events;

use Botble\Ecommerce\Models\Order;
use Botble\Marketplace\Models\Revenue;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MarketplacePlatformFeeCalculated
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(
        public Revenue $revenue,
        public Order $order,
        public bool $revenueWasCreated = false
    ) {
    }
}
