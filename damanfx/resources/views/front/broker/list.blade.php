@extends('front.layout.main')
@section('content')
<!-- most trust FX start  -->
<div class="headingtraslate">
<div class="container">
    <div class="d-flex justify-content-center">
        <h2 class="mosttrust" style="font-size: 2rem;
                margin: 10px ;
                padding: 5px;
                color:  rgb(29, 155, 56 ) ;
                border-bottom:  4px solid rgb(29, 155, 56 );
                width: auto;">Most trusted FX Brokers </h2>
    </div>
    <!-- card 1  -->
    @if($brokers->count())
        @foreach($brokers as $key => $broker)
            <section class="@if($key != 0) {{'mt-4'}} @endif" >
                <div class="row  mosttrustedfxmain">
                    <div class="col-md-3 col-lg-2 " style="background-color: rgb(255, 255, 255);  text-align: center;">
                        <div class="mostdet">
                            <div>
                                <a href="{{url($broker->slug.'-'.$broker->id)}}"><img class="flipimg" style="width: 9rem; padding: 10px;" src="{{url('public/uploads/broker/'.$broker->image)}}" alt=""></a>
                                @inject('items','App\Models\BrokerReviews') {{-- inject before foreach --}}
                                @php($reviews = $items->where([['broker_id', $broker->id]])->get())
                                @php($total_reviews = 0)
                                @foreach($reviews as $review)
                                    @php($total_reviews = $total_reviews + $review->review)
                                @endforeach
                                @php($total_reviews = $reviews->count() ? $total_reviews/$reviews->count() : 0)
                                @if(containsDecimal($total_reviews))
                                    @php($total_reviews = number_format($total_reviews, 1, '.', ''))
                                @endif
                                @php($star = $total_reviews)
                                @if(containsDecimal($star))
                                    @php($star = $star + 1)
                                @endif
                                <div class="starsicon" style="display: flex; justify-content: center; color: rgb(29, 155, 56 );">
                                    @for($i=0; $i<$total_reviews; $i++)
                                        @if(containsDecimal($total_reviews))
                                            @if($i+1 > $total_reviews)
                                                <i class="fa-solid fa-star-half-stroke"></i>
                                            @else
                                                <i class="fa-solid fa-star"></i>
                                            @endif
                                        @else
                                            <i class="fa-solid fa-star"></i>
                                        @endif
                                    @endfor
                                    @for($i=$star; $i<5; $i++)
                                        <i class="fa-regular fa-star"></i>
                                    @endfor
                                </div>
                             </div>

                            <div>
                                <h2>{{$broker->scores}}</h2>
                                <h6 class="pointp" style="font-size: 1rem; font-weight: 700; opacity: 0.8; padding: 5px;">{{__("points")}} </h6>
                            </div>

                            <div>
                                <i class="fa-solid fa-people-group"></i>
                                <h6 class="p-used" style="font-size: 0.8rem; opacity: 0.7; font-weight: 700;"> {{__("USED BY")}} </h6>
                                <h6> {{$broker->used_by}} {{__("Traders")}} </h6>
                            </div>
                            
                        </div>
                    </div>

                    <div class="col-md-9 col-lg-10 " >
                        <div class="row mindepositcot" style="background-color: rgb(247, 247, 249); margin:0px; padding:0px">
                            <div class=" col-md-9 col-lg-8 ">
                                <div class="row  ">
                                    <div class="col-sm-6 col-md-4  col-lg-4  bromindeposit ">
                                        <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("MIN DEPOSIT")}} </a>
                                        <li style=" font-weight: 700;  list-style: none; font-size: 0.8rem; ">
                                            <h4> ${{$broker->minimum_deposit_amount}} </h4>
                                        </li>
                                    </div>

                                    <div class="col-sm-6 col-md-3 col-lg-3  brotradinginstru ">
                                        <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("TRADING INSTRUMENTS")}} </a>
                                        <li style="font-weight: 700; list-style: none; font-size: 0.8rem; ">
                                            <h6> ${{$broker->trading_instruments}}</h6>
                                        </li>
                                    </div>
                                    <div class="col-sm-6 col-md-5 col-lg-5  tradingplatforms">
                                        <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("TRADING PLATFORMS")}} </a>
                                        <div class="row d-sm-flex justify-content-lg-start justify-content-sm-center align-items-sm-center">
                                            @inject('items','App\Models\BrokerTradingPlatform') {{-- inject before foreach --}}
                                            @foreach($trading_platforms as $platform)
                                                @php($result = $items->where([['broker_id', $broker->id], ['trading_platform_id', $platform->id]])->exists())
                                                <div class="col-md-12 col-lg-6">
                                                    <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;">
                                                        <img class="fasaicon" style=" width: 12px; padding: 1px;" src="@if(isset($result) && $result){{url('front/img/accept.png')}}@else{{url('front/img/minus-button.png')}}@endif"> {{$platform->name}} <i class="fa-regular fa-circle-question" title="{{$platform->description}}"></i>
                                                    </li>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-lg-4 col-md-4 pt-lg-4 bonus">
                                        @inject('items','App\Models\BrokerBonus') {{-- inject before foreach --}}
                                        @php($result = $items->with('bonusDetail')->where([['broker_id', $broker->id]])->orderBy('id', 'desc')->first())
                                        @if(isset($result->bonusDetail->title))
                                            <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black; "> {{__("BONUS")}} </a>
                                            <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;">
                                                <p> {{$result->bonusDetail->title.' '.$result->bonusDetail->amount}} </p>
                                            </li>
                                        @endif
                                    </div>

                                    <div class="col-sm-6 col-lg-3 col-md-3 pt-md-4  brotypeofbroker">
                                        <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("TYPE OF BROKERS")}}</a>
                                        <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;">
                                            <p> {{$broker->type_of_broker}} </p>
                                        </li>
                                    </div>

                                    <div class="col-sm-6 col-lg-5 col-md-5 pt-md-4  broallwedtrad">
                                        @inject('items','App\Models\BrokerTradingAsset') {{-- inject before foreach --}}
                                        @php($result = $items->with('assetDetail')->where([['broker_id', $broker->id]])->get())
                                        @if($result->count())
                                            <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("ALLOWED TRADING ASSETS")}} </a>
                                            <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;"> 
                                                @foreach($result as $asset)
                                                    @if($loop->last)
                                                        {{$asset->assetDetail->name}}
                                                    @else
                                                        {{$asset->assetDetail->name.", "}}
                                                    @endif
                                                @endforeach
                                            </li>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-lg-2 col-sm-6 brodepositmethod">
                                @inject('items','App\Models\BrokerDepositOption') {{-- inject before foreach --}}
                                @php($result = $items->with('paymentOptionDetail')->where([['broker_id', $broker->id]])->get())
                                @if($result->count())
                                    <a class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("DEPOSIT METHODS")}} </a>
                                    <div>
                                        @foreach($result as $deposit)
                                            @php($img = isset($deposit->paymentOptionDetail->image) ? $deposit->paymentOptionDetail->image : '')
                                            <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;">
                                                <img class="fasaicon" style=" width: 12px; padding: 1px;" src="{{url('uploads/payment_option/'.$img)}}" style=" width: 12px; padding: 1px;"> {{$deposit->paymentOptionDetail->name}}
                                            </li>
                                        @endforeach
                                    </div>
                                @endif
                            </div>

                            <div class="col-md-12 col-lg-2 col-sm-6 d-flex justify-content-center align-items-center">
                                <div class="btnsection">
                                    <a href='https://{{$broker->broker_url}}' target="_blank" class="tradebtn" type="button" >{{__("TradeNow")}}</a>
                                    <button onclick="window.location.href='{{url($broker->slug.'-'.$broker->id)}}'" class="getbonusbtn" type="button" > {{__("BrokerReviews")}} </button>
                                </div>
                            </div>
                        </div>

                        <div class=" row d-flex justify-content-center align-items-center  " style="background-color: rgb(247, 247, 249); margin:0px 0px;">
                            <div class="col-lg-8 col-md-12 ">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4  brominspread">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;"> {{__("MIN SPREAD")}}</p>
                                        @if($broker->min_spread == '0.0')
                                            @php($image = "signallogo.png")
                                        @elseif($broker->min_spread == '0.6')
                                            @php($image = "signalyellow.png")
                                        @else
                                            @php($image = "signalred.png")
                                        @endif
                                        <h5> <img class="signal" src="{{url('front/img/'.$image)}}" style="width: 2rem;" alt="">{{$broker->min_spread}}{{__("pips")}} </h5>
                                    </div>

                                    <div class="col-lg-3 col-md-3 col-sm-4  bromaxleverage">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  ">{{__("MAX LEVERAGE")}} </p>
                                        <h5>{{$broker->max_leverage}} </h5>
                                    </div>

                                    <div class="col-lg-5 col-md-5 col-sm-4  brocurrencypass">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  ">{{__("CURRENCY PASS")}} </p>
                                        <h5> {{$broker->currency_pass}} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-6 col-sm-6  broregulated ">
                                @inject('items','App\Models\BrokerLicense') {{-- inject before foreach --}}
                                @php($result = $items->with('licenseDetail')->where([['broker_id', $broker->id]])->get())
                                @if($result->count())
                                    <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  ">{{__("REGULATED BY")}} </p>
                                    <div class="row  broregulatedicon">
                                        @foreach($result as $license)
                                            @php($img = isset($license->licenseDetail->image) ? $license->licenseDetail->image : '')
                                            <div class="col-2">
                                                <img style="width: 15px;" src="{{url('uploads/license/'.$img)}}" alt="">
                                                <li style="list-style:none;  font-size:10px;"> {{$license->licenseDetail->name}} </li>
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6  customersupport">
                                <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black; ">
                                    {{__("CUSTOMER SUPPORT")}}
                                </p>
                                <h5> {{$broker->customer_support}} </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        @endforeach
    @endif
</div>
</div>
<!-- most trust FX end  -->
@endsection