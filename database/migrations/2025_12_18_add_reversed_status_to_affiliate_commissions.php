<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class () extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // SQLite doesn't support MODIFY COLUMN for ENUM, so we use a workaround
        // For MySQL, we would use ALTER TABLE MODIFY
        // For SQLite, we'll use raw SQL to handle this
        
        if (DB::getDriverName() === 'sqlite') {
            // SQLite doesn't have native ENUM, uses CHECK constraint
            // We need to drop and recreate with new values
            DB::statement('PRAGMA foreign_keys = OFF;');
            
            // Create temporary table with new structure
            DB::statement('
                CREATE TABLE affiliate_commissions_new (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    customer_id INTEGER NOT NULL,
                    order_id INTEGER,
                    product_id INTEGER,
                    commission_type VARCHAR(50) NOT NULL,
                    order_amount DECIMAL(15, 2) DEFAULT 0,
                    profit_amount DECIMAL(15, 2) DEFAULT 0,
                    commission_rate DECIMAL(5, 2) DEFAULT 0,
                    commission_amount DECIMAL(15, 2) DEFAULT 0,
                    status VARCHAR(50) CHECK(status IN ("pending", "approved", "rejected", "paid", "returned", "reversed")) DEFAULT "pending",
                    approved_at DATETIME,
                    notes TEXT,
                    created_at DATETIME,
                    updated_at DATETIME,
                    FOREIGN KEY (customer_id) REFERENCES ec_customers(id) ON DELETE CASCADE,
                    FOREIGN KEY (order_id) REFERENCES ec_orders(id) ON DELETE SET NULL,
                    FOREIGN KEY (product_id) REFERENCES ec_products(id) ON DELETE SET NULL
                )
            ');
            
            // Copy data
            DB::statement('
                INSERT INTO affiliate_commissions_new 
                SELECT * FROM affiliate_commissions
            ');
            
            // Drop old table
            DB::statement('DROP TABLE affiliate_commissions');
            
            // Rename new table
            DB::statement('ALTER TABLE affiliate_commissions_new RENAME TO affiliate_commissions');
            
            // Recreate indexes
            DB::statement('CREATE INDEX affiliate_commissions_customer_id_status_index ON affiliate_commissions(customer_id, status)');
            DB::statement('CREATE INDEX affiliate_commissions_order_id_index ON affiliate_commissions(order_id)');
            
            DB::statement('PRAGMA foreign_keys = ON;');
        } else {
            // For MySQL
            DB::statement("ALTER TABLE affiliate_commissions MODIFY COLUMN status ENUM('pending', 'approved', 'rejected', 'paid', 'returned', 'reversed') DEFAULT 'pending'");
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (DB::getDriverName() === 'sqlite') {
            DB::statement('PRAGMA foreign_keys = OFF;');
            
            // Create temporary table with old structure
            DB::statement('
                CREATE TABLE affiliate_commissions_old (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    customer_id INTEGER NOT NULL,
                    order_id INTEGER,
                    product_id INTEGER,
                    commission_type VARCHAR(50) NOT NULL,
                    order_amount DECIMAL(15, 2) DEFAULT 0,
                    profit_amount DECIMAL(15, 2) DEFAULT 0,
                    commission_rate DECIMAL(5, 2) DEFAULT 0,
                    commission_amount DECIMAL(15, 2) DEFAULT 0,
                    status VARCHAR(50) CHECK(status IN ("pending", "approved", "rejected", "paid", "returned")) DEFAULT "pending",
                    approved_at DATETIME,
                    notes TEXT,
                    created_at DATETIME,
                    updated_at DATETIME,
                    FOREIGN KEY (customer_id) REFERENCES ec_customers(id) ON DELETE CASCADE,
                    FOREIGN KEY (order_id) REFERENCES ec_orders(id) ON DELETE SET NULL,
                    FOREIGN KEY (product_id) REFERENCES ec_products(id) ON DELETE SET NULL
                )
            ');
            
            // Copy data (exclude 'reversed' status)
            DB::statement('
                INSERT INTO affiliate_commissions_old 
                SELECT * FROM affiliate_commissions WHERE status != "reversed"
            ');
            
            DB::statement('DROP TABLE affiliate_commissions');
            DB::statement('ALTER TABLE affiliate_commissions_old RENAME TO affiliate_commissions');
            
            DB::statement('CREATE INDEX affiliate_commissions_customer_id_status_index ON affiliate_commissions(customer_id, status)');
            DB::statement('CREATE INDEX affiliate_commissions_order_id_index ON affiliate_commissions(order_id)');
            
            DB::statement('PRAGMA foreign_keys = ON;');
        } else {
            DB::statement("ALTER TABLE affiliate_commissions MODIFY COLUMN status ENUM('pending', 'approved', 'rejected', 'paid', 'returned') DEFAULT 'pending'");
        }
    }
};
