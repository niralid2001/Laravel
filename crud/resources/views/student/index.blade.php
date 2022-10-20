@extends('student.layout')
@section('content')
<div class="pull-left">
    <h2>Student Crud</h2>
</div>

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-right">
        <a class="btn btn-success" href="{{route('student.create')}}">Create Student</a>
        </div>
    </div>
</div>
@if($message = Session::get('success'))
<div class="alert alert-success">
<p>{{$message}}</p>
</div>
@endif

<table class="table table-bordered">
<tr>
    <th>Id</th>
    <th>Name</th>
    <th>Course</th>
    <th>Fee</th>
    <th>image</th>
    <th width="280px">Action</th>
</tr>

@foreach($student as $value)
<tr>
    <td>{{++$i}}</td>
    <td>{{$value->name}}</td>
    <td>{{$value->course}}</</td>
    <td>{{$value->fee}}</</td>
    <td>{{$value->image_path}}</</td>
    <td>
    <form action="{{route('student.destroy',$value->id)}}" method="POST">
        <a class="btn btn-info" href="{{route('student.show',$value->id)}}">SHOW</a>
        <a class="btn btn-primary" href="{{route('student.edit',$value->id)}}">EDIT</a>
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger">DELETE</button>
    </form>
    </td>
</tr>
@endforeach
</table>

@endsection
