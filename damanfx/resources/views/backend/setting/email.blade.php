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
            <div class="col-12 col-md-3 col-xl-3">
                <div class="card">
                    <div class="card-header">

                    </div>
                    <div class="list-group list-group-flush" role="tablist">
                        @if($email_templates)
                            @foreach($email_templates as $key => $value)
                                <a href="#{{$value->label}}" data-toggle="list" class="list-group-item list-group-item-action {{ $key == '0' ? 'active' : ''}}"  role="tab">{{$value->value}}</a>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-9 col-xl-9">
                <div class="tab-content">
                    @if($email_templates)
                        @foreach($email_templates as $key => $value)
                            <div class="tab-pane fade {{ $key == 0 ? 'active show' : ''}}" id="{{$value->label}}" role="tabpanel">
                                <div class="card">
                                    <form role="form" action="{{route('admin_email-templates')}}"  name="{{$value->label}}" method="post" data-parsley-validate enctype="multipart/form-data">
                                        @csrf
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <h2 class="col-form-label">{{$value->value}}</h2>
                                                <textarea class="form-control ckeditor" name="{{$value->label}}" id="{{$value->label}}" required="" style="height: 1000px">{{$value->template}}</textarea>
                                                <input type="hidden" name="id" value="{{$value->label}}">
                                            </div>
                                        </div>
                                        <div class="card-footer text-end">
                                            <button type="submit" class="btn btn-primary">{{__('Update')}}</button>
                                        </div>
                                    </form>
                                </div>
                            </div><!-- /.tab-pane -->
                        @endforeach
                    @endif
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
            var editor = CKEDITOR.replaceAll( '.ckeditor', {
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
//                $('.ckeditor').attr('required', '');

                $.each(CKEDITOR.instances, function (instance) {
//                    instance.editor.resize("100%", '1000');
                    CKEDITOR.instances[instance].on("change", function (e) {
                        e.editor.resize("100%", '1000');
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