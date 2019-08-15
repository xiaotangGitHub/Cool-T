$("body").css('background-image','url(/static/admin/animate/4/bg.jpg)');
document.write("<script language=javascript src='/static/plugins/star/jquery-canvas-sparkles.js'></script>");
$(function () {
    $('#header').sparkle({
        color: 'rainbow',
        count: 20,
        overlap: 0,
        speed: 2,
        minSize: 15,
        maxSize: 25,
        direction: 'both'
    });
    $('#nav').sparkle({
        color: 'rainbow',
        count: 20,
        overlap: 0,
        speed: 2,
        minSize: 15,
        maxSize: 25,
        direction: 'both'
    });
    $('#article').sparkle({
        color: 'rainbow',
        count: 20,
        overlap: 0,
        speed: 2,
        minSize: 15,
        maxSize: 25,
        direction: 'both'
    });
    $('#logining').sparkle({
        color: 'rainbow',
        count: 20,
        overlap: 0,
        speed: 2,
        minSize: 15,
        maxSize: 25,
        direction: 'both'
    });
    $('#header').mouseover();
    $('#nav').mouseover();
    $('#article').mouseover();
    $('#logining').mouseover();
});