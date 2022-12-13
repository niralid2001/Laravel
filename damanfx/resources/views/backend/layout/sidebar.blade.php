<nav id="sidebar" class="sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="{{route('admin_dashboard')}}">
            <img src="{{ asset('front/images/logo.png') }}" alt="{{$site_name}}" class="img-fluid" width="132" height="132" />
            <!--<h3>DAMANFX</h3>-->
        </a>
        <ul class="sidebar-nav">
            <!--<li class="sidebar-header">
                Pages
            </li>-->
            <li class="sidebar-item {{ (request()->is('backend/dashboard')) ? 'active' : '' }}">
                <a href="{{route('admin_dashboard')}}" class="sidebar-link">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">{{ __('Dashboard') }}</span>
                    <!--<span class="badge badge-sidebar-primary">5</span>-->
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/trading-platform*') || request()->is('backend/license*') || request()->is('backend/payment-option*') || request()->is('backend/trading-asset*'))? 'active' : '' }}">
                <a href="#sidebar_tables" data-toggle="collapse" class="sidebar-link">
                    <i class="align-middle" data-feather="menu"></i> <span class="align-middle">{{ __('Tables')}}</span>
                </a>
            </li>
            <ul id="sidebar_tables" class="sidebar-dropdown list-unstyled collapse {{ (request()->is('backend/trading-platform*') || request()->is('backend/license*') || request()->is('backend/payment-option*') || request()->is('backend/trading-asset*') || request()->is('backend/bonus-type*') || request()->is('backend/account-type*'))  ? 'show' : '' }}" data-parent="#sidebar">
                <li class="sidebar-item {{ (request()->is('backend/trading-platform*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_trading-platforms')}}">{{ __('Trading Platforms')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/license*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_licenses')}}">{{ __('Licenses')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/bonus-type*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_bonus-types')}}">{{ __('Bonus Types')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/account-type*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_account-types')}}">{{ __('Account Types')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/payment-options*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_payment-options')}}">{{ __('Payment Options')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/trading-asset*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_trading-assets')}}">{{ __('Trading Assets')}}</a></li>
            </ul>

            <li class="sidebar-item {{ (request()->is('backend/news*')) ? 'active' : '' }}">
                <a href="{{route('admin_news')}}" class="sidebar-link">
                    <i class="align-middle" data-feather="aperture"></i> <span class="align-middle">{{ __('News') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/artical*')) ? 'active' : '' }}">
                <a href="{{route('admin_articals')}}" class="sidebar-link">
                    <i class="align-middle" data-feather="target"></i> <span class="align-middle">{{ __('Articles') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/broker*')) ? 'active' : '' }}">
                <a href="{{route('admin_brokers')}}" class="sidebar-link">
                    <i class="align-middle" data-feather="award"></i> <span class="align-middle">{{ __('Brokers') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/subscribers*')) ? 'active' : '' }}">
                <a href="{{route('admin_subscribers')}}" class="sidebar-link">
                    <i class="fa fa-envelope"></i> <span class="align-middle">{{ __('Subscribers') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/trade-users*')) ? 'active' : '' }}">
                <a href="{{route('admin_trade-users')}}" class="sidebar-link">
                    <i class="fa fa-users"></i> <span class="align-middle">{{ __('Trade Users') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/bonus*')) ? 'active' : '' }}">
                <a href="{{route('admin_bonus')}}" class="sidebar-link">
                    <i class="align-middle" data-feather="gift"></i> <span class="align-middle">{{ __('Bonus') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/ads*')) ? 'active' : '' }}">
                <a href="{{route('admin_ads')}}" class="sidebar-link">
                    <i class="fa fa-image"></i> <span class="align-middle">{{ __('Ads') }}</span>
                </a>
            </li>

            <li class="sidebar-item {{ (request()->is('backend/general-settings') || request()->is('backend/email-templates') || request()->is('backend/page*') || request()->is('backend/platform-charges*') || request()->is('backend/delete-all-data*'))? 'active' : '' }}">
                <a href="#sidebar_settings" data-toggle="collapse" class="sidebar-link">
                    <i class="align-middle" data-feather="settings"></i> <span class="align-middle">{{ __('Settings')}}</span>
                </a>
            </li>
            <ul id="sidebar_settings" class="sidebar-dropdown list-unstyled collapse {{ (request()->is('backend/site-settings') || request()->is('backend/email-templates') || request()->is('backend/page*') || request()->is('backend/platform-charges*') || request()->is('backend/smtp*') || request()->is('backend/delete-all-data*'))  ? 'show' : '' }}" data-parent="#sidebar">
                <li class="sidebar-item {{ (request()->is('backend/site-settings')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_site-settings')}}">{{ __('General Settings')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/email-templates')) ? 'active' : '' }}"><a class="sidebar-link" href="{{route('admin_email-templates')}}">{{ __('Email Templates')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/page*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{ route('admin_pages')}}">{{ __('Page')}}</a></li>
                <li class="sidebar-item {{ (request()->is('backend/smtp*')) ? 'active' : '' }}"><a class="sidebar-link" href="{{ route('admin_smtp')}}">{{ __('SMTP Mail Settings')}}</a></li>
            </ul>            
        </ul>
    </div>
</nav>
