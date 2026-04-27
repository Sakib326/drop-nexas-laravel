<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class CommissionDistributionLog extends Model
{
    protected $table = 'commission_distribution_logs';

    protected $fillable = [
        'order_id',
        'revenue_id',
        'platform_fee_cut',
        'max_distributable_amount',
        'amount_distributed',
        'total_recipients',
        'distribution_breakdown',
        'status',
        'notes',
    ];

    protected $casts = [
        'platform_fee_cut' => 'decimal:2',
        'max_distributable_amount' => 'decimal:2',
        'amount_distributed' => 'decimal:2',
        'total_recipients' => 'integer',
        'distribution_breakdown' => 'json',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the order associated with this distribution log.
     */
    public function order(): BelongsTo
    {
        return $this->belongsTo('Botble\Ecommerce\Models\Order', 'order_id');
    }

    /**
     * Get distribution efficiency percentage.
     */
    public function getDistributionEfficiencyAttribute(): float
    {
        if ($this->max_distributable_amount == 0) {
            return 0;
        }

        return ($this->amount_distributed / $this->max_distributable_amount) * 100;
    }

    /**
     * Get undistributed amount.
     */
    public function getUndistributedAmountAttribute(): float
    {
        return $this->max_distributable_amount - $this->amount_distributed;
    }

    /**
     * Check if distribution is complete.
     */
    public function isComplete(): bool
    {
        return abs($this->amount_distributed - $this->max_distributable_amount) < 0.01;
    }

    /**
     * Scope: Get logs for a specific order.
     */
    public function scopeForOrder($query, int $orderId)
    {
        return $query->where('order_id', $orderId);
    }

    /**
     * Scope: Get completed distributions.
     */
    public function scopeCompleted($query)
    {
        return $query->where('status', 'completed');
    }

    /**
     * Scope: Get partial distributions.
     */
    public function scopePartial($query)
    {
        return $query->where('status', 'partial');
    }

    /**
     * Scope: Get failed distributions.
     */
    public function scopeFailed($query)
    {
        return $query->where('status', 'failed');
    }

    /**
     * Scope: Get distributions within a date range.
     */
    public function scopeWithinDateRange($query, $startDate, $endDate)
    {
        return $query->whereBetween('created_at', [$startDate, $endDate]);
    }
}
