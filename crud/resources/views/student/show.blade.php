@extends('student.layout')
@section('content')
<div class="card">
  <div class="card-header bg-info">show</div>
  <div class="card-body">
  
        <div class="card-body bg-warning">
        <!-- <h5 class="card-title">id : {{ $student->id }}</h5> -->
        <h5 class="card-title">Name : {{ $student->name }}</h5>
        <p class="card-text">course : {{ $student->course }}</p>
        <p class="card-text">fee : {{ $student->fee }}</p>
  </div>
      
    </hr>
  
  </div>
</div>