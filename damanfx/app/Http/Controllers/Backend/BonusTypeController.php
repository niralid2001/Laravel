<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BonusType;
use Auth;
use Session;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class BonusTypeController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Bonus Types');
        return view('backend.bonus_type.index', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $return_data = array();
        $return_data['site_title'] = trans('Bonus Type');
        return view('backend.bonus_type.index',array_merge($this->data,$return_data));
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
                'name' => ['required',
                        Rule::unique('bonus_type')->where(function ($query) use($request) {
                            return $query->where([['is_archive', 0]]);
                        })
                    ]
                ],[
                  'required'  => trans('The :attribute field is required.'),
                  'unique'    => trans(':attribute is already used.')
                ]
        );
        $slug = $request->name != '' ? slugify($request->name) : NULL;
        $bonus_type = new BonusType();
        $bonus_type->slug = $slug;
        $bonus_type->name = $request->name;
        $bonus_type->created_by = Auth::guard('admin')->user()->id;

        if($request->hasFile('image')) {
            $newName = fileUpload($request, 'image', 'uploads/bonus_type');
            $bonus_type->image = $newName;
        }
        $bonus_type->save();
        if($bonus_type){
            return redirect('backend/bonus-types')->with('success', trans('Bonus Type Added Successfully!'));
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
        $record = BonusType::find($id);
        $return_data['record'] = $record;
        $return_data['site_title'] = trans('Bonus Type');
        return view('backend.bonus_type.index', array_merge($this->data, $return_data));
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
                'name' => ['required',
                    Rule::unique('bonus_type')->where(function ($query) use($id) {
                        return $query->where([['is_archive', 0],['id', '!=', $id]]);
                    })
                ]
            ],[
                'required'  => trans('The :attribute field is required.'),
                'unique'    => trans(':attribute is already used')
            ]
        );

        $slug = $request->name != '' ? slugify($request->name) : NULL;

        $bonus_type = BonusType::find($id);
        $bonus_type->slug = $slug;
        $bonus_type->name = $request->name;
        $bonus_type->updated_by = Auth::guard('admin')->user()->id;

        if($request->hasFile('image')) {
            $old_image = $bonus_type->image;
            if($old_image){
                removeFile('uploads/bonus_type/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/bonus_type');
            $bonus_type->image = $newName;
        }
        $bonus_type->save();
        if($bonus_type) {
            return redirect('backend/bonus-types')->with('success', trans('Bonus Type Updated Successfully!'));
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
        $bonus_type = BonusType::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($bonus_type) {
            return redirect('backend/bonus-types')->with('success', trans('Bonus Type Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function bonusTypeDatatable(request $request)
    {
        if($request->ajax()){
            $query = BonusType::select('id', 'name', 'image')->where('is_archive', '=', 0)->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('icon', function($row){
                    $icon = $row->image ? '<img src="'.url("uploads/bonus_type/".$row->image).'" width="50px" height="50px">' : '';
                    return $icon;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_bonus-type-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_bonus-type-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a>";
                    $html .= "</span>";
                    return $html;
                })
                ->rawColumns(['icon', 'action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }
}
