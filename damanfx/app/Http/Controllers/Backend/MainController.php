<?php

namespace App\Http\Controllers\Backend;

use App;
use App\Models\Setting;
use App\Http\Controllers\Controller;
use App\Constant;
use Illuminate\Http\Request;

class MainController extends Controller
{
    public function __construct(){

        $language = Constant::LANGUAGE;
        \Session::put('language', $language);
        $this->data = array();
        $setting_list = array();
        $setting_list = getSettingDetail();
        $this->data = $setting_list;
    }

}
