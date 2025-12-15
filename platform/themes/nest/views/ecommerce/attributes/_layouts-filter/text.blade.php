@if (($attributes = $attributes->where('attribute_set_id', $set->id)) && $attributes->isNotEmpty())
    <div class="col-xl-3 col-lg-6 col-md-6 mb-lg-0 mb-md-2 mb-sm-2 widget-filter-item" data-type="text">
        @include('plugins/ecommerce::themes.attributes._layouts-filter.text')
    </div>
@endif
