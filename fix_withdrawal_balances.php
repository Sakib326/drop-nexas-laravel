<?php

/**
 * Fix Withdrawal Balance Issues
 *
 * This script fixes the balance discrepancies caused by withdrawals not being deducted properly.
 * Run this once to correct all existing customer balances.
 *
 * Usage: php fix_withdrawal_balances.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use Illuminate\Support\Facades\DB;

echo "Starting balance fix...\n\n";

// Get all customers who have withdrawals
$customersWithWithdrawals = DB::table('affiliate_withdrawals')
    ->select('customer_id')
    ->distinct()
    ->pluck('customer_id');

echo "Found " . count($customersWithWithdrawals) . " customers with withdrawals\n\n";

$fixed = 0;
$errors = 0;

foreach ($customersWithWithdrawals as $customerId) {
    try {
        $customer = DB::table('ec_customers')->where('id', $customerId)->first();

        if (!$customer) {
            echo "❌ Customer ID {$customerId} not found\n";
            $errors++;
            continue;
        }

        // Calculate total withdrawn amount (pending, processing, and completed)
        // Rejected withdrawals should NOT be counted as they should have been refunded
        $totalWithdrawn = DB::table('affiliate_withdrawals')
            ->where('customer_id', $customerId)
            ->whereIn('status', ['pending', 'processing', 'completed'])
            ->sum('amount');

        // Calculate total earned from commissions
        $totalEarned = DB::table('affiliate_commissions')
            ->where('customer_id', $customerId)
            ->sum('commission_amount');

        // Correct available balance = total earned - total withdrawn (non-rejected)
        $correctBalance = $totalEarned - $totalWithdrawn;

        $currentBalance = $customer->available_balance;

        if ($currentBalance != $correctBalance) {
            echo "Customer ID {$customerId}:\n";
            echo "  Current Balance: ৳" . number_format($currentBalance, 2) . "\n";
            echo "  Total Earned: ৳" . number_format($totalEarned, 2) . "\n";
            echo "  Total Withdrawn: ৳" . number_format($totalWithdrawn, 2) . "\n";
            echo "  Correct Balance: ৳" . number_format($correctBalance, 2) . "\n";
            echo "  Difference: ৳" . number_format($correctBalance - $currentBalance, 2) . "\n";

            // Update the balance
            DB::table('ec_customers')
                ->where('id', $customerId)
                ->update([
                    'available_balance' => $correctBalance,
                    'total_earned' => $totalEarned,
                    'lifetime_earnings' => $totalEarned,
                    'updated_at' => now()
                ]);

            echo "  ✅ Fixed!\n\n";
            $fixed++;
        } else {
            echo "✓ Customer ID {$customerId} balance is correct (৳" . number_format($currentBalance, 2) . ")\n";
        }

    } catch (\Exception $e) {
        echo "❌ Error fixing customer ID {$customerId}: " . $e->getMessage() . "\n\n";
        $errors++;
    }
}

echo "\n" . str_repeat("=", 50) . "\n";
echo "Balance Fix Summary:\n";
echo "✅ Fixed: {$fixed} customers\n";
echo "❌ Errors: {$errors}\n";
echo str_repeat("=", 50) . "\n";

// Show final verification
echo "\nFinal Verification for Customer ID 2:\n";
$customer = DB::table('ec_customers')->where('id', 2)->first();
if ($customer) {
    echo "Available Balance: ৳" . number_format($customer->available_balance, 2) . "\n";
    echo "Total Earned: ৳" . number_format($customer->total_earned ?? 0, 2) . "\n";

    $withdrawals = DB::table('affiliate_withdrawals')
        ->where('customer_id', 2)
        ->get();

    echo "\nWithdrawals:\n";
    foreach ($withdrawals as $w) {
        echo "  - ID: {$w->id}, Amount: ৳{$w->amount}, Status: {$w->status}\n";
    }

    $totalWithdrawn = DB::table('affiliate_withdrawals')
        ->where('customer_id', 2)
        ->whereIn('status', ['pending', 'processing', 'completed'])
        ->sum('amount');

    echo "\nTotal Withdrawn (non-rejected): ৳" . number_format($totalWithdrawn, 2) . "\n";
    echo "Expected Balance: ৳" . number_format(($customer->total_earned ?? 0) - $totalWithdrawn, 2) . "\n";
}

echo "\n✅ Balance fix completed!\n";
