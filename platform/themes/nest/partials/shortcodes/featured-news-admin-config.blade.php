<div class="mb-3">
    <label class="form-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control" placeholder="Title">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Limit') }}</label>
    <input type="number" name="limit" value="{{ Arr::get($attributes, 'limit', 4) }}" class="form-control" placeholder="{{ __('Number of posts to display') }}">
</div>

<div class="mb-3">
    <label class="form-label">{{ __('Style') }}</label>
    <select name="style" class="form-select">
        <option value="list" {{ Arr::get($attributes, 'style', 'list') == 'list' ? 'selected' : '' }}>{{ __('List') }}</option>
        <option value="grid" {{ Arr::get($attributes, 'style') == 'grid' ? 'selected' : '' }}>{{ __('Grid') }}</option>
    </select>
</div>
