<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('affiliate_commissions', function (Blueprint $table) {
            // Drop old columns

            Schema::table('affiliate_commissions', function (Blueprint $table) {
                if (Schema::hasColumn('affiliate_commissions', 'product_price')) {
                    $table->dropColumn('product_price');
                }
                if (Schema::hasColumn('affiliate_commissions', 'product_cost')) {
                    $table->dropColumn('product_cost');
                }
            });


            // Change commission_type to string for more flexibility
            DB::statement('ALTER TABLE affiliate_commissions MODIFY commission_type VARCHAR(50)');

            // Add new columns

            // Add new columns if they do not exist
            Schema::table('affiliate_commissions', function (Blueprint $table) {
                if (!Schema::hasColumn('affiliate_commissions', 'order_amount')) {
                    $table->decimal('order_amount', 15, 2)->default(0)->after('commission_type');
                }
                if (!Schema::hasColumn('affiliate_commissions', 'profit_amount')) {
                    $table->decimal('profit_amount', 15, 2)->default(0)->after('order_amount');
                }
            });

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('affiliate_commissions', function (Blueprint $table) {
            $table->dropColumn(['order_amount', 'profit_amount']);
            $table->decimal('product_price', 15, 2)->default(0)->after('product_id');
            $table->decimal('product_cost', 15, 2)->default(0)->after('product_price');
        });
    }
};
