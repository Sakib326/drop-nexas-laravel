<ul {!! $options !!}>
    @php $menu_nodes->loadMissing('metadata'); @endphp
    @foreach ($menu_nodes as $key => $row)
        <li class="@if ($row->has_child) menu-item-has-children @endif {{ $row->css_class }}">
            @if ($row->has_child)
                <span class="menu-expand"></span>
            @endif
            <a href="{{ url($row->url) }}" target="{{ $row->target }}">
                {!! $row->icon_html !!} {{ $row->title }}
            </a>
            @if ($row->has_child)
                {!!
                    Menu::generateMenu([
                        'menu'       => $menu,
                        'view'       => 'mobile-menu',
                        'options'    => ['class' => 'dropdown'],
                        'menu_nodes' => $row->child,
                    ])
                !!}
            @endif
        </li>
    @endforeach
</ul>
