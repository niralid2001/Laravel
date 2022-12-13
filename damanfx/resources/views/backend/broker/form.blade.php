@extends('backend.layout.main')
@section('css')
    <link class="js-stylesheet" href="{{ asset('plugins/parsley/parsley.css') }}" rel="stylesheet">
    <link class="js-stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}" rel="stylesheet">
@endsection
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
                        <form method="POST" action="@if(isset($record)){{ route('admin_broker-update', array('id' => Crypt::encrypt($record->id))) }}@else{{route('admin_broker-store')}}@endif" id="news-form" enctype="multipart/form-data" data-parsley-validate="">
                            <input type="hidden" name="id" value="{{ isset($record->id) ? Crypt::encrypt($record->id) : '' }}">
                            {{ csrf_field() }}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">{{__('Name')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="{{__('Name')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->name) ? $record->name : old('name') }}">
                                    @if ($errors->has('name')) <div class="text-danger">{{ $errors->first('name') }}</div>@endif
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">{{__('Image')}}<span class="text-danger">*</span></label>
                                        <div class="profile-icon">
                                            @php($i = 0)
                                            @if(isset($record->image))
                                                @if($record->image !='')
                                                    @php($required = '')
                                                    <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/broker/'.$record->image)}}"  alt=''>
                                                @else
                                                    @php($required = 'required')
                                                    <img class='img-responsive img-fluid' id="uploadPreview{{$i}}" src="{{url('public/no.jpg')}}"  alt=''>
                                                @endif
                                            @else
                                                @php($required = 'required')
                                                <img class='img-responsive img-fluid' id="uploadPreview{{$i}}" src="{{url('public/no.jpg')}}"  alt=''>
                                            @endif
                                        </div>
                                        <div class="m-b-10">
                                            <input type="file" id="uploadImage{{$i}}" accept="image/x-png, image/gif, image/jpeg" class="btn btn-warning btn-block btn-sm"  name="image" {{$required}} data-parsley-required-message="{{ __("This value is required.")}}" onChange="this.parentNode.nextSibling.value = this.value; PreviewImage({{$i}});" >
                                            @if ($errors->has('image')) <div class="errors_msg">{{ $errors->first('image') }}</div>@endif
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="name">{{__('Address')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="address" name="address" placeholder="{{__('Address')}}" required=""  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->address) ? $record->address : old('address') }}</textarea>
                                    @if ($errors->has('address')) <div class="text-danger">{{ $errors->first('address') }}</div>@endif
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="description">{{__('Description')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="description" name="description" placeholder="{{__('Description')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->description) ? $record->description : old('description') }}</textarea>
                                    @if ($errors->has('description')) <div class="text-danger">{{ $errors->first('description') }}</div>@endif
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="is_demo_account">{{__('Is Demo Account?')}}</label><br/>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_demo_account" value="0" {{isset($record->is_demo_account) && $record->is_demo_account == '0' ? 'checked' : ''}}>
                                        <span class="form-check-label">
                                            {{__('Yes')}}
                                        </span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_demo_account" value="1" {{isset($record->is_demo_account) && $record->is_demo_account == '0' ? '' : 'checked'}}>
                                        <span class="form-check-label">
                                            {{__('No')}}
                                        </span>
                                    </label>
                                    @if ($errors->has('meta_keyword')) <div class="text-danger">{{ $errors->first('meta_keyword') }}</div>@endif
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="is_withdrawal_commission">{{__('Is Withdrawal Commission?')}}</label><br/>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_withdrawal_commission" value="0" {{isset($record->is_withdrawal_commission) && $record->is_withdrawal_commission == '0' ? 'checked' : ''}}>
                                        <span class="form-check-label">
                                            {{__('Yes')}}
                                        </span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_withdrawal_commission" value="1" {{isset($record->is_withdrawal_commission) && $record->is_withdrawal_commission == '0' ? '' : 'checked'}}>
                                        <span class="form-check-label">
                                            {{__('No')}}
                                        </span>
                                    </label>
                                    @if ($errors->has('meta_keyword')) <div class="text-danger">{{ $errors->first('meta_keyword') }}</div>@endif
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="is_islamic_account">{{__('Is Islamic Account?')}}</label><br/>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_islamic_account" value="0" {{isset($record->is_islamic_account) && $record->is_islamic_account == '0' ? 'checked' : ''}}>
                                        <span class="form-check-label">
                                            {{__('Yes')}}
                                        </span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_islamic_account" value="1" {{isset($record->is_islamic_account) && $record->is_islamic_account == '0' ? '' : 'checked'}}>
                                        <span class="form-check-label">
                                            {{__('No')}}
                                        </span>
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="is_withdrawal_commission">{{__('Is Show In Front?')}}</label><br/>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_show_in_front" value="1" {{isset($record->is_show_in_front) && $record->is_show_in_front == '1' ? 'checked' : ''}}>
                                        <span class="form-check-label">
                                            {{__('Yes')}}
                                        </span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_show_in_front" value="0" {{isset($record->is_show_in_front) && $record->is_show_in_front == '1' ? '' : 'checked'}}>
                                        <span class="form-check-label">
                                            {{__('No')}}
                                        </span>
                                    </label>
                                    @if ($errors->has('meta_keyword')) <div class="text-danger">{{ $errors->first('meta_keyword') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="minimum_deposit_amount">{{__('Minimum Deposit Amount')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="minimum_deposit_amount" name="minimum_deposit_amount" placeholder="{{__('Minimum Deposit Amount')}}" maxlength="12" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->minimum_deposit_amount) ? $record->minimum_deposit_amount : old('minimum_deposit_amount') }}">
                                    @if ($errors->has('minimum_deposit_amount')) <div class="text-danger">{{ $errors->first('minimum_deposit_amount') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="year_founded">{{__('Year Founded')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control num_only" id="year_founded" name="year_founded" placeholder="{{__('Year Founded')}}" maxlength="12" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->year_founded) ? $record->year_founded : old('year_founded') }}">
                                    @if ($errors->has('year_founded')) <div class="text-danger">{{ $errors->first('year_founded') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="trading_platforms">{{__('Trading Platforms')}}</label>
                                    <select class="select2 form-control" name='trading_platform[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($trading_platforms->count())
                                            @inject('items','App\Models\BrokerTradingPlatform') {{-- inject before foreach --}}
                                            @foreach($trading_platforms as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $record->id], ['trading_platform_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Licenses')}}</label>
                                    <select class="select2 form-control" name='license[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\BrokerLicense') {{-- inject before foreach --}}
                                            @foreach($licenses as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $record->id], ['license_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="deposit_options">{{__('Deposit Options')}}</label>
                                    <select class="select2 form-control" name='deposit_option[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($payment_options->count())
                                            @inject('items','App\Models\BrokerDepositOption') {{-- inject before foreach --}}
                                            @foreach($payment_options as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $record->id], ['payment_option_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="withdrawal_options">{{__('Withdrawal Options')}}</label>
                                    <select class="select2 form-control" name='withdrawal_option[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($payment_options->count())
                                            @inject('items','App\Models\BrokerWithdrawalOption') {{-- inject before foreach --}}
                                            @foreach($payment_options as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $record->id], ['payment_option_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="local_offices">{{__('Local Offices')}}</label>
                                    <select class="select2 form-control" name='local_office[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($countries->count())
                                            @inject('items','App\Models\BrokerLocalOffice') {{-- inject before foreach --}}
                                            @foreach($countries as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $record->id], ['country_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="trading_asset">{{__('Trading Assets')}}</label>
                                    <select class="select2 form-control" name='trading_asset[]' multiple="">
                                        <!-- <option value="">{{__('-- select --')}}</option> -->
                                        @if($trading_assets->count())
                                            @inject('items','App\Models\BrokerTradingAsset') {{-- inject before foreach --}}
                                            @foreach($trading_assets as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $record->id], ['trading_asset_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="min_spread">{{__('Min Spread')}}<span class="text-danger">*</span></label>
                                    <select name="min_spread" class="form-control" required=""  data-parsley-required-message="{{ __("This value is required.")}}">
                                        <option value="0.0" @if(isset($record->min_spread) && $record->min_spread == '0.0'){{'selected'}}@endif>{{__('0.0')}}</option>
                                        <option value="0.6" @if(isset($record->min_spread) && $record->min_spread == '0.6'){{'selected'}}@endif>{{__('0.6')}}</option>
                                        <option value="1.2" @if(isset($record->min_spread) && $record->min_spread == '1.2'){{'selected'}}@endif>{{__('1.2')}}</option>
                                    </select>
                                    @if ($errors->has('min_spread')) <div class="text-danger">{{ $errors->first('min_spread') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="max_leverage">{{__('Max Leverage')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="max_leverage" name="max_leverage" placeholder="{{__('Max Leverage')}}" maxlength="7" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->max_leverage) ? $record->max_leverage : old('max_leverage') }}">
                                    @if ($errors->has('max_leverage')) <div class="text-danger">{{ $errors->first('max_leverage') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="currency_pass">{{__('Currency Pass')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control num_only" id="currency_pass" name="currency_pass" placeholder="{{__('Currency Pass')}}" maxlength="3" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->currency_pass) ? $record->currency_pass : old('currency_pass') }}">
                                    @if ($errors->has('currency_pass')) <div class="text-danger">{{ $errors->first('currency_pass') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="customer_support">{{__('Customer Support')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="customer_support" name="customer_support" placeholder="{{__('Customer Support')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->customer_support) ? $record->customer_support : old('customer_support') }}">
                                    @if ($errors->has('customer_support')) <div class="text-danger">{{ $errors->first('customer_support') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="type_of_broker">{{__('Type Of Broker')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="type_of_broker" name="type_of_broker" placeholder="{{__('Type Of Broker')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->type_of_broker) ? $record->type_of_broker : old('type_of_broker') }}">
                                    @if ($errors->has('type_of_broker')) <div class="text-danger">{{ $errors->first('type_of_broker') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="trading_instruments">{{__('Trading Instruments')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="trading_instruments" name="trading_instruments" placeholder="{{__('Trading Instruments')}}" maxlength="7" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->trading_instruments) ? $record->trading_instruments : old('trading_instruments') }}">
                                    @if ($errors->has('trading_instruments')) <div class="text-danger">{{ $errors->first('trading_instruments') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="used_by">{{__('Used By')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="used_by" name="used_by" placeholder="{{__('Used By')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->used_by) ? $record->used_by : old('used_by') }}">
                                    @if ($errors->has('used_by')) <div class="text-danger">{{ $errors->first('used_by') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="scores">{{__('Scores')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="scores" name="scores" placeholder="{{__('Scores')}}" maxlength="5" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->scores) ? $record->scores : old('scores') }}">
                                    @if ($errors->has('scores')) <div class="text-danger">{{ $errors->first('scores') }}</div>@endif
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="url">{{__('Broker URL')}}<span class="text-danger">*</span></label>
                                    <input type="url" class="form-control" id="broker_url" name="broker_url" placeholder="{{__('Broker URL')}}" maxlength="300" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->broker_url) ? $record->broker_url : old('broker_url') }}" data-parsley-error-message="{{ __('This value should be a valid url.')}}">
                                    @if ($errors->has('broker_url')) <div class="text-danger">{{ $errors->first('broker_url') }}</div>@endif
                                </div>
                                <!-- <div class="col-12 mt-1"><h4>{{__('Bonus Details')}}</h4></div>
                                <div class="col-12"><hr/></div>

                                <div class="form-group col-md-3">
                                    <label for="bonus_amount">{{__('Bonus Amount')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="bonus_amount" name="bonus_amount" placeholder="{{__('Bonus Amount')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->bonus_amount) ? $record->bonus_amount : old('bonus_amount') }}">
                                    @if ($errors->has('bonus_amount')) <div class="text-danger">{{ $errors->first('bonus_amount') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="bonus_end_date">{{__('Bonus End Date')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="bonus_end_date" name="bonus_end_date" placeholder="{{__('Bonus End Date')}}"required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->bonus_end_date) && $record->bonus_end_date ? date('d-m-Y',strtotime($record->bonus_end_date)) : old('bonus_end_date') }}">
                                    @if ($errors->has('bonus_end_date')) <div class="text-danger">{{ $errors->first('bonus_end_date') }}</div>@endif
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="offer">{{__('Offer')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="offer" name="offer" placeholder="{{__('Offer')}}" maxlength="300" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->offer) ? $record->offer : old('offer') }}">
                                    @if ($errors->has('offer')) <div class="text-danger">{{ $errors->first('offer') }}</div>@endif
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="url">{{__('Bonus URL')}}<span class="text-danger">*</span></label>
                                    <input type="url" class="form-control" id="bonus_url" name="bonus_url" placeholder="{{__('Bonus URL')}}" maxlength="300" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->bonus_url) ? $record->bonus_url : old('bonus_url') }}" data-parsley-error-message="{{ __('This value should be a valid url.')}}">
                                    @if ($errors->has('bonus_url')) <div class="text-danger">{{ $errors->first('bonus_url') }}</div>@endif
                                </div> -->

                                <div class="col-12 mt-1"><h4>{{__('SEO Details')}}</h4></div>
                                <div class="col-12"><hr/></div>

                                <div class="form-group col-md-3">
                                    <label for="meta_title">{{__('Meta Title')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="meta_title" name="meta_title" placeholder="{{__('Meta Title')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->meta_title) ? $record->meta_title : old('meta_title') }}">
                                    @if ($errors->has('meta_title')) <div class="text-danger">{{ $errors->first('meta_title') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="meta_keyword">{{__('Meta Keyword')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="meta_keyword" name="meta_keyword" placeholder="{{__('Meta Keyword')}}"required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->meta_keyword) && $record->meta_keyword ? $record->meta_keyword : old('meta_keyword') }}">
                                    @if ($errors->has('meta_keyword')) <div class="text-danger">{{ $errors->first('meta_keyword') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="focus_keyphrase">{{__('Focus Keyphrase')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="focus_keyphrase" name="focus_keyphrase" placeholder="{{__('Focus Keyphrase')}}"required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->focus_keyphrase) && $record->focus_keyphrase ? $record->focus_keyphrase : old('focus_keyphrase') }}">
                                    @if ($errors->has('focus_keyphrase')) <div class="text-danger">{{ $errors->first('focus_keyphrase') }}</div>@endif
                                </div>

                                <div class="form-group col-md-12">
                                    <label for="meta_description">{{__('Meta Description')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="meta_description" name="meta_description" placeholder="{{__('Meta Description')}}"required=""  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->meta_description) && $record->meta_description ? $record->meta_description : old('meta_description') }}</textarea>
                                    @if ($errors->has('meta_description')) <div class="text-danger">{{ $errors->first('meta_description') }}</div>@endif
                                </div>
                            </div>
                                
                            <button type="submit" class="btn btn-primary">{{__('Submit')}}</button>
                            <a href="{{route('admin_brokers')}}" class="btn btn-danger">{{__('Cancel')}}</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<meta name="csrf-token" content="{{ csrf_token() }}" />
@endsection
@section('javascript')
    <script src="{{ asset('plugins/parsley/parsley.js') }}"></script>
    <script src="{{asset('public/plugins/ckeditor/ckeditor.js')}}"  type="text/javascript"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.select2').select2({placeholder: "{{__('--select--')}}"});
            CKEDITOR.replace('description', {
                height:1000,
                removePlugins : 'resize',
                filebrowserBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=files") ?>',
                filebrowserImageBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=images") ?>',
                filebrowserFlashBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=flash") ?>',
                filebrowserUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=files") ?>',
                filebrowserImageUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=images") ?>',
                filebrowserFlashUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=flash") ?>',
            });

            CKEDITOR.on('instanceReady', function () {
                $('#description').attr('required', '');

                $.each(CKEDITOR.instances, function (instance) {
                    CKEDITOR.instances[instance].on("change", function (e) {
                        for (instance in CKEDITOR.instances) {
                            CKEDITOR.instances[instance].updateElement();
                            //$('form').parsley().validate();
                        }
                    });
                });
            });

            $("#bonus_end_date").daterangepicker({
                    singleDatePicker: true,
                    autoUpdateInput: true,
                    autoApply: true,
                    autoUpdateInput : true,
                    locale: {
                        format: 'DD-MM-YYYY'
                    }
            });
        });
    </script>
@endsection