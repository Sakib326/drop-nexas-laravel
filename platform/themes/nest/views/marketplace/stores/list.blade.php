@php
    $coverImage = $store->getMetaData('cover_image', true) ?: theme_option('vendor_cover_default_image');
@endphp
<div class="archive-header-3 mt-30 mb-80 w-full"
    style="background-image: url({{ $coverImage ? RvMedia::getImageUrl($coverImage) : Theme::asset()->url('imgs/vendor/vendor-header-bg.png') }}) !important;">
        <div class='row'>
            <div class='col-lg-7'>
                <div class='row'>
                    <div class="vendor-logo col-3">
                        <img src="{{ RvMedia::getImageUrl($store->logo, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $store->name }}" />
                    </div>
                    <div class="vendor-content col">
                        <div class="product-category">
                            <span class="text-muted">{{ __('Since :year', ['year' => $store->created_at->year]) }}</span>
                        </div>
                        <h3 class="mb-5 text-white"><a href="{{ $store->url }}" class="text-white">{!! BaseHelper::clean($store->name) !!}</a></h3>
                        <div class="mb-15">
                            @include(Theme::getThemeNamespace('views.marketplace.stores.partials.rating'))
                        </div>
                        <div class="mb-15 text-white">
                            @include(Theme::getThemeNamespace('views.marketplace.stores.partials.info'))
                        </div>
                    </div>
                </div>
            </div>
            <div class='col-lg-5 text-lg-end'>
                <div class="vendor-content">
                    @include(Theme::getThemeNamespace('views.marketplace.stores.partials.socials'), ['headerClass' => 'text-white'])
                </div>
            </div>
        </div>
</div>

<div class='row'>
    <div class="col-12 mb-50">
        @php
            $description = BaseHelper::clean($store->description);
            $content = BaseHelper::clean($store->content);
        @endphp

        @if ($description || $content)
            {!! $content ?: $description !!}
        @endif
    </div>
</div>
<div class="row flex-row-reverse">
    <div class="col-lg-9 products-listing position-relative">
        @include(Theme::getThemeNamespace('views.marketplace.stores.items'), compact('products'))
    </div>
    <div class="col-lg-3 primary-sidebar sticky-sidebar">
        @if (MarketplaceHelper::isEnabledMessagingSystem() && (! auth('customer')->check() || $store->id != auth('customer')->user()->store->id))
            <div class="sidebar-widget mb-30">
                <p class="section-title style-1 mb-15 font-heading h6" data-title="{{ __('Contact Vendor') }}" style="font-size: 1rem;">{{ __('Contact Vendor') }}</p>
                <div class="mb-4">
                    <p class="mb-3">{{ __('All messages are recorded and spam is not tolerated. Your email address will be shown to the recipient.') }}</p>
                    {!!
                        $contactForm
                            ->setFormOption('class', 'contact-form-style bb-contact-store-form')
                            ->setFormInputClass(' ')
                            ->setFormLabelClass('d-none sr-only')
                            ->setFormInputWrapperClass('form-group mb-20')
                            ->modify(
                                'submit',
                                'submit',
                                Botble\Base\Forms\FieldOptions\ButtonFieldOption::make()
                                    ->addAttribute('data-bb-loading', 'button-loading')
                                    ->cssClass('submit submit-auto-width')
                                    ->label(__('Send message'))
                                    ->wrapperAttributes(['class' => 'col-12'])
                                    ->toArray(),
                                true
                            )
                            ->renderForm()
                    !!}
                </div>

                @include(MarketplaceHelper::viewPath('includes.contact-form-script'))
            </div>
        @endif

        <form action="{{ $store->url }}" method="GET" id="products-filter-ajax" data-scroll-to=".products-listing">
            @include(Theme::getThemeNamespace('views.marketplace.stores.partials.sidebar'), ['isShowSearchForm' => true])
        </form>
    </div>
</div>
