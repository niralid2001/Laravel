@extends('front.layout.main')
@section('css')
    <link class="js-stylesheet" href="{{ asset('plugins/parsley/parsley.css') }}" rel="stylesheet">
@endsection
@section('content')
<div class="headingtraslate ">
    <div class="container tradingformmain">
        
            
                 <h3 class="tradingtitle">{{__("OPEN A TRADING ACCOUNT")}}</h3>
            
            <div class=" tradindformhead ">
                <div class="tradingform">
                <form method="post" name="trading-form" data-parsley-validate action="{{route('front_save-trade-user')}}">
                    @csrf
                    <div class="form-group mb-3">
                        <label for="exampleFormControlInput1">{{__("Firstname")}}</label>
                        <input type="text" class="form-control" maxlength="40" required="" id="fname" name="fname" placeholder="{{__("Firstname")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleFormControlInput1">{{__("Lastname")}}</label>
                        <input type="text" class="form-control" maxlength="40" required="" id="lname" name="lname" placeholder="{{__("Lastname")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleFormControlInput1">{{__("Email")}}</label>
                        <input type="email" class="form-control" required="" id="email" name="email" data-parsley-type-message="{{__("This value should be a valid email.")}}" placeholder="{{__("Email")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleFormControlInput1">{{__("Phone")}}</label>
                        <input type="text" class="form-control num_only" required="" id="phone" name="phone" maxlength="12" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  placeholder="{{__("Phone")}}" data-parsley-required-message="{{ __("This value is required.")}}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="exampleFormControlSelect1">{{__("Investment Capital")}}</label>
                        <select class="form-control" name="investment_capital" required="" id="exampleFormControlSelect1" data-parsley-required-message="{{ __("This value is required.")}}">
                            <option>$1000 - 1</option>
                            <option>$5000 - 1000</option>
                            <option>$5000 < </option>
                        </select>
                    </div>
                    <button type="submit" class="tradingbtn ">{{__("Submit")}}</button>
                </form>
            </div>
            </div>
        
    </div>
</div>
@endsection
@section('javascript')
    <script src="{{ asset('plugins/parsley/parsley.js') }}"></script>
@endsection