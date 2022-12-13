<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bonus;
use App\Constant;

class BonusController extends MainController
{
    public function getBonusDetail($slug = '')
    {
        $return_data = array();
        $segment = request()->segment(1);
        $array = explode('-', $segment);
        $id = end($array);
        $id = $id;
        if($id){
            $detail = Bonus::where([['id', $id]])->first();
            $return_data['settings'] = $this->data;
            $return_data['detail'] = $detail;
            $return_data['site_title'] = isset($detail->title) ? $detail->title : 'Bonus';

            $return_data['other_bonus'] = Bonus::select('id', 'title', 'amount', 'end_date', 'slug')->where([['id', '!=', $id], ['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->get();
            return view('front/bonus/detail',array_merge($this->data,$return_data));
        } else {
            return redirect('/');
        }    
    }
}