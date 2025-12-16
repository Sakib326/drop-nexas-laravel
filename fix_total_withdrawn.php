<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use Botble\Ecommerce\Models\Customer;
use Illuminate\Support\Facades\DB;

echo "Fixing total_withdrawn for all customers...\n\n";

$customers = Customer::all();

foreach ($customers as $customer) {
    // Calculate total completed withdrawals
    $totalWithdrawn = DB::table('affiliate_withdrawals')
        ->where('customer_id', $customer->id)
        ->where('status', 'completed')
        ->sum('amount');

    $oldValue = $customer->total_withdrawn ?? 0;

    if ($totalWithdrawn != $oldValue) {
        $customer->total_withdrawn = $totalWithdrawn;
        $customer->save();

        echo "Customer #{$customer->id} ({$customer->name}):\n";
        echo "  Old total_withdrawn: ৳" . number_format($oldValue, 2) . "\n";
        echo "  New total_withdrawn: ৳" . number_format($totalWithdrawn, 2) . "\n\n";
    }
}

echo "Done!\n";
