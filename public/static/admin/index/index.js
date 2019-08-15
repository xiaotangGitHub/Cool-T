$(function () {
    $.post( '', '', function ( data ) {

        //用户柱状图
        var usersOption = {
            color: ['#3398DB'],
            title: {
                'text': '用户统计',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
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
                    data : ['今日新增','昨日新增','本周新增','上周新增','本月新增','上月新增'],
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
                    name:'新增人数',
                    type:'bar',
                    barWidth: '40%',
                    data:[
                        data['users']['today'],
                        data['users']['yesterday'],
                        data['users']['week'],
                        data['users']['last_week'],
                        data['users']['month'],
                        data['users']['last_month'],
                    ]
                }
            ]
        };
        var users = echarts.init(document.getElementById('users'),'macarons');
        users.setOption( usersOption );

        //用户趋势图
        var length = data['users']['trend'].length;
        var usersDateName = [];
        var usersDateCount = [];
        for( var i=0; i<length; i++ ){
            usersDateName.push( data['users']['trend'][i]['date'] );
            usersDateCount.push( data['users']['trend'][i]['count'] );
        }
        var usersTrend = {
            color: ['#3398DB'],
            title: {
                'text': '用户增长趋势图',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'line'
                }
            },
            xAxis: {
                type: 'category',
                data: usersDateName
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name:'新增人数',
                data: usersDateCount,
                type: 'line',
                smooth: true
            }]
        };
        var usersTrendCharts = echarts.init(document.getElementById('usersTrend'),'macarons');
        usersTrendCharts.setOption( usersTrend );


        //商品订单柱状图
        var orderOption = {
            color: ['#3398DB'],
            title: {
                'text': '商品订单统计 ( 已支付 )',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
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
                    data : ['今日新增','昨日新增','本周新增','上周新增','本月新增','上月新增'],
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
                    name:'新增订单',
                    type:'bar',
                    barWidth: '40%',
                    data:[
                        data['order']['today'],
                        data['order']['yesterday'],
                        data['order']['week'],
                        data['order']['last_week'],
                        data['order']['month'],
                        data['order']['last_month'],
                    ]
                }
            ]
        };
        var order = echarts.init(document.getElementById('order'),'macarons');
        order.setOption( orderOption );

        //商品订单趋势图
        var length = data['order']['trend'].length;
        var orderDateName = [];
        var orderDateCount = [];
        for( var i=0; i<length; i++ ){
            orderDateName.push( data['order']['trend'][i]['date'] );
            orderDateCount.push( data['order']['trend'][i]['count'] );
        }
        var orderTrend = {
            color: ['#3398DB'],
            title: {
                'text': '商品订单增长趋势图 ( 已支付 )',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'line'
                }
            },
            xAxis: {
                type: 'category',
                data: orderDateName
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name:'新增订单',
                data: orderDateCount,
                type: 'line',
                smooth: true
            }]
        };
        var orderTrendCharts = echarts.init(document.getElementById('orderTrend'),'macarons');
        orderTrendCharts.setOption( orderTrend );


        //充值订单金额柱状图
        var rechargeOption = {
            color: ['#d15252'],
            title: {
                'text': '充值订单金额统计 ( 已支付 )',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
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
                    data : ['今日累计','昨日累计','本周累计','上周累计','本月累计','上月累计'],
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
                    name:'金额 ( 元 )',
                    type:'bar',
                    barWidth: '40%',
                    data:[
                        data['recharge']['today'],
                        data['recharge']['yesterday'],
                        data['recharge']['week'],
                        data['recharge']['last_week'],
                        data['recharge']['month'],
                        data['recharge']['last_month'],
                    ]
                }
            ]
        };
        var recharge = echarts.init(document.getElementById('recharge'),'macarons');
        recharge.setOption( rechargeOption );

        //充值订单金额趋势图
        var length = data['recharge']['trend'].length;
        var rechargeDateName = [];
        var rechargeDateCount = [];
        for( var i=0; i<length; i++ ){
            rechargeDateName.push( data['recharge']['trend'][i]['date'] );
            rechargeDateCount.push( data['recharge']['trend'][i]['count'] );
        }
        var rechargeTrend = {
            color: ['#d15252'],
            title: {
                'text': '充值订单金额增长趋势图 ( 已支付 )',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'line'
                }
            },
            xAxis: {
                type: 'category',
                data: rechargeDateName
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name:'金额 ( 元 )',
                data: rechargeDateCount,
                type: 'line',
                smooth: true
            }]
        };
        var rechargeTrendCharts = echarts.init(document.getElementById('rechargeTrend'),'macarons');
        rechargeTrendCharts.setOption( rechargeTrend );

        //预缴费订单金额柱状图
        var paymentAdvanceOption = {
            color: ['#d15252'],
            title: {
                'text': '预缴费订单金额统计 ( 已支付 )',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'shadow'
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
                    data : ['今日累计','昨日累计','本周累计','上周累计','本月累计','上月累计'],
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
                    name:'金额 ( 元 )',
                    type:'bar',
                    barWidth: '40%',
                    data:[
                        data['paymentAdvance']['today'],
                        data['paymentAdvance']['yesterday'],
                        data['paymentAdvance']['week'],
                        data['paymentAdvance']['last_week'],
                        data['paymentAdvance']['month'],
                        data['paymentAdvance']['last_month'],
                    ]
                }
            ]
        };
        var paymentAdvance = echarts.init(document.getElementById('paymentAdvance'),'macarons');
        paymentAdvance.setOption( paymentAdvanceOption );

        //预缴费订单金额趋势图
        var length = data['paymentAdvance']['trend'].length;
        var paymentAdvanceDateName = [];
        var paymentAdvanceDateCount = [];
        for( var i=0; i<length; i++ ){
            paymentAdvanceDateName.push( data['paymentAdvance']['trend'][i]['date'] );
            paymentAdvanceDateCount.push( data['paymentAdvance']['trend'][i]['count'] );
        }
        var paymentAdvanceTrend = {
            color: ['#d15252'],
            title: {
                'text': '预缴费订单金额增长趋势图 ( 已支付 )',
                left: 'center',
            },
            tooltip : {
                trigger: 'axis',
                axisPointer : {
                    type : 'line'
                }
            },
            xAxis: {
                type: 'category',
                data: paymentAdvanceDateName
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                name:'金额 ( 元 )',
                data: paymentAdvanceDateCount,
                type: 'line',
                smooth: true
            }]
        };
        var paymentAdvanceTrendCharts = echarts.init(document.getElementById('paymentAdvanceTrend'),'macarons');
        paymentAdvanceTrendCharts.setOption( paymentAdvanceTrend );

    });
});