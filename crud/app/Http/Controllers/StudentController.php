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
       $request->validate([
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
        return view('student.show',compact('student'));
    }
    public function edit(student $student)
    {
        return view('student.edit',compact('student'));
    }
    public function update(Request $request, student $student)
    {
        $request->validate([
           
       ]); 

       $student->update($request->all());
       return redirect()->route('student.index')
       ->with('success','Recorde updated successfully...!');
    }
    public function destroy(student $student)
    {
        $student->delete();
        return redirect()->route('student.index')
        ->with('success','Record deleted successfully..!');
    }
}
