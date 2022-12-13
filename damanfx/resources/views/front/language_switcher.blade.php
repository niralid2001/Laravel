
    @foreach($available_locales as $locale_name => $available_locale)
        @if($available_locale === $current_locale)
            <li><span class="dropdown-item lang_drop text-gray-700">{{ $locale_name }}</span></li>
        @else
            <li><a class="dropdown-item lang_drop" href="language/{{ $available_locale }}" >{{ $locale_name }} </a></li>
        @endif
    @endforeach