$(function () {
    //错误码处理
    if( codeErrorMsg ){
        ctMsg( codeErrorMsg, 'error' );
    }

    //enter回车键绑定
    document.onkeydown = function (e) {
        if (!e) e = window.event;
        if ((e.keyCode || e.which) == 13) {
            
            if( $('.user').is(":focus") || $('.pass').is(":focus") || $('.yzm').is(":focus") ){
                var display = $('.btn').attr('disabled');
                if( !display ){
                    $( '#btn' ).click();
                }
            }

            if( $('.user_name').is(":focus") || $('.email').is(":focus") ){
                $( '#sendMail' ).click();
            }

        }
    };

    //提交
    $('#btn').click(function () {
        var data = $('form').serialize();
        $('form .btn').text( '正 在 登 陆 ...' ).css({'background':'rgba(123, 85, 85, 0.8)'}).attr('disabled',true);
        ctLoad('登陆中...');
        $.post( logging, data, function (a) {
                $('form .btn').text( '登 陆' ).css({'background':'rgba(195,102,102,0.8)'}).attr('disabled',false);
                if( a.code == 200 ){
                    ctMsg( a.msg, 'success', function () {
                        window.location.href = a.url;
                    } );
                }else{
                    ctCloseLoad();
                   ctMsg( a.msg, 'error' );
                }
                $(".yzmImg").click();
                token();
        });
    });

    //token
    token();
    function token() {
        $.get( '/create_token',{},function (token) {
            $('#token').val( token );
        })
    }
    
    //密码找回
    $('#sendMail').click(function () {
        ctLoad('验证中...');
        var user_name = $('.user_name').val();
        var email = $('.email').val();
        $.post( sendEmail, {'user_name':user_name,'email':email},function (a) {
            ctCloseLoad();
            if( a.code == 200 ){
                ctMsg( a.msg, 'success', function () {
                    $('.user_name').val('');
                    $('.email').val('');
                    ctCloseModal();
                }, 3000 );
            }else{
                ctMsg( a.msg, 'error' );
            }
        } )
    });
});