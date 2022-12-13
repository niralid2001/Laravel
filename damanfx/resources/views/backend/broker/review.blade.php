@extends('backend.layout.main')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('public/plugins/sweetalert/sweetalert.css')}}">
    <link class="js-stylesheet" href="{{ asset('plugins/select2/css/select2.min.css') }}" rel="stylesheet">
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
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="review" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>{{__('Id')}}</th>
                                    <th>{{__('Name')}}</th>
                                    <th>{{__('Email')}}</th>
                                    <th>{{__('Comment')}}</th>
                                    <th>{{__('Review')}}</th>
                                    <th>{{__('Reviewed At')}}</th>
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
    <script src="{{ asset('plugins/select2/js/select2.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            var page = $("#review").DataTable({
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
                        {data: 'name', name: 'name'},
                        {data: 'email', name: 'email'},
                        {data: 'comment', name: 'comment'},
                        {data: 'review', name: 'review'},
                        {data: 'reviewed_at', name: 'reviewed_at'}
                    ],
                    "ajax" : {
                        url : "{{ route('admin_broker-review-datatable') }}",
                        type : "POST",
                        data : function(d) {
                            d._token = "{{ csrf_token() }}",
                            d.broker_id = "{{$broker_id}}"
                        }
                    }
            });
        });
    </script>
@endsection