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

                        <form method="POST" action="@if(isset($record)){{ route('admin_news-update', array('id' => Crypt::encrypt($record->id))) }}@else{{route('admin_news-store')}}@endif" id="news-form" enctype="multipart/form-data" data-parsley-validate="">

                            <input type="hidden" name="id" value="{{ isset($record->id) ? Crypt::encrypt($record->id) : '' }}">

                            {{ csrf_field() }}

                            <div class="form-row">

                                <div class="form-group col-md-6">

                                    <label for="name">{{__('Title')}}<span class="text-danger">*</span></label>

                                    <input type="text" class="form-control" id="title" name="title" placeholder="{{__('Title')}}" maxlength="20" required="" data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->title) ? $record->title : old('title') }}">

                                    @if ($errors->has('name')) <div class="text-danger">{{ $errors->first('title') }}</div>@endif

                                </div>

                                <div class="col-md-4">

                                    <div class="form-group">

                                        <label for="name">{{__('Image')}}<span class="text-danger">*</span></label>

                                        <div class="profile-icon">

                                            @php($i = 0)

                                            @if(isset($record->image))

                                                @if($record->image !='')

                                                    @php($required = '')

                                                    <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/news/'.$record->image)}}"  alt=''>

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

                                <div class="form-group col-md-6">

                                    <label for="name">{{__('Author Name')}}<span class="text-danger">*</span></label>

                                    <input type="text" class="form-control" id="author_name" name="author_name" placeholder="{{__('Author Name')}}" maxlength="20" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->author_name) ? $record->author_name : old('author_name') }}">

                                    @if ($errors->has('author_name')) <div class="text-danger">{{ $errors->first('author_name') }}</div>@endif

                                </div>

                                <div class="col-md-4">

                                    <div class="form-group">

                                        <label for="name">{{__('Author Image')}}<span class="text-danger">*</span></label>

                                        <div class="profile-icon">

                                            @php($i = $i+1)

                                            @if(isset($record->author_image))

                                                @if($record->author_image !='')

                                                    @php($required = '')

                                                    <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/news/'.$record->author_image)}}"  alt=''>

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

                                            <input type="file" id="uploadImage{{$i}}" accept="image/x-png, image/gif, image/jpeg" class="btn btn-warning btn-block btn-sm"  name="author_image" {{$required}} data-parsley-required-message="{{ __("This value is required.")}}" onChange="this.parentNode.nextSibling.value = this.value; PreviewImage({{$i}});" >

                                            @if ($errors->has('author_image')) <div class="errors_msg">{{ $errors->first('author_image') }}</div>@endif

                                        </div>

                                    </div>

                                </div>

                                <div class="form-group col-md-12">

                                    <label for="description">{{__('Description')}}<span class="text-danger">*</span></label>

                                    <textarea class="form-control" id="description" name="description" placeholder="{{__('Description')}}"  data-parsley-required-message="{{ __("This value is required.")}}">{{ isset($record->description) ? $record->description : old('description') }}</textarea>

                                    @if ($errors->has('description')) <div class="text-danger">{{ $errors->first('description') }}</div>@endif

                                </div>

                            </div>

                            <div class="form-row">

                                <div class="form-group col-md-6">

                                    <label for="meta_keyword">{{__('Meta Keyword')}}</label>

                                    <input type="text" class="form-control" id="meta_keyword" name="meta_keyword" placeholder="{{__('Meta Keyword')}}" value="{{ isset($record->meta_keyword) ? $record->meta_keyword : old('meta_keyword') }}">

                                    @if ($errors->has('meta_keyword')) <div class="text-danger">{{ $errors->first('meta_keyword') }}</div>@endif

                                </div>

                                <div class="form-group col-md-6">

                                    <label for="meta_description">{{__('Meta Description')}}</label>

                                    <input type="text" class="form-control" id="meta_description" name="meta_description" placeholder="{{__('Meta Description')}}" value="{{ isset($record->meta_description) ? $record->meta_description : old('meta_description') }}">

                                    @if ($errors->has('meta_description')) <div class="text-danger">{{ $errors->first('meta_description') }}</div>@endif

                                </div>

                            </div>

                                

                            <button type="submit" class="btn btn-primary">{{__('Submit')}}</button>

                            <a href="{{route('admin_news')}}" class="btn btn-danger">{{__('Cancel')}}</a>

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