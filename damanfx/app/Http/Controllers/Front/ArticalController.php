<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Artical;
use App\Models\BrokerDetail;
use App\Models\TradeUsers;
use App\Models\BrokerReviews;
use App\Models\Advertisements;
use App\Constant;

class ArticalController extends MainController
{
    public function detail($slug = '')
    {
        $return_data = array();
        $segment = request()->segment(1);
        $array = explode('-', $segment);
        $id = end($array);
        $id = $id;
        if($id){
            $detail = Artical::where([['id', $id]])->first();
            $return_data['settings'] = $this->data;
            $return_data['detail'] = $detail;
            $return_data['site_title'] = isset($detail->title) ? $detail->title : 'Bonus';

            $brokers = BrokerDetail::select('id', 'slug', 'minimum_deposit_amount', 'max_leverage', 'image', 'broker_url')->where([['is_archive', Constant::NOT_ARCHIVE], ['is_show_in_front', '1']])->orderBy('id', 'desc')->limit('3')->get();
            $return_data['brokers'] = $brokers;

            $reviews = BrokerReviews::select('id', 'broker_id', 'comment')->orderBy('id', 'desc')->limit(3)->get();
            $return_data['reviews'] = $reviews;

            $return_data['ad_detail'] = Advertisements::select('image', 'add_url')->where([['id', '=', 1]])->first();
            return view('front/artical/detail',array_merge($this->data,$return_data));
        } else {
            return redirect('/');
        }    
    }
}