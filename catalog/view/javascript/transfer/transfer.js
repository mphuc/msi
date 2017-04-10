$(function(){
    'use strict';
    var delay = (function(){
      var timer = 0;
      return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
      };
    })();
    var _validate = {};
    var _fake_loading_show = function(){
        $('#fake_loading').fakeLoaderServer({
            timeToHide: 99999999999, //Time in milliseconds for fakeLoader disappear
            zIndex: "999999999", //Default zIndex
            spinner:"spinner3",
            bgColor: "rgba(0,0,0,0.5)", //Hex, RGB or RGBA colors
        });
    };
    var _fake_loading_hide = function(){
        $('#fake_loading').hide();
    };
    var delay = (function () {
        var timer = 0;
        return function (callback, ms) {
            clearTimeout(timer);
            timer = setTimeout(callback, ms);
        };
    })();
    
    $('#username').on('input propertychange',function(){
        $('#all_username').show();
        $('.transaction_compelte_username').hide();
        $('#user_send').val('');
        delay(function(){
            $.ajax({
                url : "index.php?route=account/transfer/get_like_username",
                type : "post",
                dateType:"text",
                data : {
                    'username' : $('#username').val()
                },
                success : function (result){
                    
                    $('#all_username').html(result);
                   
                }
            });
        }, 1000 );

    });

    $('#fr_buy_point').on('submit',function(){
        
        if ($('#username').val() == "" || $('#customer_id').val() == "" )
        {
            $('#username').css({'border':'1px solid red'});
            $('#username').focus();
            $('#username').attr('placeholder','Please enter username');
            
            return false;
        }

       if ($('#ip_usd').val() == "" || $('#ip_usd').val() < 10 || isNaN(parseFloat($('#ip_usd').val()))){
            $('.point_error').show();
            $('#ip_usd').css({'border':'1px solid red'});
            $('#ip_usd').focus();
            $('#ip_usd').attr('placeholder','Please enter USD number');
            
            return false;
        }
        if ($('#password_transaction').val() == "")
        {
            $('#password_transaction').css({'border':'1px solid red'});
            $('#password_transaction').focus();
            $('#password_transaction').attr('placeholder','Please enter password transaction');
            
            return false;
        }
        alertify.confirm('<h3 class="text-center" style="font-size:22px !important; text-transform:uppercase; color: #000; margin-bottom:15px;">Confirm transfer</h3> <p style="font-size:18px !important;color: #000;">ID receive: <b>'+$('#username').val()+'</b></p> <p style="font-size:18px !important;color: #000;">Amount send: <b>'+$('#ip_usd').val()+' USD</b></p><i  style="font-size:16px; margin-top:10px;">Click "OK" to execute transaction. Click "Cancel" to cancel</i></p>', function (e) {
        if (e) {
            window.funLazyLoad.start();
            window.funLazyLoad.show();
            $('#fr_buy_point').ajaxSubmit({
                type : 'POST',
                beforeSubmit : function(arr, $form, options) {
                    
                },
                success : function(result){
                    result = $.parseJSON(result);
                    if (result.password == -1)
                    {
                        $('#sucess_point_submit').hide();
                        $('#password_transaction').css({'border':'1px solid red'});
                        $('#password_transaction').focus();
                        $('#password_transaction').val('');
                        $('#password_transaction').attr('placeholder','Wrong password transaction');
                        window.funLazyLoad.reset();
                        return false;

                    }
                    if (result.money_transfer == 1)
                    {
                        $('#sucess_point_submit').hide();
                        $('#ip_usd').css({'border':'1px solid red'});
                        $('#ip_usd').focus();
                        $('#ip_usd').val('');
                        $('#ip_usd').attr('placeholder','You do not have enough USD');
                        window.funLazyLoad.reset();
                        return false;

                    }
                    if (result.complete == 1){
                        alertify.set('notifier','delay', 3000);
                        alertify.set('notifier','position', 'top-right');
                        window.funLazyLoad.reset();
                        alertify.success('Withdraw success !!!');
                        setTimeout(function(){ location.reload(true); }, 1000);
                        
                    }
                }
            });
        } 
        else 
        {
               
        }
    });
    return false;
        
        
    });
});
function choses_user(username,id){
    $('#username').val(username);
    $('#customer_id').val(id);
    $('#all_username').hide();
}

String.prototype.reverse = function () {
        return this.split("").reverse().join("");
    }
function reformatText(input) {    
    var x = input.value;
    x = x.replace(/,/g, ""); // Strip out all commas
    x = x.reverse();
    x = x.replace(/.../g, function (e) {
        return e + ",";
    }); // Insert new commas
    x = x.reverse();
    x = x.replace(/^,/, ""); // Remove leading comma
    input.value = x;
}
function numberWithCommas(x) {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1,$2");
    return x;
}
