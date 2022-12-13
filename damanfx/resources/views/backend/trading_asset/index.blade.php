@extends('backend.layout.main')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('public/plugins/sweetalert/sweetalert.css')}}">
    <link class="js-stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}" rel="stylesheet">
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
        <h1 class="h3 mb-3">{{$site_title}}</h1>
        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <div class="form-row">
                            <h4>{{__('List')}}</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="tplatforms" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>{{__('Id')}}</th>
                                    <th>{{__('Icon')}}</th>
                                    <th>{{__('Name')}}</th>
                                    <th>{{__('Action')}}</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        @if(isset($record->id))
                            <h4>{{__('Edit')}}</h4>
                        @else
                            <h4>{{__('Add')}}</h4>
                        @endif
                    </div>
                    <div class="card-body">
                        <form method="POST" action="@if(isset($record)){{ route('admin_trading-asset-update', array('id' => Crypt::encrypt($record->id))) }}@else{{route('admin_trading-asset-store')}}@endif" id="trading-asset-form" enctype="multipart/form-data" data-parsley-validate="">
                            <input type="hidden" name="id" value="{{ isset($pages->id) ? Crypt::encrypt($pages->id) : '' }}">
                            {{ csrf_field() }}
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="name">{{__('Name')}}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="{{__('Name')}}" maxlength="30" required="" data-parsley-required-message="{{ __("This value is required.")}}" value="{{ isset($record->name) ? $record->name : old('name') }}">
                                    @if ($errors->has('name')) <div class="text-danger">{{ $errors->first('name') }}</div>@endif
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="name">{{__('Icon')}} <span class="text-danger">*</span></label>
                                        <div class="profile-icon">
                                            @php($i = 0)
                                            @if(isset($record->image))
                                                @if($record->image !='')
                                                    @php($required = '')
                                                    <img class='img-responsive previewImage img-fluid' id="uploadPreview{{$i}}" src="{{url('public/uploads/trading_asset/'.$record->image)}}"  alt=''>
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
                            </div>
                            <button type="submit" class="btn btn-primary">{{__('Submit')}}</button>
                            <a href="{{route('admin_trading-assets')}}" class="btn btn-danger">{{__('Cancel')}}</a>
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
    <script src="{{asset('plugins/sweetalert/sweetalert.js')}}" type="text/javascript"></script>
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            var page = $("#tplatforms").DataTable({
                    "language": {
                        "url": "{{__('Datatable Language')}}",
                    },
                    "order": [], //Initial no order.
                    "aaSorting": [],
                    processing: true,
                    serverSide: true,
                    "pageLength": 100,
                    "lengthMenu": [[50, 100, 200, 400], [50, 100, 200, 400]],
                    "columns": [
                        {data: 'id', name: 'id'},
                        {data: 'icon', name: 'icon'},
                        {data: 'name', name: 'name'},
                        {data: 'action', name: 'action', orderable: false, searchable: false},
                    ],
                    "ajax" : {
                        url : "{{ route('admin_trading-asset-datatable') }}",
                        type : "POST",
                        data : function(d) {
                            d._token = "{{ csrf_token() }}"
                        }
                    }
            });

            $(document).on('click', '.delete', function() {
                var href = $(this).data('href');
                swal({
                    title: "",
                    text: "{{__('Are you sure? Delete this trading asset!')}}",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "{{__('Yes, delete it!')}}",
                    cancelButtonText: "{{__('Cancel')}}",
                    closeOnConfirm: true
                },
                function(){
                    location.href = href;
                });
            });
        });
    </script>
@endsection