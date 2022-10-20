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
<form action="{{route('student.update',$student->id)}}" method="POST">
@csrf
@method("PATCH")
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>StudentName:</strong>
        <input type="text" name="name" value="{{$student->name}}" class="form-control" placeholder="Name">
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>Course:</strong>
        <input type="text" name="course" value="{{$student->course}}" class="form-control" placeholder="course">
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>Fee:</strong>
        <input type="text" name="fee" value="{{$student->fee}}" class="form-control" placeholder="fee"><br>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
        <strong>Images</strong>
        <input type="file" name="file" value="{{$student->image_path}}" class="form-control"><br>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 text-center">
        <button type="submit" class="btn btn-primary" >Submit</button>
    </div>
</div>
</form>
@endsection