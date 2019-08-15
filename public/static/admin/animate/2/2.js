
$("body").prepend('' +
    '<canvas id="rain-canvas"></canvas>\n' +
    '<canvas id="cloud-canvas"></canvas>     <!-- 固定云朵 weather.js line:304 -->\n' +
    '<canvas id="weather-canvas"></canvas>\n' +
    '<canvas id="time-canvas"></canvas>\n' +
    '<canvas id="lightning-canvas"></canvas>'
);
$("body").css('background-image','url(/static/admin/animate/2/bg.jpg)');
document.write("<script language=javascript src='/static/plugins/weather/js/weather.js'></script>");
document.write('<link rel="stylesheet" href="/static/plugins/weather/css/weather.css">');