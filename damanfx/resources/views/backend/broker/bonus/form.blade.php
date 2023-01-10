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
                        <form method="POST" action="@if(isset($record)){{ route('admin_bonus-update', array('id' => Crypt::encrypt($record->id))) }}@else{{route('admin_bonus-store')}}@endif" id="news-form" enctype="multipart/form-data" data-parsley-validate="">
                            <input type="hidden" name="id" value="{{ isset($record->id) ? Crypt::encrypt($record->id) : '' }}">
                            {{ csrf_field() }}
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="bonus_amount">{{__('Title')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title" placeholder="{{__('Title')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->title) ? $record->title : old('title') }}">
                                    @if ($errors->has('title')) <div class="text-danger">{{ $errors->first('title') }}</div>@endif
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">{{__('Image')}}<span class="text-danger">*</span></label>
                                        <div class="profile-icon">
                                            @php($i = 0)
                                            @if(isset($record->image))
                                                @if($record->image !='')
                                                    @php($required = '')
                                                    <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/bonus/'.$record->image)}}"  alt=''>
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
                                    <label for="description">{{__('Description')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="description" name="description" placeholder="{{__('Description')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->description) ? $record->description : old('description') }}</textarea>
                                    @if ($errors->has('description')) <div class="text-danger">{{ $errors->first('description') }}</div>@endif
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="bonus_end_date">{{__('Bonus End Date')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="bonus_end_date" name="end_date" placeholder="{{__('Bonus End Date')}}"required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->end_date) && $record->end_date ? date('d-m-Y',strtotime($record->end_date)) : old('end_date') }}">
                                    @if ($errors->has('end_date')) <div class="text-danger">{{ $errors->first('end_date') }}</div>@endif
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="bonus_amount">{{__('Amount')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="amount" name="amount" placeholder="{{__('Amount')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->amount) ? $record->amount : old('amount') }}">
                                    @if ($errors->has('amount')) <div class="text-danger">{{ $errors->first('amount') }}</div>@endif
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="offer">{{__('Offer Available For')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="available_for" name="available_for" placeholder="{{__('Offer Available For')}}" maxlength="300" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->available_for) ? $record->available_for : old('available_for') }}">
                                    @if ($errors->has('offer')) <div class="text-danger">{{ $errors->first('available_for') }}</div>@endif
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <label for="url">{{__('Bonus URL')}}<span class="text-danger">*</span></label>
                                    <input type="url" class="form-control" id="bonus_url" name="bonus_url" placeholder="{{__('Bonus URL')}}" maxlength="300" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->bonus_url) ? $record->bonus_url : old('bonus_url') }}" data-parsley-error-message="{{ __('This value should be a valid url.')}}">
                                    @if ($errors->has('bonus_url')) <div class="text-danger">{{ $errors->first('bonus_url') }}</div>@endif
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="broker_bonus">{{__('Brokers')}}</label>
                                                                      
                                     <select class="select2 form-control" name='broker_id[]' multiple="" >
                                        <!-- <option value="0">{{__('--select--')}}</option> -->
                                        @if($brokerDetail->count())
                                            @inject('items','App\Models\BrokerBonus') {{-- inject before foreach --}}
                                            @foreach($brokerDetail as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['broker_id', $value->id], ['bonus_id', $record->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                                
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="how_to_apply">{{__('How To Apply')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="how_to_apply" name="how_to_apply" placeholder="{{__('How To Apply')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->how_to_apply) ? $record->how_to_apply : old('how_to_apply') }}</textarea>
                                    @if ($errors->has('how_to_apply')) <div class="text-danger">{{ $errors->first('how_to_apply') }}</div>@endif
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="withdrawal">{{__('Withdrawal')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="withdrawal" name="withdrawal" placeholder="{{__('Withdrawal')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->withdrawal) ? $record->withdrawal : old('withdrawal') }}</textarea>
                                    @if ($errors->has('withdrawal')) <div class="text-danger">{{ $errors->first('withdrawal') }}</div>@endif
                                </div>

                                <div class="col-md-12">
                                    <hr/>
                                    <h6>{{__('Promotion Details')}}</h6>
                                    <hr/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="bonus_amount">{{__('Max Leverage')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control numeric" id="max_leverage" name="max_leverage" placeholder="{{__('Max Leverage')}}" maxlength="100" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->max_leverage) ? $record->max_leverage : old('max_leverage') }}">
                                    @if ($errors->has('max_leverage')) <div class="text-danger">{{ $errors->first('max_leverage') }}</div>@endif
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Regulated By')}}</label>
                                    <select class="select2 form-control" name='license[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\BonusLicenses') {{-- inject before foreach --}}
                                            @foreach($licenses as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['bonus_id', $record->id], ['license_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="trading_platforms">{{__('Trading Platforms')}}</label>
                                    <select class="select2 form-control" name='trading_platform[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($trading_platforms->count())
                                            @inject('items','App\Models\BonusTradingPlatforms') {{-- inject before foreach --}}
                                            @foreach($trading_platforms as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['bonus_id', $record->id], ['trading_platform_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Bonus Type')}}</label>
                                    <select class="select2 form-control" name='bonus_type[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\BonusTypeOptions') {{-- inject before foreach --}}
                                            @foreach($bonus_types as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['bonus_id', $record->id], ['bonus_type_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Account Type')}}</label>
                                    <select class="select2 form-control" name='account_type[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\BonusAccountTypeOptions') {{-- inject before foreach --}}
                                            @foreach($account_types as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['bonus_id', $record->id], ['account_type_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Deposit Methods')}}</label>
                                    <select class="select2 form-control" name='deposit_option[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\BonusDepositOptions') {{-- inject before foreach --}}
                                            @foreach($payment_options as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['bonus_id', $record->id], ['payment_option_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="licenses">{{__('Withdrawal Methods')}}</label>
                                    <select class="select2 form-control" name='withdrawal_option[]' multiple="">
                                        <option value="">{{__('--select--')}}</option>
                                        @if($licenses->count())
                                            @inject('items','App\Models\BonusWithdrawalOptions') {{-- inject before foreach --}}
                                            @foreach($payment_options as $value)
                                                @if(isset($record->id))
                                                    @php($result = $items->where([['bonus_id', $record->id], ['payment_option_id', $value->id]])->exists())
                                                @endif
                                                <option value="{{$value->id}}" @if(isset($result) && $result){{'selected'}}@endif>{{$value->name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="verification">{{__('Verification')}}</label><br/>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="verification" value="0" {{isset($record->verification) && $record->verification == '1' ? '' : 'checked'}}>
                                        <span class="form-check-label">
                                            {{__('Yes')}}
                                        </span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="verification" value="1" {{isset($record->verification) && $record->verification == '1' ? 'checked' : ''}}>
                                        <span class="form-check-label">
                                            {{__('No')}}
                                        </span>
                                    </label>
                                </div>
                            </div>
                                
                            <button type="submit" class="btn btn-primary">{{__('Submit')}}</button>
                            <a href="{{route('admin_bonus')}}" class="btn btn-danger">{{__('Cancel')}}</a>
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
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="{{asset('public/plugins/ckeditor/ckeditor.js')}}"  type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            $('.select2').select2({placeholder: "{{__('--select--')}}"});

            CKEDITOR.replace('description', {
                height:300,
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
                            .instances[instance].updateElement();
                            //$('form').parsley().validate();
                        }
                    });
                });
            });

            CKEDITOR.replace('withdrawal', {
                height:300,
                removePlugins : 'resize',
                filebrowserBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=files") ?>',
                filebrowserImageBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=images") ?>',
                filebrowserFlashBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=flash") ?>',
                filebrowserUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=files") ?>',
                filebrowserImageUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=images") ?>',
                filebrowserFlashUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=flash") ?>',
            });

            CKEDITOR.on('instanceReady', function () {
                $('#withdrawal').attr('required', '');

                $.each(CKEDITOR.instances, function (instance) {
                    CKEDITOR.instances[instance].on("change", function (e) {
                        for (instance in CKEDITOR.instances) {
                            CKEDITOR.instances[instance].updateElement();
                            //$('form').parsley().validate();
                        }
                    });
                });
            });

            CKEDITOR.replace('how_to_apply', {
                height:300,
                removePlugins : 'resize',
                filebrowserBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=files") ?>',
                filebrowserImageBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=images") ?>',
                filebrowserFlashBrowseUrl : '<?php echo url("public/plugins/kcfinder/browse.php?opener=ckeditor&type=flash") ?>',
                filebrowserUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=files") ?>',
                filebrowserImageUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=images") ?>',
                filebrowserFlashUploadUrl : '<?php echo url("public/plugins/kcfinder/upload.php?opener=ckeditor&type=flash") ?>',
            });

            CKEDITOR.on('instanceReady', function () {
                $('#how_to_apply').attr('required', '');

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