@php
    Theme::asset()->container('footer')->usePath()->add('jquery.theia.sticky-js', 'js/plugins/jquery.theia.sticky.js');
@endphp

@if (theme_option('vendor_page_detail_layout') == 'list')
    @include(Theme::getThemeNamespace('views.marketplace.stores.list'))
@else
    @include(Theme::getThemeNamespace('views.marketplace.stores.grid'))
@endif
