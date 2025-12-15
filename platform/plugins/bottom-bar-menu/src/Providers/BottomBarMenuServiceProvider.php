<?php

namespace Botble\BottomBarMenu\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\Facades\Theme;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;

class BottomBarMenuServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this->setNamespace('plugins/bottom-bar-menu')
            ->loadAndPublishViews()
            ->publishAssets();

        Event::listen(RouteMatched::class, function (): void {
            if (is_in_admin()) {
                return;
            }

            Theme::asset()
                ->usePath(false)
                ->add(
                    'bottom-bar-menu-css',
                    asset('vendor/core/plugins/bottom-bar-menu/css/menu.css'),
                    [],
                    [],
                    '1.0.0'
                );

            Theme::asset()
                ->container('footer')
                ->usePath(false)
                ->add(
                    'bottom-bar-menu-js',
                    asset('vendor/core/plugins/bottom-bar-menu/js/menu.js'),
                    ['jquery'],
                    [],
                    '1.0.0'
                );
        });

        $this->app->booted(function (): void {
            add_filter(THEME_FRONT_FOOTER, function (?string $html): ?string {
                if (is_in_admin()) {
                    return $html;
                }

                return $html . view('plugins/bottom-bar-menu::menu')->render();
            }, 16);
        });

        $this->app['events']->listen(RenderingThemeOptionSettings::class, function () {
            theme_option()
                ->setSection([
                    'title' => __('Bottom Bar Menu'),
                    'id' => 'opt-text-subsection-bottom-bar-menu',
                    'subsection' => true,
                    'icon' => 'ti ti-category-2',
                    'fields' => [
                        [
                            'id' => 'bottom_bar_menu_show_text',
                            'type' => 'customSelect',
                            'label' => __('Show menu text'),
                            'attributes' => [
                                'name' => 'bottom_bar_menu_show_text',
                                'list' => [
                                    'yes' => __('Yes'),
                                    'no' => __('No'),
                                ],
                                'value' => 'yes',
                                'options' => [
                                    'class' => 'form-control',
                                ],
                            ],
                        ],
                        [
                            'id' => 'bottom_bar_menu_text_font_size',
                            'type' => 'number',
                            'label' => __('Menu text font size'),
                            'attributes' => [
                                'name' => 'bottom_bar_menu_text_font_size',
                                'value' => 12,
                                'options' => [
                                    'class' => 'form-control',
                                ],
                            ],
                        ],
                    ],
                ]);
        });
    }
}
