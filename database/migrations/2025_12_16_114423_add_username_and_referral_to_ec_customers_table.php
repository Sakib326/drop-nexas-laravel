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
            $table->string('username', 60)->unique()->nullable()->after('name');
            $table->string('referral_username', 60)->nullable()->after('username');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('ec_customers', function (Blueprint $table) {
            $table->dropColumn(['username', 'referral_username']);
        });
    }
};
