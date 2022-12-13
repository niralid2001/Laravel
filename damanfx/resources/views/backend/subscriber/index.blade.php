@extends('backend.layout.main')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('public/plugins/sweetalert/sweetalert.css')}}">
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
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="form-row">
                            <h4>{{__('List')}}</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="subscriber" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>{{__('Id')}}</th>
                                    <th>{{__('Email')}}</th>
                                    <th>{{__('Action')}}</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<meta name="csrf-token" content="{{ csrf_token() }}" />
@endsection
@section('javascript')
    <script src="{{asset('plugins/sweetalert/sweetalert.js')}}" type="text/javascript"></script>
    <script>
        $(document).ready(function() {
            var page = $("#subscriber").DataTable({
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
                        {data: 'email', name: 'email'},
                        {data: 'action', name: 'action', orderable: false, searchable: false},
                    ],
                    "ajax" : {
                        url : "{{ route('admin_subscriber-datatable') }}",
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
                    text: "{{__('Are you sure? Delete this subscriber!')}}",
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