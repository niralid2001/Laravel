@extends('backend.layout.main')
@section('css')
    <link class="js-stylesheet" href="{{ asset('plugins/parsley/parsley.css') }}" rel="stylesheet">
@endsection
@section('content')
<main class="content">
    <div class="container-fluid p-0">
        <div class="row">
            <div class="col-12">
                @if ($message = Session::get('success'))
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <div class="alert-message">
                        {{ $message }}
                    </div>
                </div>
                @endif
                @if ($message = Session::get('error'))
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <div class="alert-message">
                        {{ $message }}
                    </div>
                </div>
                @endif
            </div>
        </div>
        <div class="row mb-2 mb-xl-3">
            <div class="col-auto d-none d-sm-block">
                <h3>{{$site_title}}</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
<!--                    <div class="card-header">
                        <h5 class="card-title">Form</h5>
                        <h6 class="card-subtitle text-muted">Default Bootstrap form layout.</h6>
                    </div>-->
                    <div class="card-body">
                        <form method="post" action="{{route('admin_ads-update')}}" data-parsley-validate  enctype="multipart/form-data">
                            {{ csrf_field() }}
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="name">{{__('Image')}} <span class="text-danger">*</span></label>
                                            <div class="profile-icon">
                                                @php($i = 0)
                                                @if(isset($record->image))
                                                    @if($record->image !='')
                                                        @php($required = '')
                                                        <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/ads/'.$record->image)}}"  alt=''>
                                                    @else
                                                        @php($required = 'required')
                                                        <img class='img-responsive img-fluid' id="uploadPreview{{$i}}" src="{{url('public/no.jpg')}}"  alt=''>
                                                    @endif
                                                @else
                                                    @php($required = 'required')
                                                    <img class='img-responsive img-fluid' id="uploadPreview{{$i}}" src="{{url('public/no.jpg')}}"  alt=''>
                                                @endif
                                                <div class="m-b-10">
                                                    <input type="file" id="uploadImage{{$i}}" accept="image/x-png, image/gif, image/jpeg" class="btn btn-warning btn-block btn-sm"  name="image" {{$required}} data-parsley-required-message="{{ __("This value is required.")}}" onChange="this.parentNode.nextSibling.value = this.value; PreviewImage({{$i}});" >
                                                    @if ($errors->has('image')) <div class="errors_msg">{{ $errors->first('image') }}</div>@endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="name">{{__('URL')}} <span class="text-danger">*</span></label>
                                            <input type="url" class="form-control" id="url" name="add_url" placeholder="{{__('URL')}}" maxlength="300" required=""  data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->add_url) ? $record->add_url : old('add_url') }}" data-parsley-error-message="{{ __('This value should be a valid url.')}}">
                                        </div>
                                    </div>
                                </div>
                            <button type="submit" class="btn btn-primary">{{ __('Submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
@endsection
@section('javascript')
    <script src="{{ asset('plugins/parsley/parsley.js') }}"></script>
@endsection