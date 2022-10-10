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
<div class="alert alert-succes">
<p>{{$message}}</p>
</div>
@endif

<table class="table table-bordered">
<tr>
    <th>NO</th>
    <th>Name</th>
    <th>Course</th>
    <th>Fee</th>
    <th width="280px">Action</th>
</tr>

@foreach($students as $student)
<tr>
    <td>{{++$i}}</td>
    <td>{{$student->name}}</td>
    <td>{{$student->course}}</</td>
    <td>{{$student->fee}}</</td>

    <form action="{{route('student.destroy',$student->id)}}" method="POST">
        <a class="btn btn-info" href="{{route('student.show',$student->id)}}">SHOW</a>
    </form>

</tr>
</table>

@endsection