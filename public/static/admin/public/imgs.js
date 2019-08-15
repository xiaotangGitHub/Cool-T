$(function () {

    //当前对象，是否多图选择，是否更换当前图片
    var imgThat,multiple,currentChange;
    var name = 'imgs[]';
    var num = 15;
    var page = 1;
    var domain;

    //获取图片集
    function  getImgsResource( page ) {
        $( '.none-imgs,.imgs-resource-list-ul,#imgs-resource-list-page,#eq-img-resource' ).hide();
        $( '.load-imgs' ).show();
        $.post( getImgsResourceUrl, { 'page':page, 'cid':getCid(), 'num': num },function ( e ) {
            domain = e.domain;
            var length = e.data.length;
            if( length > 0 ){

                var html = '';
                for ( var i = 0; i < length; i++ ){

                    var imgSrc = e.domain+e.data[i]['img'];
                    var dataImg = e.data[i]['img'];
                    if( !e.qi_niu_status || e.qi_niu_status == 0 ){
                        imgSrc = e.domain+e.data[i]['path']+e.data[i]['img'];
                        dataImg = e.data[i]['path']+e.data[i]['img'];
                    }

                    if( e.data[i]['ext'] == 'mp4' || e.data[i]['ext'] == 'mp3' || e.data[i]['ext'] == 'ogg' || e.data[i]['ext'] == 'wav' ){
                        html += '      <li data-id="'+e.data[i]['id']+'" data-img="'+dataImg+'" data-ext="'+e.data[i]['ext']+'">\n' +
                            '                    <video controls="controls" src="'+e.domain+e.data[i]['img']+'"></video>\n' +
                            '                    <p class="filename">'+e.data[i]['name']+'</p>\n' +
                            '                    <div class="imgs-resource-selected">\n' +
                            '                        <i class="layui-icon layui-icon-ok"></i>\n' +
                            '                    </div>\n' +
                            '                </li>'
                    }else{

                        html += '      <li data-id="'+e.data[i]['id']+'" data-img="'+dataImg+'" data-ext="'+e.data[i]['ext']+'">\n' +
                            '                    <img src="'+imgSrc+'">\n' +
                            '                    <p class="filename">'+e.data[i]['name']+'</p>\n' +
                            '                    <div class="imgs-resource-selected">\n' +
                            '                        <i class="layui-icon layui-icon-ok"></i>\n' +
                            '                    </div>\n' +
                            '                </li>'
                    }
                }
                $('.imgs-resource-list-ul').show().html( html );
                $('#imgs-resource-list-page,#eq-img-resource').show();
                $( '.none-imgs,.load-imgs' ).hide();

                layui.use('laypage', function(){
                    var laypage = layui.laypage;
                    laypage.render({
                        elem: 'imgs-resource-list-page'
                        ,count: e.count
                        ,limit:num
                        , theme: '#5369cc'
                        ,curr:page
                        ,jump: function(obj, first){
                            //首次不执行
                            if(!first){
                                getImgsResource( obj.curr, num );
                            }
                        }
                    });
                });
            }else{
                $( '.load-imgs,.imgs-resource-list-ul' ).hide();
                $( '.none-imgs' ).show();
            }
        } );
    }

    //选中文件夹
    $('.imgs-dir-list').on('click','.input',function () {
        $('.imgs-dir-list .input').removeClass('active');
        $(this).addClass('active');
        $('.imgs-resource-selected').css( 'display','none' );
        $('.imgs-right-head').show();
        getImgsResource( page );
    });

    //点击修改图标
    $('.imgs-dir-list').on('click','.edit-imgs',function () {
        var that = $(this);
        var title = $(this).prev().val();
        var id = $(this).data('id');
        layer.prompt({title: '重命名文件夹', formType: 0,'value':title,'maxlength':10}, function( value ){
            var length = value.trim('').length;
            if( length > 0 ){
                ctAjax( editImgsCategory, { 'name': value, 'id': id },function ( e ) {
                    if( e.code == 200 ){
                        ctMsg( e.msg, 'success' );
                        layer.closeAll();
                        that.prev().val( value );
                    }else{
                        ctMsg( e.msg );
                    }
                } )
            }

        });
    });

    //添加文件夹
    $('.add-imgs').click(function () {
        layer.prompt({title: '新建文件夹', formType: 0,'maxlength':10}, function( value ){
            var length = value.trim('').length;
            if( length > 0 ){
                ctAjax( addImgsCategory, { 'name': value },function ( e ) {
                    layer.closeAll();
                    if( e.code == 200 ){
                        ctMsg( e.msg, 'success' );
                        var html = '             <li>\n' +
                            '                        <i class="glyphicon glyphicon-folder-open imgs-dir-icon"></i>\n' +
                            '                        <input type="text" class="imgs-dir-name input" readonly value="'+ value +'">\n' +
                            '                        <i class="glyphicon glyphicon-pencil edit-imgs" data-id="'+e.id+'"></i>\n' +
                            '                    </li>';
                        $('.imgs-dir-list ul').append( html );
                        var length = $('.imgs-dir-list ul').find('li').length;
                        if( length == 1 ){
                            $('.imgs-dir-list').find('li:eq(0)').find('.input').click();
                        }
                    }else{

                        ctMsg( e.msg, 'error' );
                    }
                } );
            }

        });
    });

    //删除文件夹
    $('.del-imgs').click(function () {
        var id = $('.imgs-dir-list').find('.active').next().data('id');
        if (id == undefined) {
            ctMsg('请选择要删除的文件夹', 'error');
            return false;
        }

        x0p(
            {
                title: '删除将无法恢复！',
                text: '仅删除文件夹的情况下，该文件夹下所在图片会移动至其它文件夹下；若无文件夹，则删除！',
                icon: 'info',
                animationType: 'pop',
                autoClose: null,
                buttons: [
                    {
                        type: 'cancel',
                        text: '取 消'
                    },
                    {
                        type: 'warning',
                        text: '仅删除文件夹',
                        showLoading: true
                    },
                    {
                        type: 'error',
                        text: '同时删除图片',
                        showLoading: true
                    }
                ]
            },
            //点击按钮后的回调
            function (e) {
                if( e == 'warning' ){
                    delRequest( 0 );
                }else if( e == 'error' ){
                    delRequest( 1 );
                }
            }
        );

        var delRequest = function ( type ) {
            ctAjax( delImgsCategory, { 'id':id, 'type':type },function ( e ) {
                ctCloseAlert();
                if( e.code == 200 ){
                    ctAlert( e.msg, '',{'load':false,'icon':'ok','title':'删除成功'}  );
                    $('.imgs-dir-list').find('.active').parent('li').remove();
                    var length = $('.imgs-dir-list').find('.active').length;
                    if( length < 1 ){
                        $('.imgs-right-head').hide();
                    }
                    getImgsResource( page );
                }else{
                    ctAlert( e.msg, '',{'load':false,'icon':'error','title':'删除失败'}  );
                }
            },{'load':false,'audio':true});
        }
    });

    //选中图片
    $('.imgs-resource-list').on('click','li',function () {
        var display = $(this).find('.imgs-resource-selected').css( 'display' );
        if( display == 'block' ){
            $(this).find('.imgs-resource-selected').css( 'display', 'none' );
        }else{
            $(this).find('.imgs-resource-selected').css( 'display', 'block' );
        }
    });

    //上传图片
    layui.use('upload', function(){
        var upload = layui.upload;
        upload.render({
            elem: '.ctUploadResourceImgs' //绑定元素
            ,url: upload_img_url //上传接口
            ,accept:'file'
            ,data: {
                cid: function(){
                    return getCid();
                }
            }
            ,done: function( e ){
                if( e.code == 200 ){
                    ctMsg( e.msg, 'success' );
                    getImgsResource( page );
                }else{
                    ctMsg( e.msg, 'error' );
                }
            }
            ,error: function(){
                ctMsg( '上传异常', 'warning' );
            }
        });
    });

    //删除图片
    $('.del-img').click(function () {
        var ids = [];
        $('.imgs-resource-list-ul').find('li').each(function () {
            var display = $(this).find('.imgs-resource-selected').css('display');
            if( display == 'block' ){
                ids.push( $(this).data('id') );
            }
        });
        var length = ids.length;
        if( length < 1 ){
            ctMsg( '请选择要删除的图片','error' );
            return false;
        }

        ctAjax( delImgsResourceUrl, { 'ids':ids.join(',') },function ( e ) {
            if( e.code == 200 ){
                ctMsg( e.msg, 'success' );
                $('.imgs-resource-list-ul').find('li').each(function () {
                    var display = $(this).find('.imgs-resource-selected').css('display');
                    if( display == 'block' ){
                        $(this).remove();
                    }
                });
            }else{
                ctMsg( e.msg, 'error' );
            }
        } );
    });

    //关闭图片库
    $('.imgs-close,#imgs-shade').click(function () {
        $('#imgs-shade,#imgs-resource').fadeOut( 300 );
        $('.imgs-resource-selected').css( 'display','none' );
    });
    //鼠标移入  ===>    显示编辑图标
    $('.imgs-dir-list').on('mouseover','li',function () {
        $(this).find('.edit-imgs').show();
    });
    //鼠标移入  ===>    隐藏编辑图标
    $('.imgs-dir-list').on('mouseout','li',function () {
        $(this).find('.edit-imgs').hide();
    });
    //多图 ===> 显示更换按钮
    $('.ctImgBoxs,.after-example-detail').on('mouseover','.li',function () {
        $(this).find('span').show();
    });
    //多图 ===> 隐藏更换按钮
    $('.ctImgBoxs,.after-example-detail').on('mouseout','.li',function () {
        $(this).find('span').hide();
    });

    //获取cid
    function getCid(){
        return $('.imgs-dir-list').find('.active').next().data('id');
    }

    //模拟点击第一个文件夹
    $('.imgs-dir-list').find('li:eq(0)').find('.input').click();


    //点击移动图片按钮
    $('.move-imgs-action').click(function () {
        var ids = [];
        $('.imgs-resource-list-ul').find('li').each(function () {
            var display = $(this).find('.imgs-resource-selected').css('display');
            if( display == 'block' ){
                ids.push( $(this).data('id') );
            }
        });
        var length = ids.length;
        if( length < 1 ){
            ctMsg( '请选择要移动的图片','error' );
            return false;
        }


        var categorys = [];
        var currentCid = getCid();
        $('.imgs-dir-list').find('li').each(function () {
            var otherCid = $(this).find('.edit-imgs').data('id');
            if( otherCid != currentCid ){
                var arr = {
                    'cid' : otherCid,
                    'name': $(this).find('.input').val()
                };
                categorys.push( arr );
            }
        });
        length = categorys.length;
        if( length < 1 ){
            ctMsg( '暂无其它文件夹','error' );
            return false;
        }

        var html = '';
        for( var i = 0; i < length; i++ ){
            html += '     <li class="pull-left mr15 mt5">\n' +
                '                        <input name="cid" type="radio" value="'+categorys[i]['cid']+'" class="pull-left">\n' +
                '                        <div class="mt4 pl3 pull-left">'+categorys[i]['name']+'</div>\n' +
                '                    </li>'
        }
        $('#moveImgsCategory-modal ul').html( html );

        ctShowModal( '#moveImgsCategory-modal', 100 );
    });

    //确认移动图片
    $('#moveImgsCategory-modal .eq-move-action').click(function () {

        var cid = $('#moveImgsCategory-modal').find('input:checked').val();
        if( !cid ){
            ctMsg( '请选择文件夹后移动', 'error' );
            return false;
        }

        var ids = [];
        $('.imgs-resource-list-ul').find('li').each(function () {
            var display = $(this).find('.imgs-resource-selected').css('display');
            if( display == 'block' ){
                ids.push( $(this).data('id') );
            }
        });

        ctAjax( moveImgsResourceUrl,{ 'ids':ids.join(','), 'cid':cid },function ( e ) {
            if( e.code == 200 ){
                ctMsg( e.msg, 'success' );
                ctCloseModal();
                getImgsResource( page );
            }else{
                ctMsg( e.msg, 'error' )
            }
        } );
    });

    //多图显示图片集
    $('body').on('click','.ctUploadImgs',function () {
        var dataName = $(this).data('name');
        if( dataName && dataName != undefined ){
            name = dataName;
        }else{
            name = 'imgs[]';
        }
        $('#imgs-shade').fadeIn(300);
        $('#imgs-resource').fadeIn(300);
        multiple = true;
        imgThat = $(this);
        currentChange = false;
        $('.imgs-dir-list').niceScroll({
            cursorcolor: "#ccc",//#CC0071 光标颜色
            cursoropacitymax: 1, //改变不透明度非常光标处于活动状态（scrollabar“可见”状态），范围从1到0
            touchbehavior: false, //使光标拖动滚动像在台式电脑触摸设备
            cursorwidth: "5px", //像素光标的宽度
            cursorborder: "0", // 游标边框css定义
            cursorborderradius: "5px",//以像素为光标边界半径
            autohidemode: false, //是否隐藏滚动条
            zindex:999999999999,
        });
    });
    //单图显示图片集
    $('body').on('click','.ctUploadImg',function () {
        $('#imgs-shade').fadeIn(300);
        $('#imgs-resource').fadeIn(300);
        multiple = false;
        imgThat = $(this);
        currentChange = false;
        imgsLibraryScroll();
    });
    //替换当前图片 - 显示图片集
    $('.ctImgBoxs,.after-example-detail').on( 'click', 'span',function () {
        $('#imgs-shade').fadeIn(300);
        $('#imgs-resource').fadeIn(300);
        multiple = false;
        imgThat = $(this);
        currentChange = true;
        imgsLibraryScroll();
    });
    //删除当前图片
    $('body').on('click','.ctImgBoxs-del-imgs',function () {
        $(this).parents('.li').remove();
    });
    //选中使用的图片
    $('#eq-img-resource').click(function () {
        var imgsValue = [];
        var ext = [];
        $('.imgs-resource-list-ul').find('li').each(function () {
            var display = $(this).find('.imgs-resource-selected').css('display');
            if( display == 'block' ){
                imgsValue.push( $(this).data('img') );
                ext.push( $(this).data('ext') );
            }
        });
        var length = imgsValue.length;
        if( length < 1 ){
            ctMsg( '请选中图片后使用','error' );
            return false;
        }
        if( currentChange ){
            imgThat.prev().remove();
            if( ext[0] == 'mp4' || ext[0] == 'mp3' || ext[0] == 'ogg' || ext[0] == 'wav' ) {
                imgThat.parent().prepend( '<video src="'+domain+imgsValue[0]+'"></video>' );
            }else{
                imgThat.parent().prepend( '<img src="'+domain+imgsValue[0]+'">' );
            }
            imgThat.next().val( imgsValue[0] );
        }else{
            if( multiple ){
                var html = '';
                for ( var i = 0; i < length; i++  ){
                    if( ext[i] == 'mp4' || ext[i] == 'mp3' || ext[i] == 'ogg' || ext[i] == 'wav' ){
                        html += '<div class="li" style="display: block">\n' +
                            '       <video src="'+ domain+imgsValue[i] +'"></video>\n' +
                            '       <span>更换</span>\n' +
                            '       <input type="hidden" name="'+name+'" value="'+imgsValue[i]+'">\n' +
                            '     <div class="ctImgBoxs-del-imgs">×</div>'+
                            '   </div>';
                    }else{
                        html += '<div class="li" style="display: block">\n' +
                            '       <img src="'+ domain+imgsValue[i] +'" alt="">\n' +
                            '       <span>更换</span>\n' +
                            '       <input type="hidden" name="'+name+'" value="'+imgsValue[i]+'">\n' +
                            '     <div class="ctImgBoxs-del-imgs">×</div>'+
                            '   </div>';
                    }
                }
                imgThat.prev().append( html );
            }else{
                if( ext[0] == 'mp4' || ext[0] == 'mp3' || ext[0] == 'ogg' || ext[0] == 'wav' ) {
                    var html = '<video class="ctUploadImgShow" src="'+domain+imgsValue[0]+'"></video>';
                }else{
                    var html = '<img class="ctUploadImgShow" src="'+domain+imgsValue[0]+'">';
                }
                imgThat.parents('.form-group').find('.ctImgBoxDiv').fadeIn(300).html( html );
                imgThat.parents('.form-group').find('.ctImgVal').val( imgsValue[0] );
            }
        }

        $('#imgs-shade,#imgs-resource').hide();
        $('.imgs-resource-selected').css('display','none');
    });

});

