<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BrokerDetail;
use App\Models\BrokerReviews;
use App\Models\TradingPlatform;
use App\Constant;

class BrokerController extends MainController
{
    public function list(request $request){
        $return_data = array();
        $return_data['settings'] = $this->data;
        $return_data['brokers'] = BrokerDetail::select('id', 'image', 'minimum_deposit_amount', 'broker_url', 'slug', 'min_spread', 'max_leverage', 'currency_pass', 'customer_support', 'type_of_broker', 'trading_instruments', 'used_by', 'scores')->where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->get();
        $return_data['trading_platforms'] = TradingPlatform::where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->get();
        $return_data['site_title'] = 'Brokers';
        return view('front/broker/list',array_merge($this->data,$return_data));
    }

    public function getBrokerDetail($slug = ''){
        $return_data = array();
        $segment = request()->segment(1);
        $array = explode('-', $segment);
        $id = end($array);
        $id = $id;
        if($id){
            $detail = BrokerDetail::where([['id', $id]])->first();
            $return_data['settings'] = $this->data;
            $return_data['detail'] = $detail;
            $return_data['site_title'] = isset($detail->name) ? $detail->name : 'Broker';
            $return_data['reviews'] = BrokerReviews::where([['broker_id', $id]])->get();
            return view('front/broker/detail',array_merge($this->data,$return_data));
        } else {
            return redirect('/');
        }    
    }

    public function reviewStore(request $request){
        $breview = new BrokerReviews();
        $fields = array('name', 'email', 'comment', 'broker_id');
        foreach($fields as $key => $value){
            $breview->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        $breview->review = $request->star ? $request->star : 0;
        $breview->save();
        if($breview->id){
            return redirect()->back()->with('success', trans('Review Added Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
}