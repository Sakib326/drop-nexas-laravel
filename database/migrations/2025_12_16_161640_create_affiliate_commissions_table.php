<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('affiliate_commissions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('customer_id');
            $table->unsignedBigInteger('order_id')->nullable();
            $table->unsignedBigInteger('product_id')->nullable();
            $table->enum('commission_type', ['direct_sale', 'downline_level_1', 'downline_level_2', 'downline_level_3']);
            $table->decimal('product_price', 15, 2)->default(0);
            $table->decimal('product_cost', 15, 2)->default(0);
            $table->decimal('commission_rate', 5, 2)->default(0); // e.g., 50.00 for 50%
            $table->decimal('commission_amount', 15, 2)->default(0);
            $table->enum('status', ['pending', 'approved', 'rejected', 'paid', 'returned'])->default('pending');
            $table->timestamp('approved_at')->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->foreign('customer_id')->references('id')->on('ec_customers')->onDelete('cascade');
            $table->foreign('order_id')->references('id')->on('ec_orders')->onDelete('set null');
            $table->foreign('product_id')->references('id')->on('ec_products')->onDelete('set null');

            $table->index(['customer_id', 'status']);
            $table->index('order_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('affiliate_commissions');
    }
};
