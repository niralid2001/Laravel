<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BrokerDetail;
use App\Models\TradingPlatform;
use App\Models\Artical;
use App\Models\News;
use App\Models\Bonus;
use App\Models\Subscriber;
use App\Constant;

class HomeController extends MainController
{
    public function index()
    {
        $return_data = array();
        $return_data['settings'] = $this->data;
        $return_data['site_title'] = trans('Home');
        $return_data['brokers'] = BrokerDetail::select('id', 'image', 'minimum_deposit_amount', 'broker_url', 'slug', 'min_spread', 'max_leverage', 'currency_pass', 'customer_support', 'type_of_broker', 'trading_instruments', 'used_by', 'scores')->where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->limit('3')->get();
        $return_data['trading_platforms'] = TradingPlatform::where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->get();
        $return_data['articals'] = Artical::where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->limit('3')->get();
        $return_data['news'] = News::where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->limit('3')->get();
        $return_data['bonus_details'] = Bonus::select('id', 'title', 'bonus_url', 'description', 'image', 'slug', 'amount')->where([['is_archive', Constant::NOT_ARCHIVE]])->orderBy('id', 'desc')->limit('3')->get();
//        print_r($return_data);exit;
        return view('front/index',array_merge($this->data,$return_data));    
    }

    public function saveSubscriber(request $request){
        $subscriber = Subscriber::select('id')->where([['email', $request->email]])->first();
        $return = array();
        if(isset($subscriber->id)){
            $return['result'] = 'error';
        } else {
            $subscriber = new Subscriber();
            $subscriber->email = $request->email;
            $subscriber->save();

            if($subscriber->id){
                $return['result'] = 'success';
            } else {
                $return['result'] = 'error';
            }
        }
        echo json_encode($return);exit;
    }

    public function changeLanguage(request $request){
        $lang = $request->lang;
        \Session::put('language', $lang);
    }
}