<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subscriber;
use Auth;
use Session;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class SubscriberController extends MainController
{
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Subscribers');
        return view('backend.subscriber.index', array_merge($this->data, $return_data));
    }

    public function subscriberDatatable(request $request)
    {
        if($request->ajax()){
            $query = Subscriber::select('id', 'email')->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('email', function($row){
                    $email = $row->email;
                    return $email;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";$html .= "<a href='javascript:void(0);' data-href='".route('admin_subscriber-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a>";
                    $html .= "</span>";
                    return $html;
                })
                ->rawColumns(['email', 'action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }

    public function destroy($id)
    {
        $id = Crypt::decrypt($id);
        $subscriber = Subscriber::where([['id', $id]])->delete();
        return redirect('backend/subscribers')->with('success', trans('Subscriber Deleted Successfully!'));
    }
}