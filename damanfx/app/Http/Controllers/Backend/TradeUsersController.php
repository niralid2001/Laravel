<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TradeUsers;
use Auth;
use Session;
use DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class TradeUsersController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Trade Users');
        return view('backend.trade_user.index', array_merge($this->data, $return_data));
    }

    public function tradeUserDatatable(request $request)
    {
        if($request->ajax()){
            $query = TradeUsers::where('is_archive', '=', 0)->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('name', function ($row) {
                    $html = "";
                    $html .= $row->fname ? $row->fname.' '.$row->lname : '';
                    return $html;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";$html .= "<a href='javascript:void(0);' data-href='".route('admin_trade-user-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a>";
                    $html .= "</span>";
                    return $html;
                })
                ->rawColumns(['name', 'action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }

    public function destroy($id)
    {
        $id = Crypt::decrypt($id);
        $tuser = TradeUsers::where('id', $id)->update([
            'is_archive' => 1
        ]);
        if($tuser) {
            return redirect()->back()->with('success', trans('Trade User Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
}
