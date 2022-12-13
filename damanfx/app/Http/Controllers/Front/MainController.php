<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;

class MainController extends Controller
{
    public function __construct(){
        $this->data = array();
        $setting_list = array();
        $setting_list = getSettingDetail();
        $this->data = $setting_list;
    }
}
