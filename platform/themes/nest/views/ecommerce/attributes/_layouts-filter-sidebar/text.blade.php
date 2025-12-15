@if (($attributes = $attributes->where('attribute_set_id', $set->id)) && $attributes->isNotEmpty())
    <div class="bb-product-filter-attribute-item">
        <h4 class="bb-product-filter-title">{{ $set->title }}</h4>

        <div class="bb-product-filter-content">
            <ul class="list-filter">
                @foreach($attributes as $attribute)
                    <li data-slug="{{ $attribute->slug }}">
                        <div class="tags-checkbox">
                            <label>
                                <input class="product-filter-item" type="checkbox" name="attributes[{{ $set->slug }}][]" value="{{ $attribute->id }}" {{ in_array($attribute->id, $selected) ? 'checked' : '' }}>
                                <span><i class="fi-rs- mr-10"></i> {{ $attribute->title }}</span>
                            </label>
                        </div>
                    </li>
                @endforeach
            </ul>
        </div>
    </div>
@endif
