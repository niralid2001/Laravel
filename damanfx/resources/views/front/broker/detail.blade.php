@extends('front.layout.main')
@section('css')
    <link class="js-stylesheet" href="{{ asset('plugins/parsley/parsley.css') }}" rel="stylesheet">
@endsection
@section('content')

<div class="headingtraslate">
<div class="container">
    <hr>
    <div class="d-flex justify-content-between align-item-center">
        <div>
            <div class=" d-flex  align-item-center p-2">
<!--                <button class="addbtn">
                    Add a review <i class="fa-solid fa-star"></i>
                </button>

                <div class="d-flex  align-item-center ">
                    <p class="totalreview"> totalReviewa(17) </p>
                </div>-->

                <div class="d-flex justify-content-center align-item-center p-2">
                    <div class="ratingper">
                        @php($total_reviews = 0)
                        @foreach($reviews as $review)
                            @php($total_reviews = $total_reviews + $review->review)
                        @endforeach
                        @php($total_reviews = $reviews->count() ? $total_reviews/$reviews->count() : 0)
                        @if(containsDecimal($total_reviews))
                            @php($total_reviews = number_format($total_reviews, 1, '.', ''))
                        @endif
                        {{$total_reviews}}/5
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex">
            <div>
                <h2 class="quicktext">{{isset($detail->name) ? $detail->name : ''}} {{__("Rating")}} </h2>
                <p class="quicktext"> {{__("Quick Subscribe")}} ({{$reviews->count()}})</p>
                <!--<p class="quicktext"> Capital is at risk <i class="fa-solid fa-triangle-exclamation"></i></p>-->
            </div>
            <div>
                <img src="{{url('public/uploads/broker/'.$detail->image)}}" class="img-fluid xtbimg">
            </div>
        </div>
    </div>
    <hr>
</div>
<!-- xtb detail start   -->
<div class="container">
    <div class="d-flex justify-content-center p-3">
        <h2 class="xtbheading"> {{isset($detail->name) ? $detail->name : ''}} {{__("Features")}}</h2>
    </div>
    <div>
        <table class="table">
            <tbody>
                @inject('items','App\Models\BrokerTradingPlatform') {{-- inject before foreach --}}
                @php($result = $items->with('platformDetail')->where([['broker_id', $detail->id]])->get())
                <tr>
                    <td>
                        @if($result->count())
                            @foreach($result as $record)
                                @if($loop->last)
                                    {{$record->platformDetail->name}}
                                @else
                                    {{$record->platformDetail->name.", "}}
                                @endif
                            @endforeach
                        @else
                            <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                        @endif
                    </td>
                    <td class="tradingplatform"> {{__("Trading Platforms")}} </td>
                </tr>

                <tr>
                    @inject('items','App\Models\BrokerLicense') {{-- inject before foreach --}}
                    @php($result = $items->with('licenseDetail')->where([['broker_id', $detail->id]])->get())
                    <td>
                        @if($result->count())
                            @foreach($result as $record)
                                @if($loop->last)
                                    {{$record->licenseDetail->name}}
                                @else
                                    {{$record->licenseDetail->name.", "}}
                                @endif
                            @endforeach
                        @else
                            <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                        @endif
                    </td>
                    <td class="tradingplatform"> {{__("Licenses")}} </td>
                </tr>

                <tr>
                    @inject('items','App\Models\BrokerLocalOffice') {{-- inject before foreach --}}
                    @php($result = $items->with('countryDetail')->where([['broker_id', $detail->id]])->get())
                    <td>
                        @if($result->count())
                            @foreach($result as $record)
                                @php($country = $record->countryDetail->shortname)
                                <img src="{{url('public/flags/'.$country.'.svg')}}" width="20px">
                            @endforeach
                        @else
                            <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                        @endif
                    </td>
                    <td class="tradingplatform"> {{__("Local Offices")}} </td>
                </tr>

                <tr>
                    @inject('items','App\Models\BrokerDepositOption') {{-- inject before foreach --}}
                    @php($result = $items->with('paymentOptionDetail')->where([['broker_id', $detail->id]])->get())
                    <td>
                        @if($result->count())
                            @foreach($result as $record)
                                @if($loop->last)
                                    {{$record->paymentOptionDetail->name}}
                                @else
                                    {{$record->paymentOptionDetail->name.", "}}
                                @endif
                            @endforeach
                        @else
                            <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                        @endif
                    </td>
                    <td class="tradingplatform"> {{__("Deposit Options")}} </td>
                </tr>

                <tr>
                    @inject('items','App\Models\BrokerWithdrawalOption') {{-- inject before foreach --}}
                    @php($result = $items->with('paymentOptionDetail')->where([['broker_id', $detail->id]])->get())
                    <td>
                        @if($result->count())
                            @foreach($result as $record)
                                @if($loop->last)
                                    {{$record->paymentOptionDetail->name}}
                                @else
                                    {{$record->paymentOptionDetail->name.", "}}
                                @endif
                            @endforeach
                        @else
                            <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                        @endif
                    </td>
                    <td class="tradingplatform"> {{__("Withdrawal Options")}} </td>
                </tr>

                <tr>
                    @inject('items','App\Models\BrokerTradingAsset') {{-- inject before foreach --}}
                    @php($result = $items->with('assetDetail')->where([['broker_id', $detail->id]])->get())
                    <td>
                        @if($result->count())
                            @foreach($result as $record)
                                @if($loop->last)
                                    {{$record->assetDetail->name}}
                                @else
                                    {{$record->assetDetail->name.", "}}
                                @endif
                            @endforeach
                        @else
                            <i class="fa-solid fa-ban" class=" c" style=" color:red;"></i>
                        @endif
                    </td>
                    <td class="tradingplatform"> {{__("Assets Available For Trading")}} </td>
                </tr>

                <tr>
                    <td> {{$detail->is_demo_account == 1 ? 'Yes' : 'No'}} </td>
                    <td class="tradingplatform"> {{__("Demo Account")}} </td>
                </tr>

                <tr>
                    <td> {{$detail->is_withdrawal_commission == 1 ? 'Yes' : 'No'}} </td>
                    <td class="tradingplatform"> {{__("Withdrawal Commission")}} </td>
                </tr>

                @if($detail->minimum_deposit_amount)
                    <tr>
                        <td> ${{$detail->minimum_deposit_amount}} </td>
                        <td class="tradingplatform"> {{__("Minimum Deposit Amount")}} </td>
                    </tr>
                @endif

                <tr>
                    <td> {{$detail->is_islamic_account == 1 ? 'Yes' : 'No'}} </td>
                    <td class="tradingplatform"> {{__("Islamic Account")}} </td>
                </tr>

                @if($detail->year_founded)
                    <tr>
                        <td> {{$record->year_founded}} </td>
                        <td class="tradingplatform"> {{__("Year Founded")}} </td>
                    </tr>
                @endif
            </tbody>
        </table>
        <p>{!! $detail->description !!}</p>
    </div>
</div>
<!-- xtb detail end  -->
<!-- FAQ about start  -->
@inject('items','App\Models\BrokerFaq') {{-- inject before foreach --}}
@php($result = $items->where([['broker_id', $detail->id],['is_archive', 0]])->get())
@if($result->count())
    <div class="container">
        <div class="d-flex justify-content-center p-3">
            <h2 class="xtbheading"> {{__("FAQ about")}} {{$detail->name}}</h2>
        </div>
        <div>
            <div class="accordion" id="accordionExample">
                @foreach($result as $faq)
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading{{$faq->id}}">
                            <button class="accordion-button accordingquestion" type="button" data-bs-toggle="collapse" data-bs-target="#collapse{{$faq->id}}" aria-expanded="true" aria-controls="collapse{{$faq->id}}">
                                {{$faq->question}}
                            </button>
                        </h2>
                        <div id="collapse{{$faq->id}}" class="accordion-collapse collapse show" aria-labelledby="heading{{$faq->id}}"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                {!! $faq->answer !!}
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endif
<!-- FAQ about end  -->

<!-- review start  -->
@if($reviews->count())
    <div class="container">
        <div>
            <div class="d-flex justify-content-end p-3">
                <h2 class="xtbheading"> {{__("Reviews")}} </h2>
            </div>
            @foreach($reviews as $review)
                <div>
                    <div class="d-flex justify-content-between">
                        <div class="d-flex">
                            @php($star = $review->review)
                            @for($i=0; $i<$star; $i++)
                                <i class="fa-solid fa-star staricon"></i>
                            @endfor
                            @for($i=$star; $i<5; $i++)
                                <i class="fa-regular fa-star staricon"></i>
                            @endfor
                        </div>

                        <div class="d-flex justify-content-between">
                            <div>
                                <h5> {{$review->name}} </h5>
                                <p> {{$review->created_at ? date('d/m/Y', strtotime($review->created_at)) : ''}} </p>
                            </div>
                            <div>
                                <div class="reviewbg"> {{getInitials($review->name)}} </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <p> {{$review->comment}} </p>
                    </div>
                </div>
                <hr>
            @endforeach
        </div>
    </div>
@endif
<!-- review end  -->
<!-- share for rating  start   -->
<div class="container">
    <div class="d-flex justify-content-end p-3">
        <h2 class="xtbheading"> {{__("Share your rating for this Company")}}</h2>
    </div>
    <div>
        <form method="POST" action="{{route('front_broker-review-store')}}" id="news-form" enctype="multipart/form-data" data-parsley-validate="">
            @csrf
            <input type="hidden" name="broker_id" value="{{$detail->id}}">
            <div>
                <div class="star-source">
                    <svg>
                        <linearGradient x1="50%" y1="5.41294643%" x2="87.5527344%" y2="65.4921875%" id="grad">
                            <stop stop-color="gold" offset="0%"></stop>
                            <stop stop-color="gold" offset="60%"></stop>
                            <stop stop-color="gold" offset="100%"></stop>
                        </linearGradient>
                        <symbol id="star" viewBox="153 89 106 108">
                            <polygon id="star-shape" stroke="url(#grad)" stroke-width="5" fill="currentColor"
                                points="206 162.5 176.610737 185.45085 189.356511 150.407797 158.447174 129.54915 195.713758 130.842203 206 95 216.286242 130.842203 253.552826 129.54915 222.643489 150.407797 235.389263 185.45085">
                            </polygon>
                        </symbol>
                    </svg>
                </div>
                <div class="star-container">
                    <p class="choosetext" style="margin-top:-21px;margin-left:-146px;">{{__("Choose a rating from 1-5")}}</p>
                    <input type="radio" name="star" id="five" value="5" data-parsley-required-message="{{ __("This value is required.")}}">
                    <label for="five">
                        <svg class="star">
                            <use xlink:href="#star" />
                        </svg>
                    </label>
                    <input type="radio" name="star" id="four" value="4" required="" data-parsley-required-message="{{ __("This value is required.")}}">
                    <label for="four">
                        <svg class="star">
                            <use xlink:href="#star" />
                        </svg>
                    </label>
                    <input type="radio" name="star" id="three" value="3" required="" data-parsley-required-message="{{ __("This value is required.")}}">
                    <label for="three">
                        <svg class="star">
                            <use xlink:href="#star" />
                        </svg>
                    </label>
                    <input type="radio" name="star" id="two" value="2" required="" data-parsley-required-message="{{ __("This value is required.")}}">
                    <label for="two">
                        <svg class="star">
                            <use xlink:href="#star" />
                        </svg>
                    </label>
                    <input type="radio" name="star" id="one" value="1" required="" data-parsley-required-message="{{ __("This value is required.")}}">
                    <label for="one">
                        <svg class="star">
                            <use xlink:href="#star" />
                        </svg>
                    </label>
                </div>
            </div>
            <div>
                <!-- <p class="Fieldstext"> {{__("Fields with * are required")}}</p> -->
            </div>
            <div>
                <div class="row">
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="email" class="form-label">{{__("Email")}}<span class="text-danger">*</span></label>
                            <input type="email" class="form-control" name="email" data-parsley-type-message="{{__("This value should be a valid email.")}}" data-parsley-required-message="{{ __("This value is required.")}}" required="" id="email" aria-describedby="emailHelp">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="name" class="form-label"> {{__("Name")}}<span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="name" maxlength="20" data-parsley-required-message="{{ __("This value is required.")}}" required="" id="name">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="comment" class="form-label"> {{__("Comment")}}<span class="text-danger">*</span></label>
                        <textarea name="comment" class="form-control" required="" id="comment" rows="5" data-parsley-required-message="{{ __("This value is required.")}}"></textarea>
                    </div>
                </div>
                <button type="submit" class="tradingbtn">{{__("Send")}} </button>
            </div>
        </form>
    </div>
</div>
</div>

@endsection
@section('javascript')
    <script src="{{ asset('plugins/parsley/parsley.js') }}"></script>
@endsection