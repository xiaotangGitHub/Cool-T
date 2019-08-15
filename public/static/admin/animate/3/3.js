$("body").css('background-image','url(/static/admin/animate/3/bg.jpg)');
document.write("<script language=javascript src='/static/plugins/leaf/js/jquery.rotate.js'></script>");
document.write("<script language=javascript src='/static/plugins/leaf/js/jquery.classyleaves.js'></script>");
document.write('<link rel="stylesheet" href="/static/plugins/leaf/css/jquery.classyleaves.css">');
$(function () {
    new ClassyLeaves({
        leaves: 30,
        maxY: -150,
        multiplyOnClick: true,
        infinite: true,
        folder: '/static/plugins/leaf/images/leaves/'
    });
});