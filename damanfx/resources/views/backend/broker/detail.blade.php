@extends('backend.layout.main')

@section('content')
<main class="content">
    <div class="container-fluid p-0">
        <div class="row">
            <div class="col-12">
                @include('backend.alerts')
            </div>
        </div>
        <div class="row mb-2 mb-xl-3">
            <div class="col-auto d-none d-sm-block">
                <h3>{{$site_title}}</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="col-12">
                            <div class="row">
                                @php
                                    $trading_platforms = isset($record->tradingPlatforms) && $record->tradingPlatforms->count() ? $record->tradingPlatforms : NULL;
                                @endphp
                                @if($trading_platforms)
                                    <div class="col-6 text-left">
                                        @foreach($trading_platforms as $value)
                                            @if($loop->last)
                                                {{$value->platformDetail->name}}
                                            @else
                                                {{$value->platformDetail->name.', '}}
                                            @endif
                                        @endforeach
                                    </div>
                                <div class="col-6 text-right"><h6>{{__('Trading Platforms')}}</h6></div>
                                <div class="col-12"><hr/></div>
                                @endif

                                @php
                                    $licenses = isset($record->licenses) && $record->licenses->count() ? $record->licenses : NULL;
                                @endphp
                                @if($licenses)
                                    <div class="col-6 text-left">
                                        @foreach($licenses as $value)
                                            @if($loop->last)
                                                {{$value->licenseDetail->name}}
                                            @else
                                                {{$value->licenseDetail->name.', '}}
                                            @endif
                                        @endforeach
                                    </div>
                                <div class="col-6 text-right"><h6>{{__('Licenses')}}</h6></div>
                                <div class="col-12"><hr/></div>
                                @endif

                                @php
                                    $localOffices = isset($record->localOffices) && $record->localOffices->count() ? $record->localOffices : NULL;
                                @endphp
                                @if($localOffices)
                                    <div class="col-6 text-left">
                                        @foreach($localOffices as $value)
                                            @if($loop->last)
                                                {{$value->countryDetail->name}}
                                            @else
                                                {{$value->countryDetail->name.', '}}
                                            @endif
                                        @endforeach
                                    </div>
                                    <div class="col-6 text-right"><h6>{{__('Local Offices')}}</h6></div>
                                    <div class="col-12"><hr/></div>
                                @endif

                                @php
                                    $depositOptions = isset($record->depositOptions) && $record->depositOptions->count() ? $record->depositOptions : NULL;
                                @endphp
                                @if($depositOptions)
                                    <div class="col-6 text-left">
                                        @foreach($depositOptions as $value)
                                            @if($loop->last)
                                                {{$value->paymentOptionDetail->name}}
                                            @else
                                                {{$value->paymentOptionDetail->name.', '}}
                                            @endif
                                        @endforeach
                                    </div>
                                    <div class="col-6 text-right"><h6>{{__('Deposit Options')}}</h6></div>
                                    <div class="col-12"><hr/></div>
                                @endif

                                @php
                                    $withdrawalOptions = isset($record->withdrawalOptions) && $record->withdrawalOptions->count() ? $record->withdrawalOptions : NULL;
                                @endphp
                                @if($withdrawalOptions)
                                    <div class="col-6 text-left">
                                        @foreach($withdrawalOptions as $value)
                                            @if($loop->last)
                                                {{$value->paymentOptionDetail->name}}
                                            @else
                                                {{$value->paymentOptionDetail->name.', '}}
                                            @endif
                                        @endforeach
                                    </div>
                                    <div class="col-6 text-right"><h6>{{__('Withdrawal Options')}}</h6></div>
                                    <div class="col-12"><hr/></div>
                                @endif

                                @php
                                    $tradingAssets = isset($record->tradingAssets) && $record->tradingAssets->count() ? $record->tradingAssets : NULL;
                                @endphp
                                @if($tradingAssets)
                                    <div class="col-6 text-left">
                                        @foreach($tradingAssets as $value)
                                            @if($loop->last)
                                                {{$value->assetDetail->name}}
                                            @else
                                                {{$value->assetDetail->name.', '}}
                                            @endif
                                        @endforeach
                                    </div>
                                    <div class="col-6 text-right"><h6>{{__('Assets Available For Trading')}}</h6></div>
                                    <div class="col-12"><hr/></div>
                                @endif

                                <div class="col-6 text-left">
                                    {{ isset($record->is_demo_account) && $record->is_demo_account == '0' ? __('Yes') : __('No')}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Demo Account')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->is_withdrawal_commission) && $record->is_withdrawal_commission == '0' ? __('Yes') : __('No')}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Withdrawal Commission')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->minimum_deposit_amount) && $record->minimum_deposit_amount ? __('$').$record->minimum_deposit_amount : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Minimum Deposit Amount')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->is_islamic_account) && $record->is_islamic_account == '0' ? __('Yes') : __('No')}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Islamic Account')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->year_founded) && $record->year_founded ? $record->year_founded : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Year Founded')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->bonus_amount) && $record->bonus_amount ? '$ '.$record->bonus_amount : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Bonus Amount')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->bonus_end_date) && $record->bonus_end_date ? date('d-m-Y', strtotime($record->bonus_end_date)) : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Bonus End Date')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->bonus_url) && $record->bonus_url ? $record->bonus_url : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Bonus URL')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->offer) && $record->offer ? $record->offer : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Offer')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->meta_title) && $record->meta_title ? $record->meta_title : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Meta Title')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->meta_keyword) && $record->meta_keyword ? $record->meta_keyword : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Meta Keyword')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->meta_description) && $record->meta_description ? $record->meta_description : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Meta Description')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-6 text-left">
                                    {{ isset($record->focus_keyphrase) && $record->focus_keyphrase ? $record->focus_keyphrase : ''}}
                                </div>
                                <div class="col-6 text-right"><h6>{{__('Focus Keyphrase')}}</h6></div>
                                <div class="col-12"><hr/></div>

                                <div class="col-12">
                                    <img src="{{url('uploads/broker/'.$record->image)}}" class="img-fluid">
                                </div>
                                <div class="col-12"><hr/></div>

                                <div class="col-12">
                                    {{$record->address}}
                                </div>
                                <div class="col-12"><hr/></div>

                                <div class="col-12 text-right">
                                    {!! $record->description !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection