<header id="banner" class="wrapper">
    <div class="inner">
        <h2 id="banner-title">{{ page.subtitle }}</h2>
        <div id="banner-start">
            <span id="banner-start-command">how to use pilibaba</span>
            <a id="banner-start-link" href="{{ url_for('pilipay-http-api-reference.html') }}"><i class="fa fa-arrow-right"></i></a>
        </div>
        <div id="banner-share"></div>
    </div>
</header>
</div>
<div id="content-wrap">
    <div class="wrapper">
        <div class="inner">
            {{ page.content }}
            <div id="intro-get-started-wrap">
                <a href="{{ url_for('pilipay-http-api-reference.html') }}"
                   id="intro-get-started-link">{{ __('index.get_started') }}</a>
            </div>
        </div>
    </div>
</div>