<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('ec_customers', function (Blueprint $table) {
            $table->string('affiliate_status', 60)->nullable()->change();
            $table->timestamp('affiliate_applied_at')->nullable();
        });

        // For customers who are not affiliates, set status to NULL
        DB::table('ec_customers')
            ->where('is_affiliate', false)
            ->update(['affiliate_status' => null]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('ec_customers', function (Blueprint $table) {
            $table->string('affiliate_status', 60)->default('pending')->nullable(false)->change();
            $table->dropColumn('affiliate_applied_at');
        });
    }
};
