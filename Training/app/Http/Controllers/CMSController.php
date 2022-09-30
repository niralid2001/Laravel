<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CMSController extends Controller
{
    public function home() {
        return view('home');
    }

    public function aboutus() {
        return view('aboutus');
    }

    public function service() {
        return view('service');
    }

    public function contact() {
        return view('contact');
    }
}
