<?php

namespace App\Listeners;

use App\Events\MarketplacePlatformFeeCalculated;
use Botble\Base\Supports\Enum;
use Illuminate\Support\Facades\Log;

class HandleMarketplacePlatformFeeCalculated
{
    public function handle(MarketplacePlatformFeeCalculated $event): void
    {
        $enumValue = static function ($value) {
            return $value instanceof Enum ? $value->getValue() : $value;
        };

        $revenue = $event->revenue;
        $order = $event->order;

        $revenue->loadMissing(['customer']);
        $order->loadMissing([
            'store.customer',
            'products.product',
            'products.product.variationInfo.configurableProduct',
        ]);

        $revenueType = $revenue->type;
        $orderStatus = $order->status;

        Log::info('[Marketplace] Platform fee calculated.', [
            'event' => $event->revenueWasCreated ? 'created' : 'updated',
            'platform_fee' => [
                'revenue_id' => $revenue->getKey(),
                'order_id' => $revenue->order_id,
                'vendor_customer_id' => $revenue->customer_id,
                'sub_amount_before_platform_fee' => (float) $revenue->sub_amount,
                'total_platform_fee_cut' => (float) $revenue->fee,
                'vendor_amount_after_platform_fee' => (float) $revenue->amount,
                'vendor_balance_when_record_saved' => (float) $revenue->current_balance,
                'currency' => $revenue->currency,
                'type' => $enumValue($revenueType),
                'created_at' => $revenue->created_at?->toDateTimeString(),
            ],
            'order' => [
                'id' => $order->getKey(),
                'code' => $order->code,
                'status' => $enumValue($orderStatus),
                'store_id' => $order->store_id,
                'store_name' => $order->store?->name,
                'vendor_name' => $order->store?->customer?->name,
                'customer_id' => $order->user_id,
                'amount' => (float) $order->amount,
                'sub_total' => (float) $order->sub_total,
                'tax_amount' => (float) $order->tax_amount,
                'shipping_amount' => (float) $order->shipping_amount,
                'payment_fee' => (float) $order->payment_fee,
                'discount_amount' => (float) $order->discount_amount,
            ],
            'products' => $order->products->map(function ($orderProduct): array {
                $product = $orderProduct->product;
                $originalProduct = $product?->original_product ?? $product;

                return [
                    'order_product_id' => $orderProduct->getKey(),
                    'product_id' => $orderProduct->product_id,
                    'product_name' => $orderProduct->product_name,
                    'qty' => (int) $orderProduct->qty,
                    'unit_price' => (float) $orderProduct->price,
                    'line_total' => (float) $orderProduct->price * (int) $orderProduct->qty,
                    'product_marketplace_commission_fee_percent' => $originalProduct?->marketplace_commission_fee,
                    'store_id' => $originalProduct?->store_id,
                ];
            })->values()->all(),
        ]);
    }
}
