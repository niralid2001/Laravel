<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\News;
use Auth;
use Session;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class NewsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('News');
        return view('backend.news.list', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $return_data = array();
        $return_data['site_title'] = trans('News Create');
        return view('backend.news.form',array_merge($this->data,$return_data));
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
        $news = new News();
        $fields = array('title', 'description', 'author_name', 'meta_keyword', 'meta_description');
        foreach($fields as $key => $value){
            $news->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $newName = fileUpload($request, 'image', 'uploads/news');
            $news->image = $newName;
        }
        if($request->hasFile('author_image')) {
            $newName = fileUpload($request, 'author_image', 'uploads/news');
            $news->author_image = $newName;
        }
        $news->slug = $slug ? $slug : NULL;
        $news->created_by = Auth::guard('admin')->user()->id;
        $news->save();

        if($news){
            return redirect('backend/news')->with('success', trans('News Added Successfully!'));
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
        $news = News::find($id);
        $return_data['record'] = $news;
        $return_data['site_title'] = trans('News Edit');
        return view('backend.news.form', array_merge($this->data, $return_data));
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
        $news = News::find($id);
        $fields = array('title', 'description', 'author_name', 'meta_keyword', 'meta_description');
        foreach($fields as $key => $value){
            $news->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $old_image = $news->image;
            if($old_image){
                removeFile('uploads/news/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/news');
            $news->image = $newName;
        }
        if($request->hasFile('author_image')) {
            $old_author_image = $news->author_image;
            if($old_author_image){
                removeFile('uploads/news/'.$old_author_image);
            }
            $newName = fileUpload($request, 'author_image', 'uploads/news');
            $news->author_image = $newName;
        }
        $news->slug = $slug ? $slug : NULL;
        $news->updated_by = Auth::guard('admin')->user()->id;
        $news->save();
        if($news) {
            return redirect('backend/news')->with('success', trans('News Updated Successfully!'));
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
        $news = News::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($news) {
            return redirect('backend/news')->with('success', trans('News Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function newsDatatable(request $request)
    {
        if($request->ajax()){
            $roles = Session::get('roles');
            $query = News::select('id', 'title', 'image', 'author_name')->where('is_archive', '=', 0)->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('image', function ($row) {
                    $image = "<img src='".url('uploads/news/'.$row->image)."' width='80px' height='80px'>";
                    return $image;
                })
                ->addColumn('action', function ($row) {
                    $roles = Session::get('roles');
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_news-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_news-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a>";
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
