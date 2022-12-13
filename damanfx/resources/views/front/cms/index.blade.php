@extends('front.layout.main')
@section('content')
<!-- nodesposit start page  -->

<div class="headingtraslate">
<div class="container">
    <div class="depositbg ">
        <h4 class="depositheading">{{$pageInfo->name}} </h4>
    </div>
    <div class="depositborder">
        <div class="row">
            <div class="col-12">
                <p class="depositpara">
                    {!! $pageInfo->description !!}
                </p>
            </div>
        </div>
    </div>
</div>
</div>
@endsection