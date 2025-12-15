@php
    $categories = ProductCategoryHelper::getProductCategoriesWithUrl();
    $categoriesRequest = (array) request()->input('categories', []);
    $categoryId = Arr::get($categoriesRequest, 0);
    $maxFilterPrice = EcommerceHelper::getProductMaxPrice();
@endphp

<form action="{{ $store->url }}" method="GET" class="bb-product-form-filter">
    @include(EcommerceHelper::viewPath('includes.filters.filter-hidden-fields'))
    <input name="categories[]" type="hidden" value="{{ $categoryId }}">

    @include(EcommerceHelper::viewPath('includes.filters.categories'))

    @if (! EcommerceHelper::hideProductPrice() || EcommerceHelper::isCartEnabled())
        @include(EcommerceHelper::viewPath('includes.filters.price'))
    @endif
</form>
