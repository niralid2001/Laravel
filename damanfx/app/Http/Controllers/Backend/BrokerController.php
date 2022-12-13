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
use App\Models\BrokerReviews;
use Auth;
use Session;
use DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Crypt;
use DataTables;

class BrokerController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Brokers');
        return view('backend.broker.list', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $return_data = array();
        $return_data['site_title'] = trans('Broker Create');
        $return_data['trading_platforms'] = TradingPlatform::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['trading_assets'] = TradingAsset::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['payment_options'] = PaymentOption::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['licenses'] = License::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['countries'] = Country::select('id', 'name')->orderBy('id', 'desc')->get();
        return view('backend.broker.form',array_merge($this->data,$return_data));
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
                'min_spread' => ['required'],
                'max_leverage' => ['required'],
                'currency_pass' => ['required'],
                'customer_support' => ['required'],
                'type_of_broker' => ['required'],
                'trading_instruments' => ['required'],
                'used_by' => ['required'],
                'broker_url' => ['required'],
                'scores' => ['required'],
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->name != '' ? slugify($request->name) : NULL;
        $broker = new BrokerDetail();
        $fields = array('name', 'description', 'address', 'minimum_deposit_amount', 'year_founded', 'broker_url', 'scores', 'min_spread', 'used_by', 'trading_instruments', 'type_of_broker', 'customer_support', 'currency_pass', 'max_leverage', 'is_demo_account', 'is_withdrawal_commission', 'is_islamic_account', 'meta_title', 'meta_keyword', 'meta_description', 'focus_keyphrase', 'bonus_amount', 'offer', 'bonus_url', 'is_show_in_front');
        foreach($fields as $key => $value){
            $broker->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        $broker->bonus_end_date = isset($request->bonus_end_date) && $request->bonus_end_date ? date('Y-m-d', strtotime($request->bonus_end_date)) : NULL;
        if($request->hasFile('image')) {
            $newName = fileUpload($request, 'image', 'uploads/broker');
            $broker->image = $newName;
        }
        $broker->slug = $slug ? $slug : NULL;
        $broker->created_by = Auth::guard('admin')->user()->id;
        $broker->save();

        if($broker){
            $broker_id = $broker->id;
            $trading_platform = $request->trading_platform;
            if(is_array($trading_platform) && count($trading_platform)){
                foreach($trading_platform as $value){
                    $item = new BrokerTradingPlatform();
                    $item->broker_id = $broker_id;
                    $item->trading_platform_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $license = $request->license;
            if(is_array($license) && count($license)){
                foreach($license as $value){
                    $item = new BrokerLicense();
                    $item->broker_id = $broker_id;
                    $item->license_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $deposit_option = $request->deposit_option;
            if(is_array($deposit_option) && count($deposit_option)){
                foreach($deposit_option as $value){
                    $item = new BrokerDepositOption();
                    $item->broker_id = $broker_id;
                    $item->payment_option_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $withdrawal_option = $request->withdrawal_option;
            if(is_array($withdrawal_option) && count($withdrawal_option)){
                foreach($withdrawal_option as $value){
                    $item = new BrokerWithdrawalOption();
                    $item->broker_id = $broker_id;
                    $item->payment_option_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $local_office = $request->local_office;
            if(is_array($local_office) && count($local_office)){
                foreach($local_office as $value){
                    $item = new BrokerLocalOffice();
                    $item->broker_id = $broker_id;
                    $item->country_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }

            $trading_asset = $request->trading_asset;
            if(is_array($trading_asset) && count($trading_asset)){
                foreach($trading_asset as $value){
                    $item = new BrokerTradingAsset();
                    $item->broker_id = $broker_id;
                    $item->trading_asset_id = $value;
                    $item->created_by = Auth::guard('admin')->user()->id;
                    $item->save();
                }
            }
            return redirect('backend/brokers')->with('success', trans('Broker Added Successfully!'));
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
        $record = BrokerDetail::with('tradingAssets')->find($id);
        $return_data['record'] = $record;
        $return_data['trading_platforms'] = TradingPlatform::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['trading_assets'] = TradingAsset::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['payment_options'] = PaymentOption::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['licenses'] = License::select('id', 'name')->where([['is_archive', 0]])->orderBy('id', 'desc')->get();
        $return_data['countries'] = Country::select('id', 'name')->orderBy('id', 'desc')->get();
        $return_data['site_title'] = trans('Broker Edit');
        return view('backend.broker.form', array_merge($this->data, $return_data));
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
                'min_spread' => ['required'],
                'max_leverage' => ['required'],
                'currency_pass' => ['required'],
                'customer_support' => ['required'],
                'type_of_broker' => ['required'],
                'trading_instruments' => ['required'],
                'used_by' => ['required'],
                'broker_url' => ['required']
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->name != '' ? slugify($request->name) : NULL;
        $broker = BrokerDetail::find($id);
        $fields = array('name', 'description', 'address', 'minimum_deposit_amount', 'broker_url', 'year_founded', 'scores', 'min_spread', 'used_by', 'trading_instruments', 'type_of_broker', 'customer_support', 'currency_pass', 'max_leverage', 'is_demo_account', 'is_withdrawal_commission', 'is_islamic_account', 'meta_title', 'meta_keyword', 'meta_description', 'focus_keyphrase', 'bonus_amount', 'offer', 'bonus_url', 'is_show_in_front');
        foreach($fields as $key => $value){
            $broker->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        if($request->hasFile('image')) {
            $old_image = $broker->image;
            if($old_image){
                removeFile('uploads/broker/'.$old_image);
            }
            $newName = fileUpload($request, 'image', 'uploads/broker');
            $broker->image = $newName;
        }

        $broker->bonus_end_date = isset($request->bonus_end_date) && $request->bonus_end_date ? date('Y-m-d', strtotime($request->bonus_end_date)) : NULL;
        $broker->slug = $slug ? $slug : NULL;
        $broker->updated_by = Auth::guard('admin')->user()->id;
        $broker->save();
        if($broker) {
            $broker_id = $broker->id;
            $trading_platform = $request->trading_platform;
            if(is_array($trading_platform) && count($trading_platform)){
                BrokerTradingPlatform::where('broker_id', $broker_id)->whereNotIn('trading_platform_id', $trading_platform)->delete();
                foreach($trading_platform as $value){
                    $item = BrokerTradingPlatform::updateOrCreate(
                            [
                                'broker_id' => $broker_id,
                                'trading_platform_id' => $value
                            ],
                            [
                                'broker_id' => $broker_id,
                                'trading_platform_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerTradingPlatform::where('broker_id', $broker_id)->delete();
            }

            $license = $request->license;
            if(is_array($license) && count($license)){
                BrokerLicense::where('broker_id', $broker_id)->whereNotIn('license_id', $license)->delete();
                foreach($license as $value){
                    $item = BrokerLicense::updateOrCreate(
                            [
                                'broker_id' => $broker_id,
                                'license_id' => $value
                            ],
                            [
                                'broker_id' => $broker_id,
                                'license_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerLicense::where('broker_id', $broker_id)->delete();
            }

            $deposit_option = $request->deposit_option;
            if(is_array($deposit_option) && count($deposit_option)){
                BrokerDepositOption::where('broker_id', $broker_id)->whereNotIn('payment_option_id', $deposit_option)->delete();
                foreach($deposit_option as $value){
                    $item = BrokerDepositOption::updateOrCreate(
                            [
                                'broker_id' => $broker_id,
                                'payment_option_id' => $value
                            ],
                            [
                                'broker_id' => $broker_id,
                                'payment_option_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerDepositOption::where('broker_id', $broker_id)->delete();
            }

            $withdrawal_option = $request->withdrawal_option;
            if(is_array($withdrawal_option) && count($withdrawal_option)){
                BrokerWithdrawalOption::where('broker_id', $broker_id)->whereNotIn('payment_option_id', $withdrawal_option)->delete();
                foreach($withdrawal_option as $value){
                    $item = BrokerWithdrawalOption::updateOrCreate(
                            [
                                'broker_id' => $broker_id,
                                'payment_option_id' => $value
                            ],
                            [
                                'broker_id' => $broker_id,
                                'payment_option_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerWithdrawalOption::where('broker_id', $broker_id)->delete();
            }

            $local_office = $request->local_office;
            if(is_array($local_office) && count($local_office)){
                BrokerLocalOffice::where('broker_id', $broker_id)->whereNotIn('country_id', $local_office)->delete();
                foreach($local_office as $value){
                    $item = BrokerLocalOffice::updateOrCreate(
                            [
                                'broker_id' => $broker_id,
                                'country_id' => $value
                            ],
                            [
                                'broker_id' => $broker_id,
                                'country_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerLocalOffice::where('broker_id', $broker_id)->delete();
            }

            $trading_asset = $request->trading_asset;
            if(is_array($trading_asset) && count($trading_asset)){
                BrokerTradingAsset::where('broker_id', $broker_id)->whereNotIn('trading_asset_id', $trading_asset)->delete();
                foreach($trading_asset as $value){
                    $item = BrokerTradingAsset::updateOrCreate(
                            [
                                'broker_id' => $broker_id,
                                'trading_asset_id' => $value
                            ],
                            [
                                'broker_id' => $broker_id,
                                'trading_asset_id' => $value,
                                'created_by' => Auth::guard('admin')->user()->id,
                                'updated_by' => Auth::guard('admin')->user()->id
                            ]
                    );
                }
            } else {
                BrokerTradingAsset::where('broker_id', $broker_id)->delete();
            }
            return redirect('backend/brokers')->with('success', trans('Broker Updated Successfully!'));
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
        $broker = BrokerDetail::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($broker) {
            return redirect('backend/brokers')->with('success', trans('Broker Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function brokerDatatable(request $request)
    {
        if($request->ajax()){
            $query = BrokerDetail::select('id', 'name', 'slug', 'image', 'address')->where('is_archive', '=', 0)->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('image', function ($row) {
                    $image = "<img src='".url('uploads/broker/'.$row->image)."' width='80px' height='80px'>";
                    return $image;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_broker-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_broker-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a><br/>";
                    $html .= "<a href='".route('admin_broker-detail', array($row->slug))."' rel='tooltip' title='".trans('Detail')."' class='badge badge-success'>".trans('Detail')."</a><br/>";
                    $html .= "<a href='".route('admin_broker-faqs', array($row->id))."' rel='tooltip' title='".trans('Faq')."' class='badge badge-warning'>".trans('Faq')."</a>&nbsp";
                    $html .= "<a href='".route('admin_broker-reviews', array($row->id))."' rel='tooltip' title='".trans('Faq')."' class='badge badge-warning'>".trans('Reviews')."</a>&nbsp";
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
        $record = BrokerDetail::with('tradingAssets', 'tradingPlatforms', 'licenses', 'localOffices', 'depositOptions', 'withdrawalOptions')->where('slug', '=', $slug)->first();
        if(isset($record->id)){
            $return_data['record'] = $record;
            $return_data['site_title'] = $record->name.' '.trans('Detail');
            return view('backend.broker.detail', array_merge($this->data, $return_data));
        } else{
            return redirect('backend/dashboard');
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function faqs(request $request)
    {
        $return_data = array();       
        $return_data['site_title'] = trans('Broker Faq');
        $return_data['broker_id'] = $request->broker_id;
        return view('backend.broker.faq.list', array_merge($this->data, $return_data));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function faqCreate(request $request)
    {
        $return_data = array();
        $return_data['site_title'] = trans('Broker Faq Create');
        $return_data['broker_id'] = $request->broker_id;
        return view('backend.broker.faq.form',array_merge($this->data,$return_data));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function faqStore(Request $request)
    {
        $this->validate($request, [
                'question' => ['required'],
                'answer' => ['required']
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->question != '' ? slugify($request->question) : NULL;
        $faq = new BrokerFaq();
        $fields = array('question', 'answer', 'broker_id');
        foreach($fields as $key => $value){
            $faq->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        $faq->slug = $slug ? $slug : NULL;
        $faq->created_by = Auth::guard('admin')->user()->id;
        $faq->save();

        if($faq){
            return redirect('backend/broker-faqs/'.$request->broker_id)->with('success', trans('Broker Faq Added Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }

    public function faqEdit($id)
    {
        $id = Crypt::decrypt($id);
        $return_data = array();
        $record = BrokerFaq::find($id);
        $return_data['record'] = $record;
        $return_data['site_title'] = trans('Broker Faq Edit');
        return view('backend.broker.faq.form', array_merge($this->data, $return_data));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function faqUpdate(Request $request, $id)
    {

        $id = Crypt::decrypt($id);
        $this->validate($request, [
                'question' => ['required'],
                'answer' => ['required']
            ],[
                'required'  => trans('The :attribute field is required.')
            ]
        );
        $slug = $request->question != '' ? slugify($request->question) : NULL;
        $faq = BrokerFaq::find($id);
        $fields = array('question', 'answer');
        foreach($fields as $key => $value){
            $faq->$value = isset($request->$value) && $request->$value != '' ? $request->$value : NULL; 
        }
        $faq->slug = $slug ? $slug : NULL;
        $faq->updated_by = Auth::guard('admin')->user()->id;
        $faq->save();
        if($faq) {
            $broker_id = $faq->broker_id;
            return redirect('backend/broker-faqs/'.$broker_id)->with('success', trans('Broker Faq Updated Successfully!'));
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
    public function faqDestroy($id)
    {
        $id = Crypt::decrypt($id);
        $faq = BrokerFaq::where('id', $id)->update([
            'is_archive' => 1,
            'updated_by' => Auth::guard('admin')->user()->id,
        ]);
        if($faq) {
            return redirect()->back()->with('success', trans('Broker Faq Deleted Successfully!'));
        } else {
            return redirect()->back()->with('error', trans('Something went wrong, please try again later!'));
        }
    }
    public function brokerFaqDatatable(request $request)
    {
        if($request->ajax()){
            $query = BrokerFaq::select('id', 'question', 'answer')->where([['is_archive', '=', 0],['broker_id', '=', $request->broker_id]])->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('answer', function ($row) {
                    return $row->answer;
                })
                ->addColumn('action', function ($row) {
                    $html = "";
                    $id = Crypt::encrypt($row->id);
                    $html .= "<span class='text-nowrap'>";
                    $html .= "<a href='".route('admin_broker-faq-edit', array($id))."' rel='tooltip' title='".trans('Edit')."' class='btn btn-info btn-sm'><i class='fas fa-pencil-alt'></i></a>&nbsp";
                    $html .= "<a href='javascript:void(0);' data-href='".route('admin_broker-faq-delete',array($id))."' rel='tooltip' title='".trans('Delete')."' class='btn btn-danger btn-sm delete'><i class='fas fa-trash-alt'></i></a><br/>";
                    $html .= "</span>";
                    return $html;
                })
                ->rawColumns(['answer','action'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }

    public function brokerReviews(request $request){
        $return_data = array();       
        $return_data['site_title'] = trans('Broker Reviews');
        $return_data['broker_id'] = $request->broker_id;
        return view('backend.broker.review', array_merge($this->data, $return_data));
    }

    public function brokerReviewDatatable(request $request)
    {
        if($request->ajax()){
            $query = BrokerReviews::select('id', 'review', 'name', 'email', 'comment', 'created_at')->where([['broker_id', '=', $request->broker_id]])->orderBy('id', 'DESC');
            $list = $query->get();

            return DataTables::of($list)
                ->addColumn('review', function ($row) {
                    $review = isset($row->review) && $row->review ? $row->review : 0;
                    $html = '<span class="text-nowrap">';
                    for($i = 1; $i <= 5; $i++){
                        $check_class = $row->review >= $i ? 'checked' : '';
                        $html .= '<span class="fa fa-star '.$check_class.'"></span>';
                    }
                    $html .= '</span>';
                    return $html;
                })
                ->addColumn('reviewed_at', function ($row) {
                    $html = isset($row->created_at) ? date('d/m/Y h:i A', strtotime($row->created_at)) : '';
                    return $html;
                })
                ->rawColumns(['review','reviewed_at'])
                ->make(true);
        } else {
            return redirect('backend/dashboard');
        }
    }
}
