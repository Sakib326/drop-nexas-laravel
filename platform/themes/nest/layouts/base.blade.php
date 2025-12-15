<!DOCTYPE html>
<html  {!! Theme::htmlAttributes() !!}>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="csrf-token" content="{{ csrf_token() }}">

    {!! BaseHelper::googleFonts('https://fonts.googleapis.com/css2?family=' . urlencode(theme_option('font_text', 'Lato')) . ':ital,wght@0,400;0,700;1,400;1,700&family=' . urlencode(theme_option('font_heading', 'Quicksand')) . ':wght@400;500;600;700&display=swap') !!}

    <style>
        :root {
            --font-text: {{ theme_option('font_text', 'Lato') }}, sans-serif;
            --font-heading: {{ theme_option('font_heading', 'Quicksand') }}, sans-serif;
            --color-brand: {{ theme_option('color_brand', '#3BB77E') }};
            --primary-color: {{ theme_option('color_brand', '#3BB77E') }};
            --color-brand-rgb: {{ implode(',', BaseHelper::hexToRgb(theme_option('color_brand', '#3BB77E'))) }};
            --color-brand-dark: {{ theme_option('color_brand_dark', '#29A56C') }};
            --color-brand-2: {{ theme_option('color_brand_2', '#FDC040') }};
            --color-primary: {{ theme_option('color_primary', '#5a97fa') }};
            --color-secondary: {{ theme_option('color_secondary', '#3e5379') }};
            --color-warning: {{ theme_option('color_warning', '#ff9900') }};
            --color-danger: {{ theme_option('color_danger', '#FD6E6E') }};
            --color-success: {{ theme_option('color_success', '#81B13D') }};
            --color-info: {{ theme_option('color_info', '#2cc1d8') }};
            --color-text: {{ theme_option('color_text', '#4c4c4c') }};
            --color-heading: {{ theme_option('color_heading', '#253D4E') }};
            --color-grey-1: {{ theme_option('color_grey_1', '#253D4E') }};
            --color-grey-2: {{ theme_option('color_grey_2', '#242424') }};
            --color-grey-4: {{ theme_option('color_grey_4', '#adadad') }};
            --color-grey-9: {{ theme_option('color_grey_9', '#f4f5f9') }};
            --color-muted: {{ theme_option('color_muted', '#B6B6B6') }};
            --color-body: {{ theme_option('color_body', '#7E7E7E') }};
            --heading-font-size: {{ theme_option('heading_font_size', 32) }}px;
            --body-font-size: {{ theme_option('body_font_size', 16) }}px;
        }
    </style>

    @php
        Theme::asset()->remove('language-css');
        Theme::asset()->container('footer')->remove('language-public-js');
        Theme::asset()->container('footer')->remove('simple-slider-owl-carousel-css');
        Theme::asset()->container('footer')->remove('simple-slider-owl-carousel-js');
        Theme::asset()->container('footer')->remove('simple-slider-css');
        Theme::asset()->container('footer')->remove('simple-slider-js');
    @endphp

    {!! Theme::header() !!}
</head>
<body {!! Theme::bodyAttributes() !!}>
{!! apply_filters(THEME_FRONT_BODY, null) !!}
<div id="alert-container"></div>

{!! Theme::partial('preloader') !!}

@yield('content')

<script>
    window.trans = {
        "Views": "{{ __('Views') }}",
        "Read more": "{{ __('Read more') }}",
        "days": "{{ __('days') }}",
        "hours": "{{ __('hours') }}",
        "mins": "{{ __('mins') }}",
        "sec": "{{ __('sec') }}",
        "No reviews!": "{{ __('No reviews!') }}",
        "Sold By": "{{ __('Sold By') }}",
        "Quick View": "{{ __('Quick View') }}",
        "Add To Wishlist": "{{ __('Add To Wishlist') }}",
        "Add To Compare": "{{ __('Add To Compare') }}",
        "Out Of Stock": "{{ __('Out Of Stock') }}",
        "Add To Cart": "{{ __('Add To Cart') }}",
        "Add": "{{ __('Add') }}",
    };

    window.siteUrl = "{{ route('public.index') }}";

    @if (is_plugin_active('ecommerce'))
        window.currencies = {!! json_encode(get_currencies_json()) !!};
    @endif
</script>

{!! Theme::footer() !!}
</body>
</html>
