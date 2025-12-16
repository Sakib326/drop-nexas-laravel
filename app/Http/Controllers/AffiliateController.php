<?php

namespace App\Http\Controllers;

use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;

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

        return Theme::scope(
            'ecommerce.affiliate.dashboard',
            compact('customer'),
            'plugins/ecommerce::themes.affiliate.dashboard'
        )->render();
    }
}
