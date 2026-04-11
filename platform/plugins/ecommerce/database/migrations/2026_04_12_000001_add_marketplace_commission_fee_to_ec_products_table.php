<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasColumn('ec_products', 'marketplace_commission_fee')) {
            Schema::table('ec_products', function (Blueprint $table): void {
                $table->decimal('marketplace_commission_fee', 5, 2)
                    ->nullable()
                    ->after('cost_per_item');
            });
        }
    }

    public function down(): void
    {
        if (Schema::hasColumn('ec_products', 'marketplace_commission_fee')) {
            Schema::table('ec_products', function (Blueprint $table): void {
                $table->dropColumn('marketplace_commission_fee');
            });
        }
    }
};
