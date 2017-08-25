var things = {};

things.datagridUrl = 'WorkStation/ws_base_list';
$(function() {
    case_sat();
});
function case_sat() {
    var search_type = $('#search_type').text();
    if(search_type == '精确查询'){
        $('#search_type').text('联级查询');
        var type = 'link';
    }else{
        $('#search_type').text('精确查询');
        var type = 'unlink';
    }
    var myChart = echarts.init(document.getElementById('myChart'));
    myChart.showLoading();
    var option2 = {
        title: {
            text: '7天内未编辑视音频数据'
        },
        tooltip: {},
        legend: {
            data: ['未编辑视音频数']
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
            name: '未编辑视音频数',
            type: 'bar',
            data: []
        }]
    };
    myChart.setOption(option2);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=Case/show_area_sat',
        type: 'POST',
        dataType: 'json',
        data:{
            type:type
        },
        success: function(info) {
            myChart.hideLoading();
            var xAxis = [];
            var ndata = [];
            var udata = [];
            var alldata = [];
            for (var x in info) {
                xAxis.push(info[x].areaname);
                alldata.push(info[x].total);
                /*ndata.push(info[x].alarms);
                udata.push(info[x].unalarms);*/
            }
            option2.xAxis.data = xAxis;
            option2.series[0].data = alldata;
            /*option2.series[1].data = ndata;
            option2.series[2].data = udata;*/
            myChart.setOption(option2);
        }
    });
}