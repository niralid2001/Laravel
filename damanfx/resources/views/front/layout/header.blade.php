
<html  lang="<?php echo Session::get("locale") ?>"  >

    <head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>{{$site_title.' | '.$site_name}}</title>
	<!-- <link rel="stylesheet" href="arab.css"> -->

    <!-- fav icon -->
    <link rel="icon" type="image/png" sizes="96x96" href="{{ url('public/front/img/favicon-96x96.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ url('public/front/img/favicon-16x16.png') }}">
    <!-- <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">  -->

	<!-- bootstrap link  -->
	<link rel="stylesheet" href="{{asset('front/css/bootstrap.min.css')}}">

	<!-- slider link   -->
	<link rel="stylesheet" href="{{asset('front/css/swiper.css')}}" />
    

    <!-- link aos animation  -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">


	<!-- font awesome icon link  -->
	<link rel="stylesheet" href="{{asset('css/font-awesome.css')}}"
		integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="{{ asset('front/css/style.css') }}">

        <link rel="stylesheet" href="{{ asset('front/css/responsive.css') }}">
    
        <link class="js-stylesheet" href="{{ asset('plugins/notification/toastr.min.css') }}" rel="stylesheet">
        @yield('css')

	<style>
            .form-control.shadow-0:focus {
                    box-shadow: none;
            }

	</style>
    </head>

    <body class="common" style="background-color: whitesmoke;">

	<!-- navbar start  -->
     <div class="container"> 
         <div class=" navbarmain "> 
            <nav class="navbar navbar-expand-lg  " >
                <div class="container">
                    <a href="{{ route('front_/') }}"><img class="logoimg" style="width:8rem;" src="{{ url('front/img/logo.png') }}"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                    </button>
                    @php($segment = request()->segment(1))
                    <div class="collapse navbar-collapse arabnav" id="navbarSupportedContent">
                        <ul class="navbar-nav  mb-2 mb-lg-0 navaitemshead ">
                            <li class="nav-item nava-items" >
                                <a class="nav-link  @if($segment == 'brokers'){{'active'}}@endif" aria-current="page" href="{{route('front_brokers')}}">{{__('BROKERS')}} </a>
                            </li>
                            <li class="nav-item  nava-items " >
                                <a class="nav-link  " href="#"> {{__('MARKET NEWS')}}</a>
                            </li>
                            <li class="nav-item  nava-items "  >
                                <a class="nav-link  " href="#"> {{__('CRYPTO')}}</a>
                            </li>
                            <li class="nav-item  nava-items " >
                                <a class="nav-link   " href="#"> {{__('EDUCTION')}} </a>
                            </li>

                           
                        </ul>

                        <div class="starttradinghead">
                        <li class="nav-item nava-items" >
                                    <button class="starttrading" onclick="window.location.href='{{route('front_trade-now')}}'" type="submit"  > {{__('Start Trading Now')}}
                                            <i class="fa-solid fa-circle-arrow-right"></i>
                                    </button>
                            </li>


                            <div class="dropdown">
                                <button class=" dropdown-toggle langaugeicon" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-earth-americas earthicon nava" style="font-size: 1.5rem;
                                    padding-left: 20px;
                                    margin: 10px;
                                    "></i>
                                </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                        @include('front.language_switcher')
                                    </ul>
                                </div>
                        </div>
                    </div>
            </nav>
	</div>
     </div>
   
        <!-- navbar end  -->

        