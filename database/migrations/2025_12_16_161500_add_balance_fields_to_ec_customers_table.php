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
        Schema::table('ec_customers', function (Blueprint $table) {
            $table->decimal('available_balance', 15, 2)->default(0)->after('referral_username');
            $table->decimal('total_earned', 15, 2)->default(0)->after('available_balance');
            $table->decimal('total_withdrawn', 15, 2)->default(0)->after('total_earned');
            $table->decimal('total_sale_value', 15, 2)->default(0)->after('total_withdrawn');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('ec_customers', function (Blueprint $table) {
            $table->dropColumn(['available_balance', 'total_earned', 'total_withdrawn', 'total_sale_value']);
        });
    }
};
