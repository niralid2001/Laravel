<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Advertisements;
use Auth;
use Session;
use DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class AdsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Ads');
        $return_data['record'] = Advertisements::find(1);
        return view('backend.ads.index', array_merge($this->data, $return_data));
    }

    public function update(request $request)
    {
        $ads = Advertisements::find(1);
        if($request->hasFile('image')) {
            $old_image = isset($ads->image) ? $ads->image : NULL;
            if($old_image){
                removeFile('uploads/ads/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/ads');
            $ads->image = $newName;
        }
        $ads->add_url = $request->add_url;
        $ads->updated_by = Auth::guard('admin')->user()->id;
        $ads->save();
        if($ads) {
            return redirect('backend/ads')->with('success', trans('Ad Updated Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
}
