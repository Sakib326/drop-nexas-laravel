<?php

namespace App\Models;

use Botble\Ecommerce\Models\Customer;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AffiliateWithdrawal extends Model
{
    protected $fillable = [
        'customer_id',
        'amount',
        'withdrawal_method',
        'account_details',
        'status',
        'requested_at',
        'processed_at',
        'rejection_reason',
        'admin_notes',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'account_details' => 'array',
        'requested_at' => 'datetime',
        'processed_at' => 'datetime',
    ];

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class);
    }

    /**
     * Scope to filter by status
     */
    public function scopeStatus($query, $status)
    {
        return $query->where('status', $status);
    }

    /**
     * Scope to filter pending withdrawals
     */
    public function scopePending($query)
    {
        return $query->where('status', 'pending');
    }

    /**
     * Scope to filter completed withdrawals
     */
    public function scopeCompleted($query)
    {
        return $query->where('status', 'completed');
    }
}
