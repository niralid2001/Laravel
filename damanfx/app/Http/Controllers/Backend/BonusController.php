<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BrokerDetail;
use App\Models\BrokerTradingPlatform;
use App\Models\BrokerLicense;
use App\Models\BrokerDepositOption;
use App\Models\BrokerWithdrawalOption;
use App\Models\BrokerLocalOffice;
use App\Models\BrokerTradingAsset;
use App\Models\TradingPlatform;
use App\Models\License;
use App\Models\PaymentOption;
use App\Models\Country;
use App\Models\TradingAsset;
use App\Models\BrokerFaq;
use App\Models\BonusType;
use App\Models\AccountType;
use App\Models\Bonus;
use App\Models\BrokerBonus;
use App\Models\BonusLicenses;
use App\Models\BonusTypeOptions;
use App\Models\BonusAccountTypeOptions;
use App\Models\BonusDepositOptions;
use App\Models\BonusWithdrawalOptions;
use App\Models\BonusTradingPlatforms;
use Auth;
use Session;
use DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class BonusController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Bonus');
        //print_r($return_data);exit;
        return view('backend.broker.bonus.list', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $return_data = array();
        $return_data['site_title'] = trans('Bonus Create');
        $return_data['brokerDetail'] = BrokerDetail::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['trading_platforms'] = TradingPlatform::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['bonus_types'] = BonusType::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['account_types'] = AccountType::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['payment_options'] = PaymentOption::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['licenses'] = License::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        return view('backend.broker.bonus.form',array_merge($this->data,$return_data));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // print_r($request->broker_id);exit;
        $this->validate($request, [
            'title' => ['required'],
            'amount' => ['required'],
            'bonus_url' => ['required']
        ],[
            'required'  => trans('The :attribute field is required.')
        ]
        );
        $slug = $request->title != '' ? slugify($request->title) : NULL;
        $bonus = new Bonus();
        $fields = array('amount', 'title', 'description', 'available_for', 'how_to_apply', 'bonus_url', 'withdrawal', 'max_leverage', 'verification');
        foreach($fields as $key => $value){
            $bonus->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        $bonus->slug = $slug ? $slug : NULL;
        if($request->hasFile('image')) {
            $newName = fileUpload($request, 'image', 'uploads/bonus');
            $bonus->image = $newName;
        }
        $bonus->end_date = isset($request->end_date) && $request->end_date ? date('Y-m-d', strtotime($request->end_date)) : NULL;
        $bonus->created_by = Auth::guard('admin')->user()->id;
        $bonus->save();
        
        
        
        if($bonus){
            $bonus_id = $bonus->id;

            $broker_bouns = $request->broker_id;
            if(is_array($broker_bouns) && count($broker_bouns)){
                foreach($broker_bouns as $value){
                    $item = new BrokerBonus();
                    $item->broker_id = $value;
                    $item->bonus_id = $bonus_id;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $license = $request->license;
            if(is_array($license) && count($license)){
                foreach($license as $value){
                    $item = new BonusLicenses();
                    $item->bonus_id = $bonus_id;
                    $item->license_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $trading_platform = $request->trading_platform;
            if(is_array($trading_platform) && count($trading_platform)){
                foreach($trading_platform as $value){
                    $item = new BonusTradingPlatforms();
                    $item->bonus_id = $bonus_id;
                    $item->trading_platform_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $bonus_type = $request->bonus_type;
            if(is_array($bonus_type) && count($bonus_type)){
                foreach($bonus_type as $value){
                    $item = new BonusTypeOptions();
                    $item->bonus_id = $bonus_id;
                    $item->bonus_type_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $account_type = $request->account_type;
            if(is_array($account_type) && count($account_type)){
                foreach($account_type as $value){
                    $item = new BonusAccountTypeOptions();
                    $item->bonus_id = $bonus_id;
                    $item->account_type_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $deposit_option = $request->deposit_option;
            if(is_array($deposit_option) && count($deposit_option)){
                foreach($deposit_option as $value){
                    $item = new BonusDepositOptions();
                    $item->bonus_id = $bonus_id;
                    $item->payment_option_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $withdrawal_option = $request->withdrawal_option;
            if(is_array($withdrawal_option) && count($withdrawal_option)){
                foreach($withdrawal_option as $value){
                    $item = new BonusWithdrawalOptions();
                    $item->bonus_id = $bonus_id;
                    $item->payment_option_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }
            return redirect('backend/bonus/')->with('success', trans('Bonus Added Successfully!'));
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
        $record = Bonus::find($id);
        //print_r($record);exit;
        $broker_ids = $record->broker_id;
        $return_data['broker_id'] = explode(",",$broker_ids);
        $return_data['trading_platforms'] = TradingPlatform::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['bonus_types'] = BonusType::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['account_types'] = AccountType::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['payment_options'] = PaymentOption::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['licenses'] = License::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['record'] = $record;
        $return_data['brokerDetail'] = BrokerDetail::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['site_title'] = trans('Bonus Edit');
        return view('backend.broker.bonus.form', array_merge($this->data, $return_data));
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
        //$input = $request->all();
        //print_r($input);exit;
        $id = Crypt::decrypt($id);
        $this->validate($request, [
            'amount' => ['required'],
            'title' => ['required'],
            'bonus_url' => ['required']
        ],[
            'required'  => trans('The :attribute field is required.')
            ]
        );
        $bonus = Bonus::find($id);
        $slug = $request->title != '' ? slugify($request->title) : NULL;
        $bonus->slug = $slug ? $slug : NULL;
        $fields = array('amount', 'title', 'description', 'available_for', 'how_to_apply', 'bonus_url', 'withdrawal', 'max_leverage', 'verification');
        foreach($fields as $key => $value){
            $bonus->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        $bonus->end_date = isset($request->end_date) && $request->end_date ? date('Y-m-d', strtotime($request->end_date)) : NULL;
        $bonus->updated_by = Auth::guard('admin')->user()->id;
        if($request->hasFile('image')) {
            $old_image = $bonus->image;
            if($old_image){
                removeFile('uploads/bonus/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/bonus');
            $bonus->image = $newName;
        }
        $bonus->save();
        if($bonus) {
            $bonus_id = $bonus->id;
            $brokers = $request->broker_id;
            if(is_array($brokers) && count($brokers)){
                BrokerBonus::where('bonus_id', $bonus->id)->whereNotIn('broker_id', $brokers)->delete();
                foreach($brokers as $value){
                    $item = BrokerBonus::updateOrCreate(
                            [
                                'broker_id' => $value,
                                'bonus_id' => $bonus_id
                            ],
                            [
                                'broker_id' => $value,
                                'bonus_id' => $bonus_id,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerBonus::where('broker_id', $bonus->broker_id)->delete();
            }

            
            $trading_platform = $request->trading_platform;
            if(is_array($trading_platform) && count($trading_platform)){
                BonusTradingPlatforms::where('bonus_id', $bonus_id)->whereNotIn('trading_platform_id', $trading_platform)->delete();
                foreach($trading_platform as $value){
                    $item = BonusTradingPlatforms::updateOrCreate(
                            [
                                'bonus_id' => $bonus_id,
                                'trading_platform_id' => $value
                            ],
                            [
                                'bonus_id' => $bonus_id,
                                'trading_platform_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BonusTradingPlatforms::where('bonus_id', $bonus_id)->delete();
            }

            $license = $request->license;
            if(is_array($license) && count($license)){
                BonusLicenses::where('bonus_id', $bonus_id)->whereNotIn('license_id', $license)->delete();
                foreach($license as $value){
                    $item = BonusLicenses::updateOrCreate(
                            [
                                'bonus_id' => $bonus_id,
                                'license_id' => $value
                            ],
                            [
                                'bonus_id' => $bonus_id,
                                'license_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BonusLicenses::where('bonus_id', $bonus_id)->delete();
            }

            $bonus_type = $request->bonus_type;
            if(is_array($bonus_type) && count($bonus_type)){
                BonusTypeOptions::where('bonus_id', $bonus_id)->whereNotIn('bonus_type_id', $bonus_type)->delete();
                foreach($bonus_type as $value){
                    $item = BonusTypeOptions::updateOrCreate(
                            [
                                'bonus_id' => $bonus_id,
                                'bonus_type_id' => $value
                            ],
                            [
                                'bonus_id' => $bonus_id,
                                'bonus_type_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BonusTypeOptions::where('bonus_id', $bonus_id)->delete();
            }

            $account_type = $request->account_type;
            if(is_array($account_type) && count($account_type)){
                BonusAccountTypeOptions::where('bonus_id', $bonus_id)->whereNotIn('account_type_id', $account_type)->delete();
                foreach($account_type as $value){
                    $item = BonusAccountTypeOptions::updateOrCreate(
                            [
                                'bonus_id' => $bonus_id,
                                'account_type_id' => $value
                            ],
                            [
                                'bonus_id' => $bonus_id,
                                'account_type_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BonusAccountTypeOptions::where('bonus_id', $bonus_id)->delete();
            }

            $deposit_option = $request->deposit_option;
            if(is_array($deposit_option) && count($deposit_option)){
                BonusDepositOptions::where('bonus_id', $bonus_id)->whereNotIn('payment_option_id', $deposit_option)->delete();
                foreach($deposit_option as $value){
                    $item = BonusDepositOptions::updateOrCreate(
                            [
                                'bonus_id' => $bonus_id,
                                'payment_option_id' => $value
                            ],
                            [
                                'bonus_id' => $bonus_id,
                                'payment_option_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BonusDepositOptions::where('bonus_id', $bonus_id)->delete();
            }

            $withdrawal_option = $request->withdrawal_option;
            if(is_array($withdrawal_option) && count($withdrawal_option)){
                BonusWithdrawalOptions::where('bonus_id', $bonus_id)->whereNotIn('payment_option_id', $withdrawal_option)->delete();
                foreach($withdrawal_option as $value){
                    $item = BonusWithdrawalOptions::updateOrCreate(
                            [
                                'bonus_id' => $bonus_id,
                                'payment_option_id' => $value
                            ],
                            [
                                'bonus_id' => $bonus_id,
                                'payment_option_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BonusWithdrawalOptions::where('bonus_id', $bonus_id)->delete();
            }
            return redirect('backend/bonus')->with('success', trans('Bonus Updated Successfully!'));
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
        $bonus = Bonus::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($bonus) {
            return redirect('backend/bonus')->with('success', trans('Bonus Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function bonusDatatable(request $request)
    {
        if($request->ajax()){
            $query = Bonus::with('brokers')->select('id', 'title', 'amount', 'end_date', 'bonus_url')
            ->where([['is_archive', '=', 0]])
            ->orderBy('id', 'DESC');
            
            $list = $query->get();
            
            return DataTables::of($list)
                ->addColumn('end_date', function ($row) {
                    return $row->end_date ? date('d-m-Y', strtotime($row->end_date)) : NULL;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_bonus-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_bonus-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a><br/>";
                    $html .= "</span>";
                    return $html;
                })
                ->addColumn('broker', function($row){
                    $brokers = isset($row->brokers) && $row->brokers ? $row->brokers : NULL;
                    $html = array();
                    if($brokers->count()){
                        foreach($brokers as $value){
                            $html[] = isset($value->brokerDetail->name) && $value->brokerDetail->name ? $value->brokerDetail->name : NULL;
                        }
                    }
                    return implode(', ', $html);
                })
                ->rawColumns(['answer','action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }
}
