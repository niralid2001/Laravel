<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CompanyDetail;
use App\Models\CompanyTradingPlatform;
use App\Models\CompanyLicense;
use App\Models\CompanyDepositOption;
use App\Models\CompanyWithdrawalOption;
use App\Models\CompanyLocalOffice;
use App\Models\CompanyTradingAsset;
use App\Models\TradingPlatform;
use App\Models\License;
use App\Models\PaymentOption;
use App\Models\Country;
use App\Models\TradingAsset;
use Auth;
use Session;
use DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class CompanyController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Companies');
        return view('backend.company.list', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $return_data = array();
        $return_data['site_title'] = trans('Company Create');
        $return_data['trading_platforms'] = TradingPlatform::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['trading_assets'] = TradingAsset::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['payment_options'] = PaymentOption::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['licenses'] = License::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['countries'] = Country::select('id', 'name')->orderBy('id', 'desc')->get();
        return view('backend.company.form',array_merge($this->data,$return_data));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
                'name' => ['required'],
                'image' => ['required'],
                'description' => ['required'],
                'minimum_deposit_amount' => ['required'],
                'year_founded' => ['required'],
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->name != '' ? slugify($request->name) : NULL;
        $company = new CompanyDetail();
        $fields = array('name', 'description', 'address', 'minimum_deposit_amount', 'year_founded', 'is_demo_account', 'is_withdrawal_commission', 'is_islamic_account');
        foreach($fields as $key => $value){
            $company->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $newName = fileUpload($request, 'image', 'uploads/company');
            $company->image = $newName;
        }
        $company->slug = $slug ? $slug : NULL;
        $company->created_by = Auth::guard('admin')->user()->id;
        $company->save();

        if($company){
            $company_id = $company->id;
            $trading_platform = $request->trading_platform;
            if(is_array($trading_platform) && count($trading_platform)){
                foreach($trading_platform as $value){
                    $item = new CompanyTradingPlatform();
                    $item->company_id = $company_id;
                    $item->trading_platform_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $license = $request->license;
            if(is_array($license) && count($license)){
                foreach($license as $value){
                    $item = new CompanyLicense();
                    $item->company_id = $company_id;
                    $item->license_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $deposit_option = $request->deposit_option;
            if(is_array($deposit_option) && count($deposit_option)){
                foreach($deposit_option as $value){
                    $item = new CompanyDepositOption();
                    $item->company_id = $company_id;
                    $item->payment_option_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $withdrawal_option = $request->withdrawal_option;
            if(is_array($withdrawal_option) && count($withdrawal_option)){
                foreach($withdrawal_option as $value){
                    $item = new CompanyWithdrawalOption();
                    $item->company_id = $company_id;
                    $item->payment_option_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $local_office = $request->local_office;
            if(is_array($local_office) && count($local_office)){
                foreach($local_office as $value){
                    $item = new CompanyLocalOffice();
                    $item->company_id = $company_id;
                    $item->country_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $trading_asset = $request->trading_asset;
            if(is_array($trading_asset) && count($trading_asset)){
                foreach($trading_asset as $value){
                    $item = new CompanyTradingAsset();
                    $item->company_id = $company_id;
                    $item->trading_asset_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }
            return redirect('backend/companies')->with('success', trans('Company Added Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $id = Crypt::decrypt($id);
        $return_data = array();
        $record = CompanyDetail::with('tradingAssets')->find($id);
        $return_data['record'] = $record;
        $return_data['trading_platforms'] = TradingPlatform::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['trading_assets'] = TradingAsset::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['payment_options'] = PaymentOption::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['licenses'] = License::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['countries'] = Country::select('id', 'name')->orderBy('id', 'desc')->get();
        $return_data['site_title'] = trans('Company Edit');
        return view('backend.company.form', array_merge($this->data, $return_data));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $id = Crypt::decrypt($id);
        $this->validate($request, [
                'name' => ['required'],
                'description' => ['required'],
                'minimum_deposit_amount' => ['required'],
                'year_founded' => ['required'],
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->name != '' ? slugify($request->name) : NULL;
        $company = CompanyDetail::find($id);
        $fields = array('name', 'description', 'address', 'minimum_deposit_amount', 'year_founded', 'is_demo_account', 'is_withdrawal_commission', 'is_islamic_account');
        foreach($fields as $key => $value){
            $company->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $old_image = $company->image;
            if($old_image){
                removeFile('uploads/company/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/company');
            $company->image = $newName;
        }
        $company->slug = $slug ? $slug : NULL;
        $company->updated_by = Auth::guard('admin')->user()->id;
        $company->save();
        if($company) {
            $company_id = $company->id;
            $trading_platform = $request->trading_platform;
            if(is_array($trading_platform) && count($trading_platform)){
                CompanyTradingPlatform::where('company_id', $company_id)->whereNotIn('trading_platform_id', $trading_platform)->delete();
                foreach($trading_platform as $value){
                    $item = CompanyTradingPlatform::updateOrCreate(
                            [
                                'company_id' => $company_id,
                                'trading_platform_id' => $value
                            ],
                            [
                                'company_id' => $company_id,
                                'trading_platform_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                CompanyTradingPlatform::where('company_id', $company_id)->delete();
            }

            $license = $request->license;
            if(is_array($license) && count($license)){
                CompanyLicense::where('company_id', $company_id)->whereNotIn('license_id', $license)->delete();
                foreach($license as $value){
                    $item = CompanyLicense::updateOrCreate(
                            [
                                'company_id' => $company_id,
                                'license_id' => $value
                            ],
                            [
                                'company_id' => $company_id,
                                'license_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                CompanyLicense::where('company_id', $company_id)->delete();
            }

            $deposit_option = $request->deposit_option;
            if(is_array($deposit_option) && count($deposit_option)){
                CompanyDepositOption::where('company_id', $company_id)->whereNotIn('payment_option_id', $deposit_option)->delete();
                foreach($deposit_option as $value){
                    $item = CompanyDepositOption::updateOrCreate(
                            [
                                'company_id' => $company_id,
                                'payment_option_id' => $value
                            ],
                            [
                                'company_id' => $company_id,
                                'payment_option_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                CompanyDepositOption::where('company_id', $company_id)->delete();
            }

            $withdrawal_option = $request->withdrawal_option;
            if(is_array($withdrawal_option) && count($withdrawal_option)){
                CompanyWithdrawalOption::where('company_id', $company_id)->whereNotIn('payment_option_id', $withdrawal_option)->delete();
                foreach($withdrawal_option as $value){
                    $item = CompanyWithdrawalOption::updateOrCreate(
                            [
                                'company_id' => $company_id,
                                'payment_option_id' => $value
                            ],
                            [
                                'company_id' => $company_id,
                                'payment_option_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                CompanyWithdrawalOption::where('company_id', $company_id)->delete();
            }

            $local_office = $request->local_office;
            if(is_array($local_office) && count($local_office)){
                CompanyLocalOffice::where('company_id', $company_id)->whereNotIn('country_id', $local_office)->delete();
                foreach($local_office as $value){
                    $item = CompanyLocalOffice::updateOrCreate(
                            [
                                'company_id' => $company_id,
                                'country_id' => $value
                            ],
                            [
                                'company_id' => $company_id,
                                'country_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                CompanyLocalOffice::where('company_id', $company_id)->delete();
            }

            $trading_asset = $request->trading_asset;
            if(is_array($trading_asset) && count($trading_asset)){
                CompanyTradingAsset::where('company_id', $company_id)->whereNotIn('trading_asset_id', $trading_asset)->delete();
                foreach($trading_asset as $value){
                    $item = CompanyTradingAsset::updateOrCreate(
                            [
                                'company_id' => $company_id,
                                'trading_asset_id' => $value
                            ],
                            [
                                'company_id' => $company_id,
                                'trading_asset_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                CompanyTradingAsset::where('company_id', $company_id)->delete();
            }
            return redirect('backend/companies')->with('success', trans('Company Updated Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $id = Crypt::decrypt($id);
        $company = CompanyDetail::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($company) {
            return redirect('backend/companies')->with('success', trans('Company Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function companyDatatable(request $request)
    {
        if($request->ajax()){
            $query = CompanyDetail::select('id', 'name', 'slug', 'image', 'address')->where('is_archive', '=', 0)->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('image', function ($row) {
                    $image = "<img src='".url('uploads/company/'.$row->image)."' width='80px' height='80px'>";
                    return $image;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_company-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_company-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a><br/>";
                    $html .= "<a href='".route('admin_company-detail', array($row->slug))."' rel='tooltip' title='".trans('Detail')."' class='badge badge-success'>".trans('Detail')."</a>&nbsp";
                    $html .= "</span>";
                    return $html;
                })
                ->rawColumns(['image','action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }

    public function detail(request $request){
        $slug = $request->slug;
        $return_data = array();
        $record = CompanyDetail::with('tradingAssets', 'tradingPlatforms', 'licenses', 'localOffices', 'depositOptions', 'withdrawalOptions')->where('slug', '=', $slug)->first();
        if(isset($record->id)){
            $return_data['record'] = $record;
            $return_data['site_title'] = $record->name.' '.trans('Detail');
            return view('backend.company.detail', array_merge($this->data, $return_data));
        } else{
            return redirect('backend/dashboard');
        }
    }
}
