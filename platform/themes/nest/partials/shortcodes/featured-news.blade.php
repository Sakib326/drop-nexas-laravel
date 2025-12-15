<section class="section-padding-60" id="featured-news">
    <div class="container">
        <div class="col-12">
            @if (BaseHelper::clean($shortcode->title))
                <h3 class="section-title style-1 mb-30 wow fadeIn animated">{!! BaseHelper::clean($shortcode->title) !!}</h3>
            @endif

            @if ($style == 'grid')
                <div class="loop-grid">
                    <div class="row">
                        @foreach($posts as $post)
                            <article class="col-xl-3 col-lg-4 col-md-6 text-center hover-up mb-30 animated">
                                <div class="post-thumb">
                                    <a href="{{ $post->url }}">
                                        <img class="border-radius-15" src="{{ RvMedia::getImageUrl($post->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $post->name }}" />
                                    </a>
                                </div>
                                <div class="entry-content-2">
                                    @if ($post->first_category && $post->first_category->name)
                                        <p class="mb-10 font-sm h6">
                                            <a class="entry-meta text-muted" href="{{ $post->first_category->url }}">{{ $post->first_category->name }}</a>
                                        </p>
                                    @endif
                                    <h4 class="post-title mb-15">
                                        <a href="{{ $post->url }}">{!! BaseHelper::clean($post->name) !!}</a>
                                    </h4>
                                    <div class="entry-meta font-xs color-grey mt-10 pb-10">
                                        <div>
                                            <span class="post-on mr-10">{{ $post->created_at->translatedFormat('d M Y') }}</span>
                                            <span class="hit-count has-dot mr-10">{{ __(':count Views', ['count' => number_format($post->views)]) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        @endforeach
                    </div>
                </div>
            @else
                <div class="post-list mb-4 mb-lg-0">
                    <div class="row">
                        @foreach($posts as $post)
                            <article class="wow fadeIn animated col-lg-6">
                                <div class="d-md-flex d-block">
                                    <div class="post-thumb d-flex mr-15 border-radius-10">
                                        <a class="color-white" href="{{ $post->url }}">
                                            <img class="border-radius-10" src="{{ RvMedia::getImageUrl($post->image, 'medium', false, RvMedia::getDefaultImage()) }}" alt="{{ $post->name }}">
                                        </a>
                                    </div>
                                    <div class="post-content">
                                        @if ($post->first_category && $post->first_category->name)
                                            <div class="entry-meta mb-5 mt-10">
                                                <a class="entry-meta meta-2" href="{{ $post->first_category->url }}"><span class="post-in text-danger font-x-small text-uppercase">{{ $post->first_category->name }}</span></a>
                                            </div>
                                        @endif
                                        <h4 class="post-title mb-25 text-limit-2-row">
                                            <a href="{{ $post->url }}">{{ $post->name }}</a>
                                        </h4>
                                        <div class="entry-meta meta-1 font-xs color-grey mt-10 pb-10">
                                            <div>
                                                <span class="post-on"> <i class="far fa-clock"></i> {{ $post->created_at->translatedFormat('d M Y') }}</span>
                                                <span class="hit-count has-dot">{{ number_format($post->views) }} {{ __('Views')}}</span>
                                            </div>
                                            <a href="{{ $post->url }}">{{ __('Read more') }} <i class="fa fa-arrow-right font-xxs ml-5"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        @endforeach
                    </div>
                </div>
            @endif
        </div>
    </div>
</section>
