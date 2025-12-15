<div class="archive-header-2 text-center pt-80 pb-50">
    <h1 class="display-2 mb-20">{{ $store->name }}</h1>
    <div class="row">
        <div class="col-12 mb-50">
            @php
                $description = BaseHelper::clean($store->description);
                $content = BaseHelper::clean($store->content);
            @endphp

            @if ($description || $content)
                <div class='ck-content'>
                    {!! $content ?: $description !!}
                </div>
            @endif
        </div>

        <form action="{{ $store->url }}" method="GET" id="products-filter-ajax" data-scroll-to=".products-listing">
            <div class="col-lg-5 mx-auto">
                <div class="sidebar-widget-2 widget_search mb-50">
                    <div class="search-form form-group">
                        <input name="q" value="{{ BaseHelper::stringify(request()->input('q')) }}" type="text" placeholder="{{ __('Search in this store...') }}">
                        <button type="submit"><i class="fi-rs-search"></i></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="row flex-row-reverse">
    <div class="col-lg-9 products-listing position-relative">
        @include(Theme::getThemeNamespace('views.marketplace.stores.items'), compact('products'))
    </div>
    <div class="col-lg-3 primary-sidebar sticky-sidebar">
        <div class="sidebar-widget widget-store-info mb-30 bg-3 border-0">
            <div class="vendor-logo mb-30">
                <img src="{{ RvMedia::getImageUrl($store->logo, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $store->name }}" />
            </div>
            <div class="vendor-info">
                <div class="product-category">
                    <span class="text-muted">{{ __('Since :year', ['year' => $store->created_at->year]) }}</span>
                </div>
                <h4 class="mb-5"><a href="{{ $store->url }}" class="text-heading">{!! BaseHelper::clean($store->name) !!}</a></h4>
                <div class="mb-15">
                    @include(Theme::getThemeNamespace('views.marketplace.stores.partials.rating'))
                </div>
                <div class="vendor-des mb-30">
                    <p class="font-sm text-heading">{!! BaseHelper::clean($store->description) !!}</p>
                </div>

                @include(Theme::getThemeNamespace('views.marketplace.stores.partials.socials'))

                <div class="vendor-info">
                    @include(Theme::getThemeNamespace('views.marketplace.stores.partials.info'))

                    @if (MarketplaceHelper::isEnabledMessagingSystem() && (! auth('customer')->check() || $store->id != auth('customer')->user()->store->id))
                        <div class="mt-3">
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
                                                ->wrapperAttributes(['class' => 'col-12']),
                                            true
                                        )
                                        ->renderForm()
                                !!}
                            </div>

                            @include(MarketplaceHelper::viewPath('includes.contact-form-script'))
                        </div>
                    @endif
                </div>
            </div>
        </div>
        @include(Theme::getThemeNamespace('views.marketplace.stores.partials.sidebar'))
    </div>
</div>
