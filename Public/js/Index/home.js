//2017.7.10 改最新信息为工作台 by:wyl
var things = {};
things.datagridUrl = 'WorkStation/ws_base_list';
$(function() {
    case_sat();
});

function case_sat() {
    var myChart = echarts.init(document.getElementById('myChart'));
    myChart.showLoading();
    var option2 = {
        title: {
            text: '7天内警情对接情况'
        },
        tooltip: {},
        legend: {
            data: ['警情总数', '对接警情数', '未对接警情数']
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
            name: '警情总数',
            type: 'line',
            data: []
        }, {
            name: '对接警情数',
            type: 'line',
            data: []
        }, {
            name: '未对接警情数',
            type: 'line',
            data: []
        }]
    };
    myChart.setOption(option2);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=Case/show_home_sat',
        type: 'POST',
        dataType: 'json',
        success: function(info) {
            myChart.hideLoading();
            var xAxis = [];
            var ndata = [];
            var udata = [];
            var alldata = [];
            for (var x in info) {
                xAxis.push(x);
                alldata.push(info[x].num);
                ndata.push(info[x].alarms);
                udata.push(info[x].unalarms);
            }
            option2.xAxis.data = xAxis;
            option2.series[0].data = alldata;
            option2.series[1].data = ndata;
            option2.series[2].data = udata;
            myChart.setOption(option2);
        }
    });
}