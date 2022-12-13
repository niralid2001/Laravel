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
                        <form method="POST" action="@if(isset($record)){{ route('admin_company-update', array('id' => Crypt::encrypt($record->id))) }}@else{{route('admin_company-store')}}@endif" id="news-form" enctype="multipart/form-data" data-parsley-validate="">
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
                                        <label for="name">{{__('Image')}} <span class="text-danger">*</span></label>
                                        <div class="profile-icon">
                                            @php($i = 0)
                                            @if(isset($record->image))
                                                @if($record->image !='')
                                                    @php($required = '')
                                                    <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/company/'.$record->image)}}"  alt=''>
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
                                    <label for="description">{{__('Description')}}</label>
                                    <textarea class="form-control" id="description" name="description" placeholder="{{__('Description')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->description) ? $record->description : old('description') }}</textarea>
                                    @if ($errors->has('description')) <div class="text-danger">{{ $errors->first('description') }}</div>@endif
                                </div>
                                <div class="form-group col-md-4">
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
                                <div class="form-group col-md-4">
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
                                <div class="form-group col-md-4">
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
                                    <label for="minimum_deposit_amount">{{__('Minimum Deposit Amount')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="minimum_deposit_amount" name="minimum_deposit_amount" placeholder="{{__('Minimum Deposit Amount')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->minimum_deposit_amount) ? $record->minimum_deposit_amount : old('minimum_deposit_amount') }}">
                                    @if ($errors->has('minimum_deposit_amount')) <div class="text-danger">{{ $errors->first('minimum_deposit_amount') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="year_founded">{{__('Year Founded')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control num_only" id="year_founded" name="year_founded" placeholder="{{__('Year Founded')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->year_founded) ? $record->year_founded : old('year_founded') }}">
                                    @if ($errors->has('year_founded')) <div class="text-danger">{{ $errors->first('year_founded') }}</div>@endif
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="trading_platforms">{{__('Trading Platforms')}}</label>
                                    <select class="select2 form-control" name='trading_platform[]' multiple="">
                                        <option value="">{{__('-- select --')}}</option>
                                        @if($trading_platforms->count())
                                            @inject('items','App\Models\CompanyTradingPlatform') {{-- inject before foreach --}}
                                            @foreach($trading_platforms as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['company_id', $record->id], ['trading_platform_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Licenses')}}</label>
                                    <select class="select2 form-control" name='license[]' multiple="">
                                        <option value="">{{__('-- select --')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\CompanyLicense') {{-- inject before foreach --}}
                                            @foreach($licenses as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['company_id', $record->id], ['license_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="deposit_options">{{__('Deposit Options')}}</label>
                                    <select class="select2 form-control" name='deposit_option[]' multiple="">
                                        <option value="">{{__('-- select --')}}</option>
                                        @if($payment_options->count())
                                            @inject('items','App\Models\CompanyDepositOption') {{-- inject before foreach --}}
                                            @foreach($payment_options as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['company_id', $record->id], ['payment_option_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="withdrawal_options">{{__('Withdrawal Options')}}</label>
                                    <select class="select2 form-control" name='withdrawal_option[]' multiple="">
                                        <option value="">{{__('-- select --')}}</option>
                                        @if($payment_options->count())
                                            @inject('items','App\Models\CompanyWithdrawalOption') {{-- inject before foreach --}}
                                            @foreach($payment_options as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['company_id', $record->id], ['payment_option_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="local_offices">{{__('Local Offices')}}</label>
                                    <select class="select2 form-control" name='local_office[]' multiple="">
                                        <option value="">{{__('-- select --')}}</option>
                                        @if($countries->count())
                                            @inject('items','App\Models\CompanyLocalOffice') {{-- inject before foreach --}}
                                            @foreach($countries as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['company_id', $record->id], ['country_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="trading_asset">{{__('Trading Assets')}}</label>
                                    <select class="select2 form-control" name='trading_asset[]' multiple="">
                                        <option value="">{{__('-- select --')}}</option>
                                        @if($trading_assets->count())
                                            @inject('items','App\Models\CompanyTradingAsset') {{-- inject before foreach --}}
                                            @foreach($trading_assets as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['company_id', $record->id], ['trading_asset_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                                
                            <button type="submit" class="btn btn-primary">{{__('Submit')}}</button>
                            <a href="{{route('admin_companies')}}" class="btn btn-danger">{{__('Cancel')}}</a>
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
    <script>
        $(document).ready(function(){
            $('.select2').select2({});
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
        });
    </script>
@endsection