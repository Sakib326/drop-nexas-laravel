@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    {!! Theme::partial('header') !!}

    <main class="main" id="main-section">
        {!! Theme::content() !!}
    </main>

    {!! Theme::partial('footer') !!}
@endsection
