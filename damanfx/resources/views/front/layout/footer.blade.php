<!-- footer start  -->
<div class="footermaindiv">
<section class="pt-4">
    <footer class=" footer" style="background:#f9f9f9;">
        <div class="container ">
            <div class="row py-2">
                <div class=" col-md-4 mb-4 mb-lg-0 pt-4"><img src="{{ url('front/img/logo.png') }}" alt="" width="180" class="mb-3">
                    @php($cmsInfo = getCmsPageName('1'))
                    @php($output=substr($cmsInfo->description,0, 210))
                    <p class="font-italic text-muted">{!! $output !!}</p>
                    <ul class="list-inline mt-4">
                        <li class="list-inline-item"><a href="http://{{$settings['twitter']}}" target="_blank" title="twitter"><i style="color: rgb(29, 155, 56 );" class="fa-brands fa-twitter"></i></a></li>

                        <li class="list-inline-item"><a href="http://{{$settings['facebook']}}" target="_blank" title="facebook"><i style="color: rgb(29, 155, 56 );" class="fa-brands fa-facebook"></i></a></li>

                        <li class="list-inline-item"><a href="http://{{$settings['instagram']}}" target="_blank" title="instagram"><i style="color: rgb(29, 155, 56 );" class="fa-brands fa-instagram"></i></a></li>

                        <li class="list-inline-item"><a href="http://{{$settings['linkedin']}}" target="_blank" title="linkedin"><i style="color: rgb(29, 155, 56 );" class="fa-brands fa-linkedin"></i></a></li>
                    </ul>
                </div>
                <div class=" col-md-4 mb-4 mb-lg-0 pt-4">
                    <h6 class="text-uppercase font-weight-bold mb-4">{{__("Company")}}</h6>
                    <ul class="list-unstyled mb-0">
                        @php($cmsInfo = getCmsPageName('1'))
                        @if(isset($cmsInfo->slug) && $cmsInfo->slug)
                            <li class="mb-2"><a href="{{isset($cmsInfo->slug) ? route('front_'.$cmsInfo->slug) : ''}}" class="text-muted">{{isset($cmsInfo->name) ? ucwords($cmsInfo->name) : ''}}</a></li>
                        @endif
                        
                    </ul>
                </div>
                <div class=" col-md-4 mb-lg-0 pt-4">
                    <h6 class="text-uppercase font-weight-bold mb-4">{{__("Newsletter")}}</h6>
                        
                    <div class="p-1 rounded border">
                        <div class="input-group">
                            <input type="email" id="newsemail" placeholder="{{__("Enter your email address")}}" style="font-size: 0.95rem; color: #aaa; font-style: italic;" aria-describedby="button-addon1" class="form-control border-0 shadow-0">
                            <div class="input-group-append">
                                <button id="subscribe" type="submit" class="btn btn-link"><i style="color: rgb(29, 155, 56 );" class="fa fa-paper-plane"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Copyrights -->
        <div class="bg-light py-2">
            <div class="container text-center">
                <p class="text-muted mb-0 py-2"> <b> {{__("All rights reserve")}} {{ '@'.$settings['copyright_year'] }} {{$settings['site_name']}} </b> </p>
            </div>
        </div>
    </footer>
</section>
</div>
<!-- footer end   -->
<!-- nodesposit end  page   -->
<script type="text/javascript" src="{{url('front/js/jquery.min.js')}}"></script>
<script type="text/javascript" src="{{url('front/js/popper.min.js')}}"></script>
<script type="text/javascript" src="{{url('front/js/bootstrap.min.js')}}"></script>

<!-- slider start -->

<script src="{{asset('front/js/swiper.js')}}"></script>
<script src="{{ asset('plugins/notification/toastr.min.js') }}"></script>

<!-- aos animaton link  -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
         AOS.init();
    </script>

<script>
    function myFunction() {
        var dots = document.getElementById("dots");
        var moreText = document.getElementById("more");
        var btnText = document.getElementById("myBtn");
        if (dots.style.display === "none") {
            dots.style.display = "inline";
            btnText.innerHTML = " Read more";
            moreText.style.display = "none";
        } else {
            dots.style.display = "none";
            btnText.innerHTML = "Read less";
            moreText.display = "inline";
        }
    }
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
        freeMode: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
</script>
<script>
    $(document).ready(function(){
        basic();

        $(document).on('click', '#subscribe', function(){
            var email = $('#newsemail').val();
            if(email == '' || email == null){
                toastr.error("{{__('Please Enter Your Email.')}}");
            } else {
                if( !validateEmail(email)){
                    toastr.error("{{__('Oops, it seems this is not a valid email address. Please correct the error to continue.')}}");
                } else {
                    $.ajax({
                        url : "{{route('front_save-subscriber')}}",
                        method : "post",
                        data : {email : email, _token:"{{ csrf_token() }}"},
                        success : function(result){
                            var json = $.parseJSON(result);
                            if(json.result == 'success'){
                                $('#newsemail').val('');
                                toastr.success("{{__('You have subscribed to our Newsletter.')}}");
                            } else if(json.result == 'error'){
                                toastr.error("{{__('That email address is already used. Please enter a new email address.')}}");
                            }
                        }
                    });
                }
            }
        });

        $(document).on('click', '.lang_drop', function(){
           var lang = $(this).data('lang');
           $.ajax({
                url : "{{route('front_change-language')}}",
                method : "post",
                data : {lang : lang, _token:"{{ csrf_token() }}"},
                success : function(result){
                }
            });
        });
        $(document).on('keypress', '#newsemail',function(e) {
            if (e.keyCode === 13) {
                $("#subscribe").trigger("click");
            }
        });
        // notification //
        <?php if (Session::get('error')) : ?>
            toastr.error('<?php echo Session::get('error') ?>');
        <?php endif; ?>
        <?php if (Session::get('errors')) : ?>
            toastr.error('<?php echo Session::get('errors')->first() ?>');
        <?php endif; ?>
        <?php if (Session::get('success')) : ?>
            toastr.success('<?php echo Session::get('success') ?>');
        <?php endif; ?>
        <?php if (Session::get('warning')) : ?>
            toastr.warning('<?php echo Session::get('warning') ?>');
        <?php endif; ?>
    });

    function validateEmail($email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test( $email );
    }

    function basic(){
        $("input").attr("autocomplete", "off");
        $("textarea").attr("autocomplete", "off");
        $("input[type=password]").attr("autocomplete", "new-password");
        $(".numeric").bind("keypress", function (e) {
            var keyCode = e.which ? e.which : e.keyCode;
            if (!((keyCode >= 48 && keyCode <= 57) || keyCode == 46)) {
                return false;
            }
        });
        $(".num_only").bind("keypress", function (e) {
            var keyCode = e.which ? e.which : e.keyCode;
            if (!((keyCode >= 48 && keyCode <= 57))) {
                return false;
            }
        });
    }
    function PreviewImage(no) 
    {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("uploadImage"+no).files[0]);
        oFReader.onload = function (oFREvent) 
        {
            document.getElementById("uploadPreview"+no).src = oFREvent.target.result;
            $('#uploadPreview'+no).removeClass('npPreviewImage');
            $('#uploadPreview'+no).addClass('previewImage');
        };
    }
</script>
@yield('javascript')
</body>

</html>