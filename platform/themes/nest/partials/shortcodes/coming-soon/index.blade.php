<section class="container box-coming-soon overflow-hidden">
    @if($shortcode->image)
        <div class="row align-items-center">
            <div class="col-lg-5 mb-30">
        @endif
                @if ($countdownTime)
                    <div class="deals-countdown" data-countdown="{{ $countdownTime }}"></div>
                @endif

                @if($shortcode->title)
                    <h3 class="color-brand-2 mb-2">
                        {!! BaseHelper::clean($shortcode->title) !!}
                    </h3>
                @endif

                @if ($form)
                    <div class="newsletter">
                        {!! $form->renderForm() !!}
                    </div>
                @endif

                <div class="mt-30 footer-info">
                    <ul class="list-wrap">
                        @if ($address = $shortcode->address)
                            <li>
                                <p><x-core::icon name="ti ti-map-pin" class="me-1" /> {!! BaseHelper::clean($address) !!}</p>
                            </li>
                        @endif

                        @if ($hotline = $shortcode->hotline)
                            <li>
                                <p>
                                    <x-core::icon name="ti ti-phone" class="me-1" /> <a href="tel:{{ $hotline }}" dir="ltr">{{ $hotline }}</a>
                                </p>
                            </li>
                        @endif

                        @if ($businessHours = $shortcode->business_hours)
                            <li>
                                <p><x-core::icon name="ti ti-clock" class="me-1" /> {!! BaseHelper::clean(nl2br($businessHours)) !!}</p>
                            </li>
                        @endif
                    </ul>
                </div>

                @if($shortcode->show_social_links ?? true)
                    @if ($socialLinks = theme_option('social_links'))
                        <div class="mobile-social-icon">
                            @foreach(json_decode($socialLinks, true) as $socialLink)
                                @if (count($socialLink) == 3)
                                    <a href="{{ $socialLink[2]['value'] }}"
                                       title="{{ $socialLink[0]['value'] }}">
                                        <img src="{{ RvMedia::getImageUrl($socialLink[1]['value']) }}" alt="{{ $socialLink[0]['value'] }}" />
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    @endif
                @endif

                @if($shortcode->image)
            </div>
            <div class="col-lg-7 mb-30">
                {{ RvMedia::image($shortcode->image, $shortcode->title, attributes: ['class' => 'coming-soon-image']) }}
            </div>
            @endif
        </div>
</section>
