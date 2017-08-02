//2017.7.10 改最新信息为工作台 by:wyl
var things = {};
things.datagridUrl = 'WorkStation/ws_base_list';
$(function() {
    //最新信息
    app.datagrid('#myDatagrid', {
        url:things.datagridUrl,
        title: '工作站',
        columns: [
            [
                { field: 'id', title: 'id', checkbox: true },
                { field: 'gzz_ip', title: '工作站IP', align: 'center' },
                { field: 'areaname', title: '地址', width: 200, align: 'center' },
                { field: 'zxztname', title: '在线状态', width: 200, align: 'center' },
                { field: 'ztsj', title: '最后在线时间', width: 200, align: 'center' },
                { field: 'qyztname', title: '启用状态', width: 200, align: 'center' }
            ]
        ]
    });
    var myChart3 = echarts.init(document.getElementById('myChart3'));
    var ws_sat = app.tp.ajax + '?tpUrl=WorkStation/ws_sat';
    myChart3.showLoading();
    var option3 = {
        title: {
            text: '工作站',
            subtext: '',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['在线', '离线']
        },
        series: [{
            name: '工作站状态',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
    myChart3.setOption(option3);
    $.ajax({
        url: ws_sat,
        type: 'POST',
        dataType: 'json',
        success: function(info) {
            myChart3.hideLoading();
            option3.series[0].data = info;
            myChart3.setOption(option3);
        }
    })
    pe_sat_chart();
    law_sat();
    unusal_sat();
});

function unusal_sat() {
    var myChart = echarts.init(document.getElementById('myChart'));
    myChart.showLoading();
    var option2 = {
        title: {
            text: '异常数据周统计'
        },
        tooltip: {},
        legend: {
            data: ['未编辑数', '上传超时']
        },
        xAxis: {
            data: [],
            axisLabel: {
                interval: 0, //横轴信息全部显示
                rotate: -30, //-30度角倾斜显示
            }
        },
        yAxis: [{
            type: 'value',
            axisLabel: {
                formatter: '{value} 条'
            }
        }],
        series: [{
            name: '未编辑数',
            type: 'line',
            data: []
        }, {
            name: '上传超时',
            type: 'line',
            data: []
        }]
    };
    myChart.setOption(option2);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=Media/unusual_sat',
        type: 'POST',
        dataType: 'json',
        success: function(info) {
            myChart.hideLoading();
            var xAxis = [];
            var ndata = [];
            var udata = [];
            for (var x in info) {
                xAxis.push(x);
                ndata.push(info[x].nomark);
                udata.push(info[x].uploadmark);
            }
            option2.xAxis.data = xAxis;
            option2.series[0].data = ndata;
            option2.series[1].data = udata;
            myChart.setOption(option2);
        }
    });
}

function law_sat() {
    var myChart2 = echarts.init(document.getElementById('myChart2'));
    myChart2.showLoading();
    var option2 = {
        title: {
            text: '执法量周统计'
        },
        tooltip: {},
        legend: {
            data: ['执法量']
        },
        xAxis: {
            data: [],
            axisLabel: {
                interval: 0, //横轴信息全部显示
                rotate: -30, //-30度角倾斜显示
            }
        },
        yAxis: [{
            type: 'value',
            axisLabel: {
                formatter: '{value} 条'
            }
        }],
        series: [{
            name: '执法量',
            type: 'bar',
            itemStyle: {
                normal: { color: '#4ad2ff' }
            },
            data: []
        }]
    };
    myChart2.setOption(option2);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=Media/law_sat',
        type: 'POST',
        dataType: 'json',
        success: function(info) {
            myChart2.hideLoading();
            var xAxis = [];
            var data = [];
            for (var x in info) {
                xAxis.push(x);
                data.push(info[x]);
            }
            option2.xAxis.data = xAxis;
            option2.series[0].data = data;
            myChart2.setOption(option2);
        }
    });
}

function pe_sat_chart() {
    var myChart4 = echarts.init(document.getElementById('myChart4'));
    myChart4.showLoading();
    var option4 = {
        title: {
            text: '执法仪',
            subtext: '',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['活跃', '停用', '低下']
        },
        series: [{
            name: '执法仪使用情况',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };
    myChart4.setOption(option4);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=Dev/pe_base_list',
        type: 'POST',
        dataType: 'json',
        data: {
            count: true
        },
        success: function(info) {
            myChart4.hideLoading();
            var disdata = { name: '停用' };
            disdata.value = info.disuse;
            var activedata = { name: '活跃' };
            activedata.value = info.active;
            var usedata = { name: '低下' };
            usedata.value = info.use;
            var data = [];
            data.push(disdata);
            data.push(activedata);
            data.push(usedata);
            option4.series[0].data = data;
            myChart4.setOption(option4);
        }
    });
}