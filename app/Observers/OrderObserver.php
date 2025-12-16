<?php

namespace App\Observers;

use App\Services\CommissionService;
use Botble\Ecommerce\Models\Order;
use Illuminate\Support\Facades\Log;

class OrderObserver
{
    protected $commissionService;

    public function __construct(CommissionService $commissionService)
    {
        $this->commissionService = $commissionService;
    }

    /**
     * Handle the Order "updated" event.
     */
    public function updated(Order $order): void
    {
        // Get the original status before the update - handle enum
        $originalStatus = $order->getOriginal('status');
        $newStatus = $order->status;

        // Convert enums to string if needed
        $originalStatusString = is_object($originalStatus) ? $originalStatus->value : $originalStatus;
        $newStatusString = is_object($newStatus) ? $newStatus->value : $newStatus;

        Log::info("Order #{$order->id} updated - Original status: {$originalStatusString}, New status: {$newStatusString}, Is distributed: " . ($order->is_commission_distributed ? 'Yes' : 'No'));

        // Check if status changed to "completed"
        if ($originalStatusString != 'completed' && $newStatusString == 'completed') {
            // Only distribute if not already distributed
            if (!$order->is_commission_distributed) {
                try {
                    Log::info("Order #{$order->id} completed, distributing commissions");
                    $this->commissionService->distributeCommissions($order);
                } catch (\Exception $e) {
                    Log::error("Failed to distribute commissions for order #{$order->id}: " . $e->getMessage());
                    Log::error($e->getTraceAsString());
                }
            } else {
                Log::info("Order #{$order->id} already has commissions distributed, skipping");
            }
        }

        // Check if status changed FROM "completed" to something else
        if ($originalStatusString == 'completed' && $newStatusString != 'completed') {
            // Reverse commissions if they were distributed
            if ($order->is_commission_distributed) {
                try {
                    Log::info("Order #{$order->id} status changed from completed, reversing commissions");
                    $this->commissionService->reverseCommissions($order);
                } catch (\Exception $e) {
                    Log::error("Failed to reverse commissions for order #{$order->id}: " . $e->getMessage());
                    Log::error($e->getTraceAsString());
                }
            }
        }
    }

    /**
     * Handle the Order "created" event (if order is created as completed)
     */
    public function created(Order $order): void
    {
        if ($order->status === 'completed' && !$order->is_commission_distributed) {
            try {
                Log::info("Order #{$order->id} created as completed, distributing commissions");
                $this->commissionService->distributeCommissions($order);
            } catch (\Exception $e) {
                Log::error("Failed to distribute commissions for new order #{$order->id}: " . $e->getMessage());
            }
        }
    }
}
