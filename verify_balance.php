<?php

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use Illuminate\Support\Facades\DB;

echo "================== BALANCE VERIFICATION ==================\n\n";

$customerId = 2;
$customer = DB::table('ec_customers')->where('id', $customerId)->first();

echo "Customer ID: {$customerId}\n";
echo "Current Available Balance: ৳" . number_format($customer->available_balance, 2) . "\n";
echo "Total Earned (in DB): ৳" . number_format($customer->total_earned ?? 0, 2) . "\n\n";

// Get all commissions
$commissions = DB::table('affiliate_commissions')
    ->where('customer_id', $customerId)
    ->get();

echo "COMMISSIONS:\n";
$totalCommissions = 0;
foreach ($commissions as $com) {
    echo "  ID: {$com->id}, Amount: ৳{$com->commission_amount}, Status: {$com->status}, Date: {$com->created_at}\n";
    $totalCommissions += $com->commission_amount;
}
echo "TOTAL COMMISSIONS: ৳" . number_format($totalCommissions, 2) . "\n\n";

// Get all withdrawals
$withdrawals = DB::table('affiliate_withdrawals')
    ->where('customer_id', $customerId)
    ->get();

echo "WITHDRAWALS:\n";
$totalWithdrawn = 0;
foreach ($withdrawals as $w) {
    echo "  ID: {$w->id}, Amount: ৳{$w->amount}, Status: {$w->status}, Date: {$w->requested_at}\n";
    if (in_array($w->status, ['pending', 'processing', 'completed'])) {
        $totalWithdrawn += $w->amount;
    }
}
echo "TOTAL WITHDRAWN (pending/processing/completed): ৳" . number_format($totalWithdrawn, 2) . "\n\n";

echo "CALCULATION:\n";
echo "Total Commissions: ৳" . number_format($totalCommissions, 2) . "\n";
echo "Total Withdrawn:   ৳" . number_format($totalWithdrawn, 2) . "\n";
echo "Should Be:         ৳" . number_format($totalCommissions - $totalWithdrawn, 2) . "\n";
echo "Actually Is:       ৳" . number_format($customer->available_balance, 2) . "\n\n";

if (($totalCommissions - $totalWithdrawn) == $customer->available_balance) {
    echo "✅ BALANCE IS CORRECT!\n";
} else {
    echo "❌ BALANCE IS WRONG!\n";
    echo "Difference: ৳" . number_format(($totalCommissions - $totalWithdrawn) - $customer->available_balance, 2) . "\n";
}

echo "\n================== END VERIFICATION ==================\n";
