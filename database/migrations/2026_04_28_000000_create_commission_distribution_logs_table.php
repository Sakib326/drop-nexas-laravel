<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('commission_distribution_logs', function (Blueprint $table) {
            $table->id();

            // Foreign key references
            $table->unsignedBigInteger('order_id')->unique();
            $table->unsignedBigInteger('revenue_id')->nullable();

            // Summary amounts
            $table->decimal('platform_fee_cut', 15, 2); // Total platform fee amount
            $table->decimal('max_distributable_amount', 15, 2); // Maximum that could be distributed
            $table->decimal('amount_distributed', 15, 2)->default(0); // Actual amount distributed
            $table->unsignedInteger('total_recipients')->default(0); // Total number of recipients

            // Distribution breakdown by step (JSON)
            $table->json('distribution_breakdown')->nullable(); // Details for each step

            // Metadata
            $table->string('status')->default('completed'); // completed, partial, failed
            $table->text('notes')->nullable(); // Additional notes

            // Timestamps
            $table->timestamps();

            // Indexes
            $table->index('order_id');
            $table->index('created_at');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('commission_distribution_logs');
    }
};
