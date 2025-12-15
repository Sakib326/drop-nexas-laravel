@if (is_plugin_active('ecommerce'))
    <div class="sidebar-widget product-sidebar  mb-30 p-30 bg-grey border-radius-10">
        <div class="widget-header position-relative mb-20 pb-10">
            <h5 class="widget-title mb-10">{{ $config['name'] }}</h5>
            <div class="bt-1 border-color-1"></div>
        </div>
        @foreach(get_featured_products(['take' => $config['number_display']]) as $product)
            <div class="single-post clearfix">
                <div class="image">
                    <a href="{{ $product->url }}"><img src="{{ RvMedia::getImageUrl($product->image, 'product-thumb', false, RvMedia::getDefaultImage()) }}" alt="{{ $product->name }}"></a>
                </div>
                <div class="content pt-10">
                    <h5><a href="{{ $product->url }}">{{ $product->name }}</a></h5>
                    <div class="mb-0 mt-5">
                        @include(Theme::getThemeNamespace('views.ecommerce.includes.product-price'))
                    </div>
                    {!! Theme::partial('rating-item', ['ratingCount' => $product->reviews_count, 'ratingAvg' => $product->reviews_avg]) !!}
                </div>
            </div>
        @endforeach
    </div>
@endif
