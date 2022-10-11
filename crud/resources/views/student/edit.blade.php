@extends('student.layout')

@section('content')

<div class="row">
   <div class="col-lg-12 margin-tb">
        <div class="pull-right">
        <a class="btn btn-primary" href="{{route('student.index')}}">Back</a>
        </div>
    </div>

</div>
@if($errors->any())
<div class="alert alert-danger">
<stong>Whoops!</stong>There were some problems with your input.<br><br>

<ul>
@foreach($errors->all() as $error)
<li>{{$error}}</li>
@endforeach
</ul>
</div>
@endif
<form action="{{route('student.update','$value->id' )}}" method="POST">
@csrf
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>StudentName:</strong>
        <input type="text" name="name" value="{{$value->name}}" class="form-control" placeholder="Name">
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>Course:</strong>
        <input type="text" name="course" value="{{$value->course}}" class="form-control" placeholder="course">
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>Fee:</strong>
        <input type="text" name="fee" value="{{$value->fee}}"class="form-control" placeholder="fee">
        </div>
    </div>
</div>
</form>
@endsection