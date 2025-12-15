@if ($posts->isNotEmpty())
    @php
        $partial = 'item-grid';
        $className = 'pr-30';
        $hasRowWrapper = true;
        switch (Theme::getLayoutName()) {
            case 'blog-big':
                $partial = 'item-big';
                $className = 'loop-big';
                break;
            case 'blog-wide':
                $partial = 'item-wide';
                $className = '';
                break;
            case 'blog-list':
                $partial = 'item-list';
                $className = 'loop-list pr-30 mb-50';
                $hasRowWrapper = false;
                break;
        }
    @endphp
    <div class="loop-grid {{ $className }}">
        @if ($hasRowWrapper) <div class="row"> @endif
            @foreach ($posts as $post)
                {!! Theme::partial('blog.posts.' . $partial, compact('post')) !!}
            @endforeach
        @if ($hasRowWrapper) </div> @endif
    </div>

    {!! $posts->withQueryString()->links(Theme::getThemeNamespace() . '::partials.custom-pagination') !!}
@endif
