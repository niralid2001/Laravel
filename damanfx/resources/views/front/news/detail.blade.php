@extends('front.layout.main')
@section('css')
    <link class="js-stylesheet" href="{{ asset('plugins/parsley/parsley.css') }}" rel="stylesheet">
@endsection
@section('content')
<div class="headingtraslate">
    <div class="container mb-5">
        <div class="row ">
            <div class="col-12 col-sm-6 col-md-5 col-lg-4  ">
                @if($brokers->count())
                    <div class="besttradhedings">
                        <h3>{{__("Best trading companies")}}&nbsp;&nbsp;<i class="fa fa-check-circle text-warning"></i></h3>
                    </div>
                    @foreach($brokers as $bdetail)
                        <div class=" row company-side-card mb-2">

                        <div class="col-4">
                        <a href='https://{{$bdetail->broker_url}}' target="_blank" class="dtradebtn" type="button" >{{__("TradeNow")}}</a>

                         <a href="{{url($bdetail->slug.'-'.$bdetail->id)}}" target="_blank"  class="dbrokerbtn"  type="button" >{{__("Broker Reviews")}}</a>
                        </div>

                        <div class="col-5">
                        <p style="margin:0px; padding:0px;">{{__("Minimum Deposit")}} : ${{$bdetail->minimum_deposit_amount}}</p>
                        <p style="margin:0px; padding:0px;">{{__("Leverage")}} : {{$bdetail->max_leverage}}</p>
                        @inject('items','App\Models\BrokerLicense') {{-- inject before foreach --}}
                                @php($result = $items->with('licenseDetail')->where([['broker_id', $bdetail->id]])->get())
                                @if($result->count())
                        <p style="margin:0px; padding:0px;">
                                        {{__("License")}} :
                                        @foreach($result as $record)
                                            @if($loop->last)
                                                {{$record->licenseDetail->name}}
                                            @else
                                                {{$record->licenseDetail->name.", "}}
                                            @endif
                                        @endforeach
                                    </p>
                                @endif
                        </div>

                        <div class="col-3">
                            <div class="minimumimg" >
                                    <div class="minimumimgposition">
                                        <img class="img-fluid   " src="{{url('uploads/broker/'.$bdetail->image)}}"  >
                                    </div>
                             </div>
                        </div>


                          
                        </div>
                    @endforeach
                @endif
                <div class="col-12 mt-3 mb-2">
                    <h3>{{__("OPEN A TRADING ACCOUNT")}}</h3>
                </div>
                <div class="col-12 row trade-form-side-card">
                    <form method="post" name="trading-form" data-parsley-validate action="{{route('front_save-trade-user')}}">
                        @csrf
                        <div class="form-group mb-3">
                            <label for="exampleFormControlInput1">{{__("Firstname")}}</label>
                            <input type="text" class="form-control" required="" id="fname" name="fname" placeholder="{{__("Firstname")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleFormControlInput1">{{__("Lastname")}}</label>
                            <input type="text" class="form-control" required="" id="lname" name="lname" placeholder="{{__("Lastname")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleFormControlInput1">{{__("Email")}}</label>
                            <input type="email" class="form-control" required="" id="email" name="email" data-parsley-type-message="{{__("This value should be a valid email.")}}" placeholder="{{__("Email")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleFormControlInput1">{{__("Phone")}}</label>
                            <input type="text" class="form-control num_only" required="" id="phone" name="phone" placeholder="{{__("Phone")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleFormControlSelect1">{{__("Investment Capital")}}</label>
                            <select class="form-control" name="investment_capital" required="" id="exampleFormControlSelect1" data-parsley-required-message="{{ __("This value is required.")}}">
                                <option>$1000 - 1</option>
                                <option>$5000 - 1000</option>
                                <option>$5000 < </option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">{{__("Submit")}}</button>
                    </form>
                </div>

                @if($reviews->count())
                    <div class="col-12 mt-3 mb-3">
                        <h3>{{__("Latest reviews of trading companies")}}&nbsp;&nbsp;<i class="fa fa-bookmark text-warning"></i></h3>
                    </div>
                    @foreach($reviews as $review)
                        <div class="col-12 row shadow-lg p-3 mb-3 bg-white rounded">
                            <div class="col-9">
                                <p>{{$review->comment}}</p>    
                            </div>
                            <div class="col-3">
                                @inject('items','App\Models\BrokerDetail') {{-- inject before foreach --}}
                                @php($result = $items->select('id', 'image')->where([['id', $review->broker_id]])->first())
                                <div class="reviewimg">
                                    <div class="reviewimgposition">
                                         <img class="img-fluid" src="{{url('uploads/broker/'.$result->image)}}" alt="">
                                     </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif

                @if(isset($ad_detail->image) && $ad_detail->image)
                    <div>
                        <div>
                            <a href="https://{{$ad_detail->add_url}}" target="blank">  <img class="img-fluid"  src="{{url('uploads/ads/'.$ad_detail->image)}}">   </a>   
                        </div>
                    </div>
                @endif
            </div>
            <div class="col-12 col-sm-6 col-md-7 col-lg-4 mt-3">
                <h3>{{isset($detail->title) ? $detail->title : ''}}</h3>
                <img class="img-fluid" src="{{url('uploads/news/'.$detail->image)}}" alt="">
                <p>
                    {!! isset($detail->description) ? $detail->description : '' !!}
                </p>
            </div>
        </div>
    </div>
</div>
@endsection
@section('javascript')
    <script src="{{ asset('plugins/parsley/parsley.js') }}"></script>
@endsection