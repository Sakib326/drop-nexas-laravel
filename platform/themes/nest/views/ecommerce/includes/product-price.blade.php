@include('plugins/ecommerce::themes.includes.product-price', [
    'priceWrapperClassName' => 'product-price',
    'priceClassName' => '',
    'priceOriginalWrapperClassName' => '',
    'priceOriginalClassName' => 'old-price',
    'priceFormatted' => $priceFormatted ?? null,
])
