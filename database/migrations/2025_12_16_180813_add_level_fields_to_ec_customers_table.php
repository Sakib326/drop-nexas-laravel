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
            $table->decimal('lifetime_earnings', 20, 2)->default(0)->after('total_sale_value');
            $table->integer('level')->default(1)->after('lifetime_earnings');
            $table->string('level_name', 50)->default('Spark')->after('level');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('ec_customers', function (Blueprint $table) {
            $table->dropColumn(['lifetime_earnings', 'level', 'level_name']);
        });
    }
};
