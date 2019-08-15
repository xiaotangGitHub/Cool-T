/**
 * @function        ajax调用
 * @param url       请求链接
 * @param func      回调函数
 * @param param     请求参数
 * @param options   参数集
 */
function ctAjax( url, param, func, options = '' ) {

    //初始化参数
    var init = {
        //是否显示加载中...
        'load'      :   true,
        //加载中显示的文本
        'loadDesc'  :   '请稍等...',
        //请求方式
        'method'    :   'post',
        //超时重连/s
        'timeout'   :   30000,
        //同异步 true：异步，false：同步
        'async'     :   true,
        //发生是否重连 true：重连，false：不重连
        'error'     :   true,
        //提示音
        'audio'     :   false
    };

    //参数赋值
    if( options.load != undefined )             init.load = options.load;
    if( options.loadDesc != undefined )         init.loadDesc = options.loadDesc;
    if( options.method != undefined )           init.method = options.method;
    if( options.timeout != undefined )          init.timeout = options.timeout;
    if( options.async != undefined )            init.async = options.async;
    if( options.error != undefined )            init.error = options.error;
    if( options.audio != undefined )            init.audio = options.audio;

    //加载
    if( init.load ) ctLoad( init.loadDesc );

    //ajax
    $.ajax({
        'url'       :   url,
        'type'      :   init.method,
        'data'      :   param,
        'dataType'  :   'json',
        'timeout'   :   init.timeout,
        'async'     :   init.async,
        success: function(data) {
            if( init.load ) ctCloseLoad();
            if( init.audio ) ctPlayMsgAudio();
            func && func(data);
        },
        error: function(e) {
            var errMsg = '系统错误！！ 错误码：' + e.status + '，' + e.statusText;
            ctMsg( errMsg , 'error', '', 4000 );
            //每三秒重连一次
            if( init.error ){
                ctTime({'func':function () {
                        ctAjax( url, param, func, options );
                        },'time':3000});
            }
        }
    });
}

/**
 * 延迟执行
 * @param options  参数集
 * @desc
 *      time：延迟时间
 *      type：1-刷新该页面，2-回到上一页，3-跳转至指定页面
 *      url：当type参数为3时跳转至该url
 *      func：回调函数
 */
function ctTime( options = '' ) {
    setTimeout(function () {
           options.func && options.func();
           if( options.type && ( options.type == 1 || options.type == 2 || options.type == 3 ) ){
               ctLoad( '请稍等...' );
           }
           switch ( options.type ) {
               case 1:          window.location.reload();
                   break;
               case 2:          window.history.back();
                   break;
               case 3:          window.location.href = options.url;
                   break;
           }
    },options.time ? options.time : 0);
}

/**
 * load加载层
 * @param discription 描述
 */
function ctLoad( discription ) {
    $('body').loading({'discription':discription});
}

/**
 * 关闭load加载
 */
function ctCloseLoad() {
    removeLoading('loading');
}

/**
 * 页面提示
 * @param msg       提示消息
 * @param type      提示类型    'success', 'error', 'info', 'warning'
 * @param func      回调函数
 * @param hideAfter 显示时间/s
 * @param audio     提示音  true:不播放
 */
function ctMsg( msg, type, func, hideAfter = 1000, audio ) {
    $.toast({'text':msg,'icon':type,'afterHidden':func && func(),'hideAfter':hideAfter,'beforeShow':function () {
            if( !audio ){
                ctPlayMsgAudio();
            }
        } });
}

/**
 * 弹出图片
 * @param img
 */
function ctAlertImg( img ) {
    console.log( img );
    layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        shadeClose: true,
        content: '<img style="display: block;margin: 10px auto" src="'+ img +'">',
        offset:'100px',
        area:['450px','450px']
    });
}

/**
 * 提示音
 */
function ctPlayMsgAudio() {
    if( msgAudioStatus == 1 ){
        var length = $('#fade-audio').length;
        if( length < 1 ){
            var audioHtml = '<audio id="fade-audio" style="display:none" src="/static/plugins/toast/music.mp3" controls="controls"></audio>';
            $('body').append( audioHtml );
        }
        var ctMsgAudio = document.getElementById("fade-audio");
        ctMsgAudio.currentTime = 0;
        ctMsgAudio.play();
    }
}

/**
 * tips提示
 * @param msg       提示内容
 * @param element   元素
 * @param input     是否为input框元素，true：$('input[name='+element+']');
 */
function ctTips( msg, element, input = false ) {
    if( input ){
        var e = $('input[name='+element+']');
        if( e.length < 1 ){
            e = $('textarea[name='+element+']');
        }
        if( e.length < 1 ){
            e = $('select[name='+element+']');
        }
    }else{
        e = $('.'+element);
        if( e.length < 1 ){
            e = $('#'+element);
        }
    }
    if( e.length > 0 ){
        e.focus();
        layer.tips( msg, e, {tips:[2,'#8a6d3b']} );
        var top = e.offset().top - 100;
        $('html, body').animate({
            scrollTop: top
        }, 500);
        e.parents('.form-group').addClass('has-warning');
        ctTime({'time':3000,'func':function () {
                e.parents('.form-group').removeClass('has-warning');
            }})
    }else{
        ctMsg( msg, 'error' );
    }

}

/**
 * 显示弹出框
 * @param text      弹出框文本内容
 * @param func      回调函数
 * @param options   参数集
 */
function ctAlert( text, func, options = '' ){
    if( !text ) text = '...';

    //初始数据
    var init = {
        //标题
        'title' : '系统提示',
        //类型 ok, warning, info, error
        'icon'  : 'info',
        //点击确认按钮后的加载
        load    :  true,
        //在指定时间后自动关闭/s，null：不关闭
        time    :  null,
        //点击确认按钮后，改变text显示值
        changeText : '正在执行中，请稍等...',
        //动画 pop, slideUp, slideDown, fadeIn
        'animationType' : 'pop',
    };

    //赋值
    if( options.title != undefined )         init.title = options.title;
    if( options.icon != undefined )          init.icon  = options.icon;
    if( options.load != undefined )          init.load  = options.load;
    if( options.time != undefined )          init.time = options.time;
    if( options.changeText != undefined )    init.changeText = options.changeText;
    if( options.animationType != undefined ) init.animationType = options.animationType;


    //调用
    x0p({
        title: init.title,
        text: text,
        icon: init.icon,
        animationType: init.animationType,
        autoClose:init.time,
        buttons: [
            {
                type: 'cancel',
                text: '取 消'
            },
            {
                type: init.icon,
                text: '确 认',
                showLoading: init.load
            }
        ]
    },
    //点击按钮后的回调
    function (e) {
        if( e == init.icon ){
            $("#x0popup #x0p-text-anchor .text").text( init.changeText );
            func && func();
        }
    })
}

/**
 * 关闭弹出框
 */
function ctCloseAlert(){
    var el = document.getElementById('x0popup');
    (el != null) && (el.parentNode.removeChild(el));
    var els = document.getElementById('x0p-overlay');
    (els != null) && (els.parentNode.removeChild(els));
}

/**
 * 设置指定字段值
 */
function ctSetField( that, options, url = '' ){
    if( options.id == 'checkedAll' ){
        var id = [];
        $('.ctTables .checkbox-id:checked').each(function () {
            id.push( $(this).val() );
        });
        if( id.length < 1 ){
            ctMsg( '请选择要操作的数据', 'error' );
            return false;
        }
        options.id = id;
    }
    ctAlert( '请确认是否执行操作！',function () {
        if( url ){
            ctAjax( url, options,function (e) {
                ctCloseAlert();
                if( e.code == 200 ){
                    ctAlert( e.msg, '',{'load':false,'icon':'ok','title':'操作成功'}  );
                    ctTime({'type':1,'time':700});
                }else{
                    ctAlert( e.msg, '',{'load':false,'icon':'error','title':'操作失败'}  );
                }
            },{'load':false,'audio':true});
        }else{
            ctAjax( set_field_url, options,function (e) {
                ctCloseAlert();
                if( e.code == 200 ){
                    ctAlert( e.msg, '',{'load':false,'icon':'ok','title':'操作成功'}  );
                    ctTime({'type':1,'time':700});
                }else{
                    ctAlert( e.msg, '',{'load':false,'icon':'error','title':'操作失败'}  );
                }
            },{'load':false,'audio':true});
        }

    });
}

/**
 * 操作
 */
$(function () {

    /**
     * form表单提交
     */
    $('.ct-form-submit').submit(function () {
        var method = $(this).data('method').toLocaleLowerCase();
        var url = $(this).data('url');
        var params = $(this).serialize();
        ctAjax( url, params, function (e) {
            if( e.code == 200 ){
                ctMsg( e.msg, 'success', function () {
                    ctTime({'func':function () {
                            if( !e.url ){
                                ctTime({'type':2});
                            }else{
                                ctTime({'type':3,'url':e.url});
                            }
                    },'time':500});
                } );
            }else{
                if( e.element ){
                    if( e.input ){
                        ctTips( e.msg, e.element, true );
                    }else{
                        ctTips( e.msg, e.element, false );
                    }

                    return false;
                }
                if( e.msg ){
                    ctMsg( e.msg, 'error' );
                }else{
                    ctMsg( e, 'error' );
                }

            }
        },{'method':method});

        return false;
    });

    /**
     * 删除单条数据
     */
    $('.ctTables .del').click(function () {
        var id = [];
        id.push( $(this).data( 'id' ) );
        ctAlert( '删除将不可恢复！请确认！',function () {
                ctAjax( del_url,{'id':id},function (e) {
                    ctCloseAlert();
                    if( e.code == 200 ){
                        ctAlert( e.msg, '',{'load':false,'icon':'ok','title':'删除成功'}  );
                        ctTime({'type':1,'time':700});
                    }else{
                        ctAlert( e.msg, '',{'load':false,'icon':'error','title':'删除失败'}  );
                    }
                },{'load':false,'audio':true});
        });
    });
    /**
     * 删除多条数据
     */
    $('.ctTable_delAll').click(function () {
        var id = [];
        $('.ctTables .checkbox-id:checked').each(function () {
           id.push( $(this).val() );
        });
        if( id.length < 1 ){
            ctMsg( '请选择要删除的数据', 'error' );
            return false;
        }
        var msg = '您选择了'+ id.length +'条数据，删除将不可恢复！请确认！';
        ctAlert( msg,function () {
            ctAjax( del_url,{'id':id},function (e) {
                ctCloseAlert();
                if( e.code == 200 ){
                    ctAlert( e.msg, '',{'load':false,'icon':'ok','title':'删除成功'}  );
                    ctTime({'type':1,'time':700});
                }else{
                    ctAlert( e.msg, '',{'load':false,'icon':'error','title':'删除失败'}  );
                }
            },{'load':false,'audio':true});
        });

    });

    /**
     * 生成数据缓存
     */
    $( '.setCache' ).click(function () {
        var url = $(this).data('url');
        if( !url ) url = '/admin/Cache/create';
        var type = $(this).data('type');
        ctAlert( '生成缓存将覆盖之前的缓存数据，请确认！', function () {
            ctAjax( url, {'type':type}, function (e) {
                ctCloseAlert();
                if( e.code == 200 ){
                    ctAlert( e.msg, '',{'load':false,'icon':'ok','title':'生成成功','time':1500}  );
                }else{
                    ctAlert( e.msg, '',{'load':false,'icon':'error','title':'生成成功'}  );
                }
            },{'load':false,'audio':true});
        },{'text':'缓存数据','changeText':'正在生成中...'} );
    });

    /**
     * 右上角管理员操作列目显示/隐藏
     */
    $('#adminBtn').hover(function () {
        $('.adminUl').css('display','block');
    },function () {
        $('.adminUl').css('display','none');
    });
    $('.adminUl').hover(function () {
        $('.adminUl').css('display','block');
    },function () {
        $('.adminUl').css('display','none');
    });
    /**
     * 右上角小程序操作列目显示/隐藏
     */
    $('#program_code').hover(function () {
        $('.programCodeUl').css('display','block');
    },function () {
        $('.programCodeUl').css('display','none');
    });
    $('.programCodeUl').hover(function () {
        $('.programCodeUl').css('display','block');
    },function () {
        $('.programCodeUl').css('display','none');
    });

    /**
     * 选中所有ctTables表格下的checkbox
     */
    $('.ctTable_selectAll').click(function () {
        var e = $(this).parents('.ctTablesFoot').prev('.ctTables');
        e.find('.checkbox-id').prop('checked','checked');
    });
    /**
     * 取消选中的所有ctTables表格下的checkbox
     */
    $('.ctTable_cancleAll').click(function () {
        var e = $(this).parents('.ctTablesFoot').prev('.ctTables');
        e.find('.checkbox-id').prop('checked',false);
    });

    /**
     * 头部菜单跳转
     */
    $("#header .menu a").click(function () {
        ctLoad( '加载中...' );
        var path = $(this).data('path');
        window.location.href = path;
    });

    /**
     * 左侧菜单跳转
     */
    $("#nav dd").click(function () {
        ctLoad( '加载中...' );
        var path = $(this).data('path');
        window.location.href = path;
    });

    /**
     * 搜索菜单
     */
    $('#searchMenu').submit(function () {
        var value = $(this).find('.searchMenu').val();
        if( !value ){
            ctMsg( '请输入要搜索的菜单', 'warning' );
            return false;
        }
        var url = $(this).attr( 'action' );
        ctAjax( url, {'name':value},function (e) {
            if( e.code == 200 ){
                ctTime({'url':e.url,'type':3});
            }else{
                ctMsg( e.msg, 'warning' );
            }
        } );
        return false;
    });

    /**
     * 返回上一页
     */
    $('.go-back').click(function () {
        ctLoad( '返回中...' );
        ctTime({type:2});
    });

    /**
     * 跳转缓冲
     */
    $('.head-right a').click(function () {
        if( $(this).attr('href') && $(this).data('load') !== false ){
            ctLoad( '请稍等...' );
        }
    });
    $('.ctTables td:last-child a').click(function () {
        if( $(this).attr('href') && $(this).data('load') !== false ){
            ctLoad( '请稍等...' );
        }
    });
    $('#header .right a').click(function () {
        if( $(this).attr('href') && $(this).data('load') !== false ){
            ctLoad( '请稍等...' );
        }
    });
    $('.paginate a').click(function () {
        if( $(this).attr('href') && $(this).data('load') !== false ){
            ctLoad( '加载中...' );
        }
    });

    /**
     * 表单清空
     */
    $('#reset').click(function () {
        var url = (window.location.href).split('?');
        ctTime( {'url':url[0],'type':3} );
    });
    /**
     * 时间筛选
     */
    var time_type = $('.search-form').find('.time_type').val();
    $('.search-form').find('.search-time').hide();
    $('.search-form').find('.'+time_type).show();
    $('.search-form .time_type').change(function () {
        var value = $(this).val();
        $('.search-form').find('.search-time').hide().find('input').val('');
        $('.search-form').find('.'+value).show();
    });
    /**
     * tabs切换
     */
    $('.tabs').find('a').click(function () {
        ctLoad();
        var url = $(this).data('href');
        var params = getCurrentUrlParams();
        if( params ){
            var jumpUrl = url + '?' + params;
            ctTime( { 'type': 3, 'url': jumpUrl } );
        }else{
            ctTime( { 'type': 3, 'url': url } );
        }
    });
});

/**
 * 全局
 */
$(function () {

    /**
     * 主体内容宽度
     * @type {number}
     */
    var width = document.body.clientWidth - 190;
    $("section.container").width( width ).fadeIn(500);

    /**
     * 统一高度
     * @type {jQuery}
     */
    setTimeout(function () {
        var headerH = $('#header').height();
        var navH = $('#nav').height();
        var containerH = $('#container').height();
        var articleH = $('#article').height();
        var maxH = Math.max( navH, containerH, articleH );
        var height = document.body.clientHeight - headerH;
        if( maxH < height ){
            maxH = height;
        }
        $('#nav').height(maxH).css('min-height',maxH+'px');
        $('#container').css('min-height',maxH+'px');
        $('#article').height(maxH).css('min-height',maxH+'px');
        $('#footer').css('top',maxH+headerH).fadeIn(500);
    },100);

    /**
     * 高亮菜单
     * @type {jQuery}
     */
    var active = $('#nav').find('dd.active').length;
    if( active < 1 ){
        $('#nav').find('dd').each(function () {
            var path = $('#highlight_path').val();
            if( ( $(this).data('path').toLowerCase() ) == path.toLowerCase() ){
                $(this).addClass( 'active' );
                return false;
            }
        });
    }

    /**
     * 页面加载完毕提示
     */
    ctMsg( '加载完毕', 'success', '', 1000, true );

    /**
     * layDate日期控件
     */
    //年选择器
    laydate.render({
        elem: '.ctY'
        ,type: 'year'
    });
    //年月选择器
    laydate.render({
        elem: '.ctYM'
        ,type: 'month'
    });
    //日期选择器
    $('.ctYMD').each(function ( index, ctYMDthat ) {
        laydate.render({
            elem: ctYMDthat
            ,type: 'date'
        });
    });
    //时间选择器
    laydate.render({
        elem: '.ctHIS'
        ,type: 'time'
    });
    //日期时间选择器
    $('.ctYMDHIS').each(function ( index, ctYMDHISthat ) {
        laydate.render({
            elem: ctYMDHISthat
            ,type: 'datetime'
        });
    });

    /**
     * 颜色选择器
     */
    layui.use('colorpicker', function(){
        $('.color').each(function ( index, colorThat ) {
            var color = $(colorThat).parent().find('input').val();
            var colorpicker = layui.colorpicker;
            colorpicker.render({
                color:color,
                elem: colorThat
                ,done: function(color){
                    $(colorThat).parent().find('input').val( color );
                }
            });
        })
    });

    /**
     * 上传插件
     */
    layui.use('upload', function(){
        $('.ctUploadVideo').each(function ( index, videoThat ) {
            var upload = layui.upload;
            //执行实例
            var uploadInst = upload.render({
                elem: videoThat //绑定元素
                ,url: upload_video_url //上传接口
                ,accept:'video'
                ,done: function(res){
                    //上传完毕回调
                }
                ,error: function(){
                    //请求异常回调
                }
            });
        });
    });

    /**
     * select选择值变动对应DIV
     */
    $('.selectChange').change(function () {
        var div = $(this).find('option:checked').data('div');
        $('.selectChangeDiv').hide();
        $('.'+div).show();
    });

});

/**
 * 重置高度与滚动条
 */
function ctResizeScroll() {
    var headerH = $('#header').height();
    var navH = $('#nav').height();
    var containerH = $('#container').height();
    var articleH = $('#article').height();
    var maxH = Math.max( navH, containerH, articleH );
    var height = document.body.clientHeight - headerH;
    if( maxH < height ){
        maxH = height;
    }
    $('#nav').height(maxH).css('min-height',maxH+'px');
    $('#container').css('min-height',maxH+'px');
    $('#article').height(maxH).css('min-height',maxH+'px');
    $('#footer').css('top',maxH+headerH).fadeIn(500);
    $('body').getNiceScroll().resize();
}

/**
 * 获取当前url参数
 * @returns {string}
 * @constructor
 */
function getCurrentUrlParams() {
    var url = document.location.toString();
    var arrUrl = url.split("?");
    var para = arrUrl[1];
    return para;
}
