@extends('backend.layout.main')
@section('css')
    <link class="js-stylesheet" href="{{ asset('plugins/parsley/parsley.css') }}" rel="stylesheet">
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
                        <form method="POST" action="@if(isset($record)){{ route('admin_broker-faq-update', array('id' => Crypt::encrypt($record->id))) }}@else{{route('admin_broker-faq-store')}}@endif" id="news-form" enctype="multipart/form-data" data-parsley-validate="">
                            <input type="hidden" name="id" value="{{ isset($record->id) ? Crypt::encrypt($record->id) : '' }}">
                            <input type="hidden" name="broker_id" value="{{ isset($broker_id) ? $broker_id : '' }}">
                            {{ csrf_field() }}
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="question">{{__('Question')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="question" name="question" placeholder="{{__('Question')}}" maxlength="200" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->question) ? $record->question : old('question') }}">
                                    @if ($errors->has('question')) <div class="text-danger">{{ $errors->first('question') }}</div>@endif
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="answer">{{__('Answer')}}<span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="answer" name="answer" placeholder="{{__('Answer')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->answer) ? $record->answer : old('answer') }}</textarea>
                                    @if ($errors->has('answer')) <div class="text-danger">{{ $errors->first('answer') }}</div>@endif
                                </div>
                            </div>
                                
                            <button type="submit" class="btn btn-primary">{{__('Submit')}}</button>
                            <a href="@if(isset($record)) {{route('admin_broker-faqs', array($record->broker_id))}} @else {{route('admin_broker-faqs', array($broker_id))}} @endif" class="btn btn-danger">{{__('Cancel')}}</a>
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
    <script>
        $(document).ready(function(){
            CKEDITOR.replace('answer', {
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
                $('#answer').attr('required', '');

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