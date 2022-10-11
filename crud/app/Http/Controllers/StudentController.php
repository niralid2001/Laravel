<?php

namespace App\Http\Controllers;

use App\Models\student;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    public function index()
    {
        $student = student::latest()->paginate(5);
        return view('student.index',compact('student'))
        ->with('i',(request()->input('page',1)-1)* 5);
    }

    public function create()
    {
        return view('student.create');
    }

    public function store(Request $request)
    {
       $request->validation([
           'name' => 'required',
           'course' => 'required',
           'fee' => 'required',
       ]);  
       student::create($request->all());
       return redirect()->route('student.index')
       ->with('success','Recorde inserted successfully...!');
    }

    
    public function show(student $student)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\student  $student
     * @return \Illuminate\Http\Response
     */
    public function edit(student $student)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, student $student)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(student $student)
    {
        //
    }
}
