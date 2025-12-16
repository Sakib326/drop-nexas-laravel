<?php

namespace App\Http\Controllers;

use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Models\Product;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Http\Request;

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

        return Theme::scope(
            'ecommerce.affiliate.dashboard',
            compact('customer', 'referralCount'),
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
}
