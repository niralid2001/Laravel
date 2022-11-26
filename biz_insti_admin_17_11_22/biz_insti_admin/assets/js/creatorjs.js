function verify_bizz_verification($this) {
    $($this).css('display', 'none');
    var bizz_verification = $.trim($('#bizz_verification').val());
    var purchase_email = $.trim($('#purchase_email').val());
    var cust_domain = $.trim($('#cust_domain').val());

    if (bizz_verification != '' && purchase_email != '' && cust_domain != '') {
        var dataArr = {};
        dataArr['bizz_verification'] = $('#bizz_verification').val();
        dataArr['purchase_email'] = $('#purchase_email').val();
        dataArr['cust_domain'] = $('#cust_domain').val();

        $.post("https://bizzon.com/verify_bizzproducts_purchase/themeportal_verification/bizacademy.php", dataArr, function(data, status) {

            $($this).css('display', 'inline-block');
            var data = JSON.parse(data);
			console.log(data);
            if (data.value == '101') {
                // Succes
                $('#domaincheck').css('display', 'none');
                $('#reidrect').css('display', 'none');
                $('#errText').html('<span style="color:green;">Now Please complete installation process.</span>');
                document.cookie = "chkJS=yes;";
                $('#installerform').html(data.form);
                return false;
            } else if (data.value == '402') {
                // Invalid bizz verification
                $('#errText').html('<span style="color:red;">bizz verification is incorrect.</span>');
            } else if (data.value == '403') {
                // Invalid email
                $('#errText').html('<span style="color:red;">Email is incorrect.</span>');
            }else if (data.value == '404') {
                // Invalid email
                $('#errText').html('<span style="color:red;">bizz verification already used.</span>');
            }
            $($this).css('display', 'inline-block');
            return false;
        });
    } else {
        $('#errText').html('<span style="color:red;">You missed out details.</span>');
        $($this).css('display', 'inline-block');
        return false;
    }

}

	$(document).on('submit','.theme_btn',function(){
			var db_host = $('input[name="db_host"]').val();
			var db_name = $('input[name="db_name"]').val();
			var db_uname = $('input[name="db_uname"]').val();
			var db_pwd = $('input[name="db_pwd"]').val();
			if(db_host != 'undefined' && db_host ==""){
				$('#errText').html('<span style="color:red;">Hostname field can not be empty.</span>');
				return false;
			}
			if(db_name != 'undefined' && db_name ==""){
				$('#errText').html('<span style="color:red;">Database field can not be empty.</span>');
				return false;
			}
			if(db_uname != 'undefined' && db_uname ==""){
				$('#errText').html('<span style="color:red;">Username field can not be empty.</span>');
				return false;
			}
			
			$( ".theme_btn" ).submit();
		
	});