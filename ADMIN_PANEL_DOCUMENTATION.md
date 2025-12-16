# Admin Panel Documentation - Commission & Withdrawal Management

## Overview

Complete admin panel for managing commissions, withdrawals, user hierarchies, and balances in the DropNexas affiliate system.

## Access URLs

### Commission Management

- **All Commissions**: `/admin/commissions`
- **User Commission History**: `/admin/commissions/user/{customerId}/history`
- **User Referral Hierarchy**: `/admin/commissions/user/{customerId}/hierarchy`
- **User Balance Details**: `/admin/commissions/user/{customerId}/balance`

### Withdrawal Management

- **All Withdrawals**: `/admin/withdrawals`
- **User Withdrawal History**: `/admin/withdrawals/user/{customerId}/history`
- **Edit/Manage Withdrawal**: `/admin/withdrawals/{id}/edit`

## Features

### 1. Commission Management (`/admin/commissions`)

#### Features:

- **View all commissions** across the system
- **Filter by**:
    - Customer (dropdown)
    - Commission Type (referral levels, pools)
    - Date range (from/to)
- **Pagination** with 20 records per page
- **Quick actions** to view user history

#### Commission Types Displayed:

- `referral_level_1` through `referral_level_6` - Referral tree commissions
- `global_thrive_pool` - Global Thrive Pool (3% for levels 4-6)
- `empire_builder_pool` - Empire Builder Pool (2% for level 6)

#### Information Shown:

- Commission ID
- Customer name and username (clickable)
- Order code (clickable to view order)
- Commission type with color-coded badges
- Commission rate (%)
- Order amount
- Profit amount
- Commission amount
- Date created

---

### 2. User Commission History (`/admin/commissions/user/{customerId}/history`)

#### Features:

- **Customer information card**:

    - Name, username, email
    - Level and badge
    - Lifetime earnings, available balance, total earned
    - Quick action buttons (hierarchy, balance, withdrawals, edit)

- **Commission summary**:

    - Total number of commissions
    - Total earned amount
    - Breakdown by type:
        - Referral earnings
        - Global Thrive earnings
        - Empire Builder earnings

- **Breakdown table by type**:

    - Commission type
    - Count of commissions
    - Average rate
    - Total amount

- **Complete commission list**:
    - All commissions with full details
    - Links to orders
    - Type badges
    - Pagination

---

### 3. User Referral Hierarchy (`/admin/commissions/user/{customerId}/hierarchy`)

#### Features:

- **Statistics cards**:

    - Total members in network
    - Total downline earnings
    - Commissions generated
    - Network depth (how many levels deep)

- **Members by level table**:

    - Shows breakdown for each of 6 levels
    - Number of members at each level
    - Total lifetime earnings per level
    - Commission rates displayed

- **Interactive referral tree**:

    - Visual tree structure showing all downline members
    - Up to 6 levels deep
    - Each node shows:
        - Name and username
        - Email address
        - Level badge (Spark, Flare, Pathfinder, etc.)
        - Available balance
        - Lifetime earnings
        - Join date
        - Quick action buttons:
            - View their commissions
            - View their network (recursive)

- **Color-coded levels**:
    - Level 1: Green
    - Level 2: Blue
    - Level 3: Yellow
    - Level 4: Orange
    - Level 5: Red
    - Level 6: Purple

---

### 4. User Balance Details (`/admin/commissions/user/{customerId}/balance`)

#### Features:

- **Balance summary cards** (6 cards):

    - Available Balance (green)
    - Total Earned (blue)
    - Lifetime Earnings (yellow)
    - Total Withdrawn (red)
    - Pending Withdrawals (gray)
    - User Level (blue)

- **Recent commissions** (last 10):

    - Date, order, type, rate, amount
    - Link to view all commissions

- **Withdrawal history**:
    - All withdrawals with full details
    - Status badges (completed, processing, pending, rejected)
    - Dates requested and processed
    - Link to manage each withdrawal
    - Link to view all withdrawals

---

### 5. Withdrawal Management (`/admin/withdrawals`)

#### Features:

- **Statistics dashboard** (4 cards):

    - Pending withdrawals (count + amount)
    - Processing (count + amount)
    - Completed (count + amount)
    - Rejected (count + amount)

- **Filter options**:

    - Status (pending, processing, completed, rejected)
    - Customer (dropdown)
    - Withdrawal method (bank, MFS, cash)
    - Date range (from/to)

- **Withdrawals table**:

    - Checkbox for bulk selection
    - ID
    - Customer name and username (clickable to balance)
    - Amount
    - Method badge
    - Account details (truncated)
    - Status badge
    - Customer's current balance
    - Requested date
    - Processed date
    - Actions (edit, view history)

- **Bulk actions**:

    - Mark selected as Processing
    - Mark selected as Completed
    - Mark selected as Rejected

- **Pagination** with 20 records per page

---

### 6. Edit Withdrawal (`/admin/withdrawals/{id}/edit`)

#### Features:

- **Withdrawal information card**:

    - ID, amount, method
    - Current status
    - Requested date
    - Processed date (if applicable)

- **Customer information card**:

    - Name (clickable to customer edit)
    - Username, email
    - Current balance
    - Link to view full balance details

- **Account details**:

    - Full account information display
    - Bank account, MFS number, etc.

- **Previous notes display** (if any):

    - Rejection reason (if rejected)
    - Admin notes (if any)

- **Status update form**:

    - Dropdown to change status:
        - Pending
        - Processing
        - Completed
        - Rejected
    - Rejection reason field (required if status = rejected)
    - Admin notes field (optional, internal use)

- **Balance impact warning**:

    - Automatically shows when status change affects balance
    - Shows old and new balance amounts
    - Warns if insufficient balance

- **Quick actions sidebar**:

    - View commission history
    - View all withdrawals
    - View network hierarchy
    - Edit customer profile

- **Status change guide**:
    - Shows rules for status transitions
    - Explains balance impact for each transition

---

### 7. User Withdrawal History (`/admin/withdrawals/user/{customerId}/history`)

#### Features:

- **Customer information card**:

    - Name, username, email
    - Available balance
    - Total earned
    - Quick action buttons

- **Withdrawal summary card**:

    - Total requests
    - Total withdrawn
    - Pending amount
    - Processing amount
    - Rejected amount

- **Complete withdrawal history table**:
    - All withdrawals for this customer
    - Full details including dates
    - Status badges
    - Rejection reasons (displayed below row)
    - Admin notes (displayed below row)
    - Manage button for each withdrawal

---

## Balance Adjustment Rules

### Automatic Balance Adjustments

The system automatically adjusts customer balances when withdrawal status changes:

#### Status Transition Rules:

1. **Pending → Processing**: No balance change (already deducted when created)
2. **Pending → Completed**: No balance change (already deducted)
3. **Pending → Rejected**: ✅ **Balance RESTORED** (refund)
4. **Processing → Completed**: No balance change
5. **Processing → Rejected**: ✅ **Balance RESTORED** (refund)
6. **Processing → Pending**: No balance change
7. **Completed → Any**: ❌ **NOT ALLOWED** (money already sent)
8. **Rejected → Pending**: ✅ **Balance DEDUCTED** again
9. **Rejected → Processing**: ✅ **Balance DEDUCTED** again

#### Safety Checks:

- Cannot change from completed (throws error)
- Checks for sufficient balance when re-processing rejected withdrawal
- All changes wrapped in database transaction
- Detailed logging for audit trail

---

## Logging

All withdrawal status changes are logged with:

- Withdrawal ID
- Customer ID
- Old status → New status
- Amount
- Balance before and after
- Timestamp
- Admin user (TODO: add admin user tracking)

**Log Location**: `storage/logs/laravel-{date}.log`

**Search Logs**:

```bash
tail -100 storage/logs/laravel-2025-12-17.log | grep "Withdrawal"
```

---

## Permission Requirements

All admin routes require `customers.index` permission.

Default middleware: `['web', 'core', 'auth', 'permission:customers.index']`

---

## Database Tables Used

1. **affiliate_commissions**: All commission records
2. **affiliate_withdrawals**: All withdrawal requests
3. **ec_customers**: Customer information and balances
4. **ec_orders**: Order information (linked to commissions)

---

## Testing the Admin Panel

### 1. Access Commission Management

```
URL: http://localhost:8000/admin/commissions
- Should see all commissions
- Test filters
- Click on customer name to view their history
```

### 2. Test Withdrawal Management

```
URL: http://localhost:8000/admin/withdrawals
- Should see all withdrawals
- Test status changes
- Verify balance adjustments
```

### 3. Test User Hierarchy

```
URL: http://localhost:8000/admin/commissions/user/2/hierarchy
- Should see referral tree
- Verify statistics
- Test navigation through tree
```

### 4. Test Balance Adjustment

```bash
# Create test withdrawal
php artisan tinker --execute="
\$customer = Botble\Ecommerce\Models\Customer::find(2);
echo 'Before: ৳' . \$customer->available_balance . PHP_EOL;
DB::table('affiliate_withdrawals')->insert([
    'customer_id' => 2,
    'amount' => 100,
    'withdrawal_method' => 'bank',
    'account_details' => 'Test Bank Account',
    'status' => 'pending',
    'requested_at' => now(),
    'created_at' => now(),
    'updated_at' => now()
]);
echo 'Withdrawal created' . PHP_EOL;
"
```

Then:

1. Go to `/admin/withdrawals`
2. Edit the withdrawal
3. Change status to "Rejected"
4. Check customer balance is restored
5. Change back to "Pending"
6. Check balance is deducted again

---

## Security Considerations

1. **Permission-based access**: All routes require admin permission
2. **CSRF protection**: All forms use `@csrf` tokens
3. **Database transactions**: Balance changes wrapped in transactions
4. **Error handling**: Try-catch blocks with rollback
5. **Validation**: All inputs validated before processing
6. **Logging**: Complete audit trail in logs

---

## Future Enhancements (TODO)

1. ✅ Commission management
2. ✅ Withdrawal management with balance adjustment
3. ✅ User hierarchy visualization
4. ✅ Balance tracking
5. ⬜ Admin user tracking (who made changes)
6. ⬜ Email notifications on status change
7. ⬜ Export commissions to CSV/Excel
8. ⬜ Export withdrawals to CSV/Excel
9. ⬜ Withdrawal approval workflow (require multiple admins)
10. ⬜ Dashboard widgets for quick stats
11. ⬜ Real-time notifications
12. ⬜ Automated payment integration (bank API)

---

## Support

For issues or questions:

- Check logs: `storage/logs/laravel-{date}.log`
- Check database: `affiliate_commissions`, `affiliate_withdrawals`, `ec_customers`
- Verify permissions: Ensure admin has `customers.index` permission
- Clear cache: `php artisan optimize:clear`
