var things = {};

things.datagridUrl = 'WorkStation/ws_base_list';
$(function() {
    case_sat();
});
function case_sat() {
    $('#charts').html('');  //清空 ie8修复
    var search_type = $('#search_type').text();
    if(search_type == '精确查询'){
        $('#search_type').text('联级查询');
        var type = 'link';
    }else{
        $('#search_type').text('精确查询');
        var type = 'unlink';
    }
    $('#charts').html('<div id="myChart" style="width: 100%;height: 100%;padding-top: 5px;"></div>');
    var myChart = echarts.init(document.getElementById('myChart'));
    //myChart.showLoading();
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
    // myChart.setOption(option2);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=Case/show_area_sat',
        type: 'POST',
        dataType: 'json',
        data:{
            type:type
        },
        success: function(info) {
            
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
			//myChart.hideLoading();
        }
    });
}