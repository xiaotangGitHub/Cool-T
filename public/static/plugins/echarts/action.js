$(function () {
    var option1 = {
        title: {
            text: '用户数量：1000',
            left: 'center',
            top:'-10'
        },
        tooltip: {
            trigger: 'item',

        },
        legend: {
            orient: 'horizontal', // 'vertical'
            icon:'pie',
            x: 'center',
            y: 'bottom',
            selectedMode:true,
            data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        },
        series: [
            {
                name:'访问来源',
                type:'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '20',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:234, name:'联盟广告'},
                    {value:135, name:'视频广告'},
                    {value:1548, name:'搜索引擎'}
                ]
            }
        ]
    };
    var option3 = {
        title: {
            text: '用户增长率',
            left: 'center',
        },
        color: ['#60de4c'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'直接访问',
                type:'bar',
                barWidth: '60%',
                data:[10, 52, 200, 334, 390, 330, 220]
            }
        ]
    };

    var e1 = echarts.init(document.getElementById('e1'),'macarons');
    var e2 = echarts.init(document.getElementById('e2'),'macarons');
    var e3 = echarts.init(document.getElementById('e3'),'macarons');
    var e4 = echarts.init(document.getElementById('e4'),'macarons');
    e1.setOption(option1);
    e2.setOption(option1);
    e3.setOption(option3);
    e4.setOption(option3);

});