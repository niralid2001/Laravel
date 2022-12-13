@extends('front.layout.main')
@section('content')
<!-- nodesposit start page  -->

<div class="headingtraslate">
<div class="container">
    <div class="depositbg ">
        <h4 class="depositheading">{{$detail->title}} </h4>
    </div>
    <div class="depositborder">
        <div class="row">
            <div class="col-12">
                <p class="depositpara">
                    {!! $detail->description !!}
                </p>
                <img src="{{url('uploads/bonus/'.$detail->image)}}" class="nodespositimg  img-fluid" >
                <p> <b> {{__("Joining Link")}}:</b> <a href="http://{{$detail->bonus_url}}" target="_blank">{{$detail->bonus_url}}</a></p>
                <p> <b>{{__("Ending Date")}}: Endin</b> {{$detail->end_date ? date('d/m/Y', strtotime($detail->end_date)) : ''}} </p>
                <p> <b> {{__("Offer is Applicable")}}:</b> {{$detail->available_for}} </p>
                <p> <b> {{__("How to Apply")}} </b></p>
                {!! $detail->how_to_apply !!}
                <div class="promotionhead">
                    <p class="promotiontext"> <b> {{__("Promotion's Details")}} </b> </p>
                </div>

                <table class="table">
                    <tbody>
                        <tr class="tablehover">
                            <td> <img src="{{url('front/img/max_leverage.png')}}" class="tableimg  img-fluid"  > {{__("Max Leverage")}} </td>
                            <td> {{$detail->max_leverage}} </td>
                        </tr>

                        <tr class="tablehover">
                            @inject('items','App\Models\BonusLicenses') {{-- inject before foreach --}}
                            @php($result = $items->with('licenseDetail')->where([['bonus_id', $detail->id]])->get())
                            <td> <img src="{{url('front/img/Regulated.png')}}" class="tableimg  img-fluid" > {{__("Regulated By")}} </td>
                            <td>
                                @if($result->count())
                                    @foreach($result as $license)
                                        @if($loop->last)
                                            {{$license->licenseDetail->name}}
                                        @else
                                            {{$license->licenseDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @else
                                    <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                                @endif
                            </td>
                        </tr>

                        <tr class="tablehover">
                            @inject('items','App\Models\BonusTradingPlatforms') {{-- inject before foreach --}}
                            @php($result = $items->with('platformDetail')->where([['bonus_id', $detail->id]])->get())
                            <td> <img src="{{url('front/img/Trading_Platforms.png')}}"  class="tableimg  img-fluid" > {{__("Trading Platforms")}} </td>
                            <td> 
                                @if($result->count())
                                    @foreach($result as $platform)
                                        @if($loop->last)
                                            {{$platform->platformDetail->name}}
                                        @else
                                            {{$platform->platformDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @else
                                    <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                                @endif
                            </td>
                        </tr>

                        <tr class="tablehover">
                            @inject('items','App\Models\BonusTypeOptions') {{-- inject before foreach --}}
                            @php($result = $items->with('bonusTypeDetail')->where([['bonus_id', $detail->id]])->get())
                            <td> <img src="{{url('front/img/Bonus_Type.png')}}" class="tableimg  img-fluid"> {{__("Bonus Type")}} </td>
                            <td>
                                @if($result->count())
                                    @foreach($result as $btype)
                                        @if($loop->last)
                                            {{$btype->bonusTypeDetail->name}}
                                        @else
                                            {{$btype->bonusTypeDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @else
                                    <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                                @endif
                            </td>
                        </tr>

                        <tr class="tablehover">
                            @inject('items','App\Models\BonusAccountTypeOptions') {{-- inject before foreach --}}
                            @php($result = $items->with('accountTypeDetail')->where([['bonus_id', $detail->id]])->get())
                            <td> <img src="{{url('front/img/Account_Type.png')}}" class="tableimg  img-fluid" > {{__("Account Type")}} </td>
                            <td>
                                @if($result->count())
                                    @foreach($result as $atype)
                                        @if($loop->last)
                                            {{$atype->accountTypeDetail->name}}
                                        @else
                                            {{$atype->accountTypeDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @else
                                    <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                                @endif
                            </td>
                        </tr>

                        <tr class="tablehover">
                            @inject('items','App\Models\BonusDepositOptions') {{-- inject before foreach --}}
                            @php($result = $items->with('paymentOptionDetail')->where([['bonus_id', $detail->id]])->get())
                            <td> <img src="{{url('front/img/Deposit_Method.png')}}" class="tableimg  img-fluid"> {{__("Deposit Methods")}} </td>
                            <td>
                                @if($result->count())
                                    @foreach($result as $deposit)
                                        @if($loop->last)
                                            {{$deposit->paymentOptionDetail->name}}
                                        @else
                                            {{$deposit->paymentOptionDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @else
                                    <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                                @endif
                            </td>
                        </tr>

                        <tr class="tablehover">
                            @inject('items','App\Models\BonusWithdrawalOptions') {{-- inject before foreach --}}
                            @php($result = $items->with('paymentOptionDetail')->where([['bonus_id', $detail->id]])->get())
                            <td> <img src="{{url('front/img/Withdraw_Method.png')}}"  class="tableimg  img-fluid" > {{__("Withdrawal Methods")}} </td>
                            <td>
                                @if($result->count())
                                    @foreach($result as $withdraw)
                                        @if($loop->last)
                                            {{$withdraw->paymentOptionDetail->name}}
                                        @else
                                            {{$withdraw->paymentOptionDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @else
                                    <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                                @endif
                            </td>
                        </tr>

                        <tr class="tablehover">
                            <td> <img src="{{url('front/img/Verification.png')}}" class="tableimg  img-fluid" > {{__("Verification")}} </td>
                            <td> {{$detail->verification == '0' ? __("Yes") : __('No')}} </td>
                        </tr>
                    </tbody>
                </table>

                <p> <b> {{__("Withdraw")}}: </b></p>
                {!! $detail->	withdrawal !!}

                <p> <b> <i class="fa-solid fa-bars"></i> {{__("RELATED PROMOTION")}} </b> </p>
            </div>
        </div>
        <table class="table">
            <thead class="thead-dark">
                <tr class="relatedhead">
                    <th scope="col"> {{__("Promotion")}} </th>
                    <th scope="col"> {{__("Type")}} </th>
                    <th scope="col"> {{__("Rewards")}} </th>
                    <th scope="col"> {{__("Ending Date")}} </th>
                </tr>
            </thead>
            <tbody>
                @if($other_bonus->count())
                    @foreach($other_bonus as $bk => $bval)
                        @php($class = '')
                        @if($bk % 2 != 0)
                            @php($class = 'relatedtext')
                        @endif
                        <tr class="relatedhover {{$class}}">
                            <td> <a href="{{url($bval->slug.'-'.$bval->id)}}">{{$bval->title}}</a> </td>
                            @inject('items','App\Models\BonusTypeOptions') {{-- inject before foreach --}}
                            @php($result = $items->with('bonusTypeDetail')->where([['bonus_id', $bval->id]])->get())
                            <td>
                                @if($result->count())
                                    @foreach($result as $type)
                                        @if($loop->last)
                                            {{$type->bonusTypeDetail->name}}
                                        @else
                                            {{$type->bonusTypeDetail->name.", "}}
                                        @endif
                                    @endforeach
                                @endif
                            </td>
                            <td> ${{$bval->amount}} </td>
                            <td> {{$bval->end_date ? date('d/m/Y', strtotime($bval->end_date)) : ''}} </td>
                        </tr>
                    @endforeach
                @else
                    <tr class="relatedhover">
                        <td colspan="4">{{__("No data available")}}</td>
                    </tr>
                @endif
            </tbody>
        </table>
    </div>
</div>
</div>
@endsection