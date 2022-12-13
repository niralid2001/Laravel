<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Artical;
use Auth;
use Session;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class ArticalController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Articles');
        return view('backend.artical.list', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $return_data = array();
        $return_data['site_title'] = trans('Artical Create');
        return view('backend.artical.form',array_merge($this->data,$return_data));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
                'title' => ['required'],
                'image' => ['required'],
                'description' => ['required'],
                'author_name' => ['required'],
                'author_image' => ['required'],
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->title != '' ? slugify($request->title) : NULL;
        $artical = new Artical();
        $fields = array('title', 'description', 'author_name', 'meta_keyword', 'meta_description');
        foreach($fields as $key => $value){
            $artical->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $newName = fileUpload($request, 'image', 'uploads/artical');
            $artical->image = $newName;
        }
        if($request->hasFile('author_image')) {
            $newName = fileUpload($request, 'author_image', 'uploads/artical');
            $artical->author_image = $newName;
        }
        $artical->slug = $slug ? $slug : NULL;
        $artical->created_by = Auth::guard('admin')->user()->id;
        $artical->save();

        if($artical){
            return redirect('backend/articals')->with('success', trans('Artical Added Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $id = Crypt::decrypt($id);
        $return_data = array();
        $artical = Artical::find($id);
        $return_data['record'] = $artical;
        $return_data['site_title'] = trans('Artical Edit');
        return view('backend.artical.form', array_merge($this->data, $return_data));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $id = Crypt::decrypt($id);
        $this->validate($request, [
                'title' => ['required'],
                'description' => ['required'],
                'author_name' => ['required']
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->title != '' ? slugify($request->title) : NULL;
        $artical = Artical::find($id);
        $fields = array('title', 'description', 'author_name', 'meta_keyword', 'meta_description');
        foreach($fields as $key => $value){
            $artical->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $old_image = $artical->image;
            if($old_image){
                removeFile('uploads/artical/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/artical');
            $artical->image = $newName;
        }
        if($request->hasFile('author_image')) {
            $old_author_image = $artical->author_image;
            if($old_author_image){
                removeFile('uploads/artical/'.$old_author_image);
            }
            $newName = fileUpload($request, 'author_image', 'uploads/artical');
            $artical->author_image = $newName;
        }
        $artical->slug = $slug ? $slug : NULL;
        $artical->updated_by = Auth::guard('admin')->user()->id;
        $artical->save();
        if($artical) {
            return redirect('backend/articals')->with('success', trans('Artical Updated Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $id = Crypt::decrypt($id);
        $artical = Artical::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($artical) {
            return redirect('backend/articals')->with('success', trans('Artical Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function articalDatatable(request $request)
    {
        if($request->ajax()){
            $roles = Session::get('roles');
            $query = Artical::select('id', 'title', 'image', 'author_name')->where('is_archive', '=', 0)->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('image', function ($row) {
                    $image = "<img src='".url('uploads/artical/'.$row->image)."' width='80px' height='80px'>";
                    return $image;
                })
                ->addColumn('action', function ($row) {
                    $roles = Session::get('roles');
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_artical-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_artical-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a>";
                    $html .= "</span>";
                    return $html;
                })
                ->rawColumns(['image','action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }
}
