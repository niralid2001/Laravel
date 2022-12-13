@extends('front.layout.main')
@section('content')
<!-- slider start  -->
<div>
    <div class="slidetrasfrom">
		<div class="slidebg"   >
			<div class="container " data-aos="fade-up"   data-aos-duration="3000">
                <div >
                    <h2 > Lorem ipsum dolor sit amet adipisicing elit. Modi, nobis!</h2>
                    <p> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptatibus ex at praesentium iure
                        itaque odit consequatur. Repellat, reiciendis. </p>
                </div>
			</div>
		</div>
	</div>
</div>
<!-- slider end  -->
    <!-- most trust FX start  -->
<div class="headingtraslate">  
<div class="container">
    <div class="d-flex justify-content-center">
        <h2 class="mosttrust" style="font-size: 2rem;
                
                padding: 5px;
                margin:2rem 0rem;
                color:  rgb(29, 155, 56 ) ;
                border-bottom:  4px solid rgb(29, 155, 56 );
                text-direction:rtl;
                width: auto;">{{__("Most trusted FX Brokers")}} </h2>
    </div>
    <!-- card 1  -->
    @if($brokers->count())
        @foreach($brokers as $key => $broker)
            <section class="@if($key != 0) {{'mt-4'}} @endif" >
              <div>
                <div class="row  mosttrustedfxmain "  data-aos="zoom-in-up" >
                   <div class="col-md-3 col-lg-2 " style="background-color: rgb(255, 255, 255);  text-align: center;">
                    <div class="mostdet">
                        <div >

                            <a href="{{url($broker->slug.'-'.$broker->id)}}"><img class="img-fluid flipimg "  src="{{url('public/uploads/broker/'.$broker->image)}}" alt=""></a>
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
                            
                            <div class="starsicon" style="display: flex; justify-content: center; color: rgb(29, 155, 56 ); padding-bottom:10px;">
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
                                <p class="p-used" style="font-size: 0.8rem; opacity: 0.7; font-weight: 700; margin:0;"> {{__("USED BY")}} </p>
                                <p style="margin:0px;"> {{$broker->used_by}} {{__("Traders")}} </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-9 col-lg-10 " >

                        <div class="row mindepositcot" style="background-color: rgb(247, 247, 249); margin:0px; padding:10px">
                            <div class=" col-md-9 col-lg-8 ">
                                <div class="row  ">
                                    <div class="col-sm-6 col-md-4  col-lg-4  bromindeposit ">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("MIN DEPOSIT")}} </p>
                                        <li style=" font-weight: 700;  list-style: none; font-size: 0.8rem; ">
                                            <h4> ${{$broker->minimum_deposit_amount}} </h4>
                                        </li>
                                    </div>

                                    <div class="col-sm-6 col-md-3 col-lg-3 brotradinginstru">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("TRADING INSTRUMENTS")}} </p>
                                        <li style="font-weight: 700; list-style: none; font-size: 0.8rem; ">
                                            <h6> ${{$broker->trading_instruments}}</h6>
                                        </li>
                                    </div>
                                    <div class="col-sm-6 col-md-5 col-lg-5  tradingplatforms">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("TRADING PLATFORMS")}} </p>
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
                                            <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black; "> {{__("BONUS")}} </p>
                                            <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;" >
                                                <p> {{$result->bonusDetail->title.' '.$result->bonusDetail->amount}} </p>
                                            </li>
                                        @endif
                                    </div>

                                    <div class="col-sm-6 col-lg-3 col-md-3 pt-md-4 d-sm-none brotypeofbroker">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("TYPE OF BROKERS")}}</p>
                                        <li style=" font-weight: 700; list-style: none; font-size: 0.8rem;">
                                            <p> {{$broker->type_of_broker}} </p>
                                        </li>
                                    </div>

                                    <div class="col-sm-6 col-lg-5 col-md-5 pt-md-4  broallwedtrad">
                                        @inject('items','App\Models\BrokerTradingAsset') {{-- inject before foreach --}}
                                        @php($result = $items->with('assetDetail')->where([['broker_id', $broker->id]])->get())
                                        @if($result->count())
                                            <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("ALLOWED TRADING ASSETS")}} </p>
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

                            <div class="col-md-3 col-lg-2 col-sm-6  brodepositmethod">
                                @inject('items','App\Models\BrokerDepositOption') {{-- inject before foreach --}}
                                @php($result = $items->with('paymentOptionDetail')->where([['broker_id', $broker->id]])->get())
                                @if($result->count())
                                    <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  "> {{__("DEPOSIT METHODS")}} </p>
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

                            <div class="col-md-12 col-lg-2 col-sm-6  d-flex  align-items-center  justify-content-around ">
                                <div class="btnsection">
                                    <p href='https://{{$broker->broker_url}}' target="_blank" class="tradebtn"  type="button"  >{{__("TradeNow")}}</p>

                                    <button onclick="window.location.href='{{url($broker->slug.'-'.$broker->id)}}'" class="getbonusbtn" type="button" > {{__("BrokerReviews")}} </button>
                                </div>
                            </div>
                        </div>

                        <div class=" row d-flex justify-content-center align-items-center   " style="background-color: rgb(247, 247, 249); margin:0px 0px;">
                            <div class="col-lg-8 col-md-12 ">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 brominspread p-2 ">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black; "> {{__("MIN SPREAD")}}</p>
                                        @if($broker->min_spread == '0.0')
                                            @php($image = "signallogo.png")
                                        @elseif($broker->min_spread == '0.6')
                                            @php($image = "signalyellow.png")
                                        @else
                                            @php($image = "signalred.png")
                                        @endif
                                        <h5> <img class="signal" src="{{url('front/img/'.$image)}}" style="width: 2rem;" alt="">{{$broker->min_spread}}{{__("pips")}} </h5>
                                    </div>

                                    <div class="col-lg-3 col-md-3 col-sm-4 bromaxleverage">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;   ">{{__("MAX LEVERAGE")}} </p>
                                        <h5>{{$broker->max_leverage}} </h5>
                                    </div>

                                    <div class="col-lg-5 col-md-5 col-sm-4  brocurrencypass ">
                                        <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;   ">{{__("CURRENCY PASS")}} </p>
                                        <h5> {{$broker->currency_pass}} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-md-6 col-sm-6   broregulated ">
                                @inject('items','App\Models\BrokerLicense') {{-- inject before foreach --}}
                                @php($result = $items->with('licenseDetail')->where([['broker_id', $broker->id]])->get())
                                @if($result->count())
                                    <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;    ">{{__("REGULATED BY")}} </p>
                                    <div class="row  broregulatedicon">
                                        @foreach($result as $license)
                                            @php($img = isset($license->licenseDetail->image) ? $license->licenseDetail->image : '')
                                            <div class="col-2">
                                                <img style="width: 15px;" src="{{url('uploads/license/'.$img)}}" alt="">
                                                <li style="list-style:none;  font-size:10px; "> {{$license->licenseDetail->name}} </li>
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                            <div class="col-lg-2 col-md-6 col-sm-6 customersupport">
                                <p class="mindeptext" style="text-decoration: none; font-size: 0.8rem; font-weight: 500; opacity: 0.8; color: black;  ">
                                    {{__("CUSTOMER SUPPORT")}}
                                </p>
                                <h5> {{$broker->customer_support}} </h5>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </section>
        @endforeach
    @endif
    <div class=" d-flex justify-content-center align-items-center   ">
        <button class="loadbtn" onclick="window.location.href='{{route('front_brokers')}}'" style="
            background: linear-gradient(90deg, rgba(69,161,68,1) 37%, rgba(141,191,69,1) 54%);
            border: none;
            padding: 5px 20px;
            margin-top:20px;
            color: white;
            font-size: 1.2rem;
            border-radius: 5px;
            margin-top:2rem;
            
            "> {{__("Load More Brokers")}} </button>
    </div>
</div>
<!-- most trust FX end  -->
<!-- card start  -->
    <section >
        <div class="bgcard" >
            <div class="container">
                @if($articals->count())

                <div class="d-flex justify-content-center"  >
                        <h2 class="letestposts"   style="color: rgb(29, 155, 56 );
                        padding: 5px;
                        margin: 10px;
                        border-bottom: 4px solid rgb(29, 155, 56 );
                        
                        width: auto;"> {{__("Letest Posts")}}</h2>
                </div>
                <div class="row"  >
                    @foreach($articals as $artical)
                        <div class="col-sm-6 col-md-6 col-lg-4  letestpostssec ">
                            <div class="card " style="height:100%;  ">
                                <a href="{{url($artical->slug.'-'.$artical->id)}}">
                                    <img class="card-img-top  commonimg" style="height: 200px;" src="{{'uploads/artical/'.$artical->image}}">
                                </a>
                                <div class="card-body">
                                <a href="#" > {{$artical->title}}  </a>  
                                    @php($output=substr($artical->description,0, 210))
                                    <p class="card-text" >{!! $output !!}</p>
                                    <p style="float:right; color:rgb(29, 155, 56 );"> {{$artical->created_at ? date('d/m/Y', strtotime($artical->created_at)) : ''}}</p>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        </div>
    </section>
<!-- card end  -->

<div class="container ">
    @if($bonus_details->count())
    <div class="pt-3">
        <div class="d-flex justify-content-center">
            <h2 class="letestposts" style="color: rgb(29, 155, 56 );
                padding: 5px;
                margin: 10px;
                border-bottom: 4px solid rgb(29, 155, 56 );
                
                width: auto;"> {{__("Broker Bonus Promotion")}} </h2>
        </div>
        <p  class="brokerbonustext">
            {{__("Read the latest commodity news and market analysis, written by our commodity trading
            experts and financial reporters. We cover major markets such as crude oil and gold, as
            well as smaller markets such as copper, silver, and gas. The articles on this page aim
            to give you an overview of these markets in general, as well as insight into what's
            driving certain prices and how this may affect your trades. Each article contains
            technical analysis too, so you can get a firm idea of when to enter/exit commodity trades.")}}
        </p>
    </div>

    @foreach($bonus_details as $value)
        <div  class="brokerbonushead">
            <div class="row "  data-aos="fade-right">
                <div class="col-12 col-sm-4 col-md-3 brokerbonusimgmain ">
                    <div>
                        <img  class="brokerbonusimg commonimg" src="{{url('uploads/bonus/'.$value->image)}}"  >
                    </div>
                </div>
                <div class="col-12 col-sm-8 col-md-9 ">
                    <h4 class="text-center">{{$value->title}}</h4>
                    
                    @php($output=substr($value->description,0, 210))
                    <p style="font-size:1.2rem; font-weight:600; word-spacing:5px; opacity: 0.8;">{!! $output !!}</p>

                    <div class=" brokerbonusmain ">
                        <a href="{{url($value->slug.'-'.$value->id)}}" class="bonuspromotionbtnbonus"
                        type="button" > <i class="fa-solid fa-gift"></i> {{__("Bonus")}} - ${{$value->amount}}</a>
                        
                        <button  class="bonuspromotionbtnendon"   
                         > <i class="fa-regular fa-clock"></i> {{__("End on")}} - {{date('d/m/Y', strtotime($value->end_date))}}</button>
                
                        <button  class="bonuspromotionbtnget"   > 
                        <i class="fa-solid fa-check"></i> {{__("Get Bonus")}} </button>
                    </div>
                    <div>

                    </div>
                
                </div>
            </div>
            
        </div>
    @endforeach
    @endif
</div>
<!-- letest news start  --> 



<div class="container">
    @if($news->count())
        <div class="d-flex justify-content-center">
            <h2 class="letestnew" style=" color: rgb(29, 155, 56 ); padding: 5px; margin: 10px; border-bottom: 4px solid rgb(29, 155, 56 ); 
            width: auto; margin-bottom:15px;"> {{__("Letest News")}}</h2>
        </div>


        <div class="row" data-aos="fade-up"  data-aos-anchor-placement="center-bottom" >
            @foreach($news as $record)                
                <div class="col-sm-6 col-md-6 col-lg-4  p-3">
                    <div class="card " style="height:100%; ">
                        <a href="{{url($record->slug.'-'.$record->id)}}">
                            <img class="card-img-top cardimg commonimg " style="height: 200px;" src="{{'uploads/news/'.$record->image}}">
                        </a>
                        <div class="card-body">
                            <a href="{{url($record->slug.'-'.$record->id)}}" style="color: rgb(29, 155, 56 ); font-size :1.3rem; "> {{$record->title}}</a>  
                            @php($output=substr($record->description,0, 210))
                            <p class="card-text" > {!! $output !!}</p>
                            <p style="float:right; color:rgb(29, 155, 56 ); font-size:1rem;">{{$record->created_at ? date('d/m/Y', strtotime($record->created_at)) : ''}} </p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif
</div>
<!-- </div> -->
<!-- letest news end  -->
@endsection