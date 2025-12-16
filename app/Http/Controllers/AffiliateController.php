<?php

namespace App\Http\Controllers;

use App\Models\AffiliateCommission;
use App\Models\AffiliateWithdrawal;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Product;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AffiliateController extends Controller
{
    public function __construct()
    {
        $version = EcommerceHelper::getAssetVersion();

        Theme::asset()
            ->add('customer-style', 'vendor/core/plugins/ecommerce/css/customer.css', ['bootstrap-css'], version: $version);

        Theme::asset()
            ->add('front-ecommerce-css', 'vendor/core/plugins/ecommerce/css/front-ecommerce.css', version: $version);
    }

    public function dashboard()
    {
        SeoHelper::setTitle(__('Affiliate Dashboard'));

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(__('Affiliate Dashboard'), route('affiliate.dashboard'));

        $customer = auth('customer')->user();

        // Get referral count - only count customers with valid usernames
        $referralCount = Customer::where('referral_username', $customer->username)
            ->whereNotNull('username')
            ->whereNotNull('referral_username')
            ->count();

        // Get balance information
        $availableBalance = $customer->available_balance ?? 0;
        $totalEarned = $customer->total_earned ?? 0;
        $totalWithdrawn = $customer->total_withdrawn ?? 0;

        // Get pending commissions total
        $pendingCommissions = $customer->commissions()->where('status', 'pending')->sum('commission_amount');

        return Theme::scope(
            'ecommerce.affiliate.dashboard',
            compact('customer', 'referralCount', 'availableBalance', 'totalEarned', 'totalWithdrawn', 'pendingCommissions'),
            'plugins/ecommerce::themes.affiliate.dashboard'
        )->render();
    }

    public function products(Request $request)
    {
        SeoHelper::setTitle(__('Affiliate Products'));

        $customer = auth('customer')->user();

        $query = Product::query()
            ->where('status', 'published')
            ->where('is_variation', 0)
            ->whereNotNull('cost_per_item')
            ->where('cost_per_item', '>', 0);

        // Apply filters
        if ($request->has('search') && $request->search) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        if ($request->has('category') && $request->category) {
            $query->whereHas('categories', function ($q) use ($request) {
                $q->where('ec_product_categories.id', $request->category);
            });
        }

        // Apply sorting
        if ($request->has('sort') && $request->sort) {
            if ($request->sort == 'profit_high') {
                // Sort by profit (high to low): (sale_price or price - cost_per_item) DESC
                $query->orderByRaw('((CASE WHEN sale_price > 0 THEN sale_price ELSE price END) - cost_per_item) DESC');
            } elseif ($request->sort == 'profit_low') {
                // Sort by profit (low to high): (sale_price or price - cost_per_item) ASC
                $query->orderByRaw('((CASE WHEN sale_price > 0 THEN sale_price ELSE price END) - cost_per_item) ASC');
            }
        } else {
            $query->orderBy('created_at', 'desc');
        }

        $products = $query->with(['categories', 'productCollections'])
            ->paginate(12);

        $categories = \Botble\Ecommerce\Models\ProductCategory::where('status', 'published')->get();

        return Theme::scope(
            'ecommerce.affiliate.products',
            compact('customer', 'products', 'categories'),
            'plugins/ecommerce::themes.affiliate.products'
        )->render();
    }

    public function downline(Request $request)
    {
        SeoHelper::setTitle(__('My Downline'));

        $customer = auth('customer')->user();

        // Get direct referrals with search - only valid usernames
        $query = Customer::where('referral_username', $customer->username)
            ->whereNotNull('username')
            ->whereNotNull('referral_username');

        if ($request->has('search') && $request->search) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%')
                  ->orWhere('username', 'like', '%' . $request->search . '%')
                  ->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }

        $referrals = $query->withCount('referrals')->paginate(20);

        return Theme::scope(
            'ecommerce.affiliate.downline',
            compact('customer', 'referrals'),
            'plugins/ecommerce::themes.affiliate.downline'
        )->render();
    }

    public function getChildReferrals($username)
    {
        $referrals = Customer::where('referral_username', $username)
            ->whereNotNull('username')
            ->whereNotNull('referral_username')
            ->withCount('referrals')
            ->get()
            ->map(function ($customer) {
                return [
                    'id' => $customer->id,
                    'name' => $customer->name,
                    'username' => $customer->username,
                    'email' => $customer->email,
                    'created_at' => $customer->created_at->format('M d, Y'),
                    'referrals_count' => $customer->referrals_count,
                    'has_children' => $customer->referrals_count > 0,
                ];
            });

        return response()->json($referrals);
    }

    public function commissions(Request $request)
    {
        SeoHelper::setTitle(__('Commission History'));

        $customer = auth('customer')->user();

        $query = AffiliateCommission::where('customer_id', $customer->id)
            ->with(['order', 'product']);

        // Filter by status
        if ($request->has('status') && $request->status) {
            $query->where('status', $request->status);
        }

        // Filter by commission type
        if ($request->has('type') && $request->type) {
            $query->where('commission_type', $request->type);
        }

        // Filter by date range
        if ($request->has('from') && $request->from) {
            $query->whereDate('created_at', '>=', $request->from);
        }
        if ($request->has('to') && $request->to) {
            $query->whereDate('created_at', '<=', $request->to);
        }

        $commissions = $query->orderBy('created_at', 'desc')->paginate(20);

        return Theme::scope(
            'ecommerce.affiliate.commissions',
            compact('customer', 'commissions'),
            'plugins/ecommerce::themes.affiliate.commissions'
        )->render();
    }

    public function withdrawals(Request $request)
    {
        SeoHelper::setTitle(__('Withdrawal History'));

        $customer = auth('customer')->user();

        $query = AffiliateWithdrawal::where('customer_id', $customer->id);

        // Filter by status
        if ($request->has('status') && $request->status) {
            $query->where('status', $request->status);
        }

        $withdrawals = $query->orderBy('created_at', 'desc')->paginate(20);

        return Theme::scope(
            'ecommerce.affiliate.withdrawals',
            compact('customer', 'withdrawals'),
            'plugins/ecommerce::themes.affiliate.withdrawals'
        )->render();
    }

    public function withdrawalRequest()
    {
        SeoHelper::setTitle(__('Request Withdrawal'));

        $customer = auth('customer')->user();

        $minimumWithdrawal = 100; // Set minimum withdrawal amount

        return Theme::scope(
            'ecommerce.affiliate.withdrawal-request',
            compact('customer', 'minimumWithdrawal'),
            'plugins/ecommerce::themes.affiliate.withdrawal-request'
        )->render();
    }

    public function storeWithdrawalRequest(Request $request)
    {
        $customer = auth('customer')->user();
        $minimumWithdrawal = 100;

        $request->validate([
            'amount' => "required|numeric|min:{$minimumWithdrawal}|max:{$customer->available_balance}",
            'withdrawal_method' => 'required|in:bank,mfs,cash',
            'account_details' => 'required|array',
        ]);

        // Check if there's a pending withdrawal
        $hasPendingWithdrawal = AffiliateWithdrawal::where('customer_id', $customer->id)
            ->where('status', 'pending')
            ->exists();

        if ($hasPendingWithdrawal) {
            return redirect()->back()->with('error', __('You already have a pending withdrawal request.'));
        }

        DB::beginTransaction();
        try {
            AffiliateWithdrawal::create([
                'customer_id' => $customer->id,
                'amount' => $request->amount,
                'withdrawal_method' => $request->withdrawal_method,
                'account_details' => $request->account_details,
                'status' => 'pending',
                'requested_at' => now(),
            ]);

            DB::commit();

            return redirect()->route('affiliate.withdrawals')->with('success', __('Withdrawal request submitted successfully!'));
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', __('Failed to submit withdrawal request. Please try again.'));
        }
    }
}
