var things = {};
var module = {};
var option = {
    title: {
        text: '服务器',
        subtext: '',
        x: 'right'
    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    label:{
            normal:{
                show: true,
                formatter: '{b} : {c} ({d}%)',
                position: 'outer'
            }
        },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: ['在线', '离线']
    },
    series: [{
        name: '服务器状态',
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
module.otherView = function(info){
    var data = [];
    var offline = {name:'离线'};
    offline.value = info.offline;
    var online = {name:'在线'};
    online.value = info.online;
    data.push(offline);
    data.push(online);
    option.series[0].data = data;
    return '<div id="chart" style="width:100%;height:100%;overflow-y:hidden;"></div>';
}
module.switchs = function(){
    if(module.show == 'table'){
        var showDatagrid = false;
        module.show = 'chart';
    }else{
        var showDatagrid = true;
        module.show = 'table';
    }
    app.extra('search',{
        datagrid:'#listServer',
        showDatagrid:showDatagrid/*,
        otherView:module.otherView*/
    });
    /*setTimeout(function(){
        if(!showDatagrid){
            var chart = echarts.init(document.getElementById('chart'));
            chart.setOption(option);
        }
    },2000);*/
}
module.broadcast = function() {
    app.datagrid('#listServer', {
        url: 'Server/server_sat',
        columns: [
            [
                { field: 'areaname', title: '单位',  width: 200,align: 'center' },
                { field: 'total', title: '离线数',  width: 200,align: 'center' }/*,
                { field: 'phone', title: '联系电话', width: 200, align: 'center' },
                {
                    field: 'status_name',
                    title: '状态',
                    width: 100,
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (v == '离线') {
                            return '<span style="color:#a00">离线</span>';
                        } else {
                            return '<span style="color:#0a0">在线</span>';
                        }
                    }
                }*/
            ]
        ],
        toolbar:[{
            iconCls: 'icon-reload',
            handler: function(){module.switchs()}
        }],
        showDatagrid:false,
        otherView:module.otherView,
        otherViewSuccess:function(data){
            var chart = echarts.init(document.getElementById('chart'));
            chart.setOption(option);
        }
    });
}

var module2 = {};
var option2 = {
    title: {
        text: '采集站',
        subtext: '',
        x: 'right'
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
    label:{
            normal:{
                show: true,
                formatter: '{b} : {c} ({d}%)',
                position: 'outer'
            }
        },
    series: [{
        name: '采集站状态',
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
module2.otherView = function(info){
    var data = [];
    var offline = {name:'离线'};
    offline.value = info.offline;
    var online = {name:'在线'};
    online.value = info.online;
    data.push(offline);
    data.push(online);
    option2.series[0].data = data;
    return '<div id="chart2" style="width:100%;height:100%;overflow-y:hidden;"></div>';
}
module2.switchs = function(){
    if(module2.show == 'table'){
        var showDatagrid = false;
        module2.show = 'chart';
    }else{
        var showDatagrid = true;
        module2.show = 'table';
    }
    app.extra('search',{
        datagrid:'#listWorker',
        showDatagrid:showDatagrid
    });
}
module2.broadcast = function() {
    app.datagrid('#listWorker', {
        url: 'WorkStation/ws_sat',
        columns: [
            [
                { field: 'areaname', title: '单位', width: 200,align: 'center' },
                { field: 'total', title: '离线数', width: 200,align: 'center' }/*,
                { field: 'fzr', title: '负责人', width: 200, align: 'center' },
                { field: 'dh', title: '负责人电话', width: 200, align: 'center' },
                {
                    field: 'zxztname',
                    title: '在线状态',
                    width: 100,
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (v == '离线') {
                            return '<span style="color:#a00">离线</span>';
                        } else {
                            return '<span style="color:#0a0">在线</span>';
                        }
                    }
                }*/

            ]
        ],
        toolbar:[{
            iconCls: 'icon-reload',
            handler: function(){module2.switchs()}
        }],
        showDatagrid:false,
        otherView:module2.otherView,
        otherViewSuccess:function(data){
            var chart2 = echarts.init(document.getElementById('chart2'));
            chart2.setOption(option2);
        }
    });
}
/*$(function() {
    setTimeout(function(){
        module.broadcast();
    },1500);  
});*/

/*$(function() {
    setTimeout(function(){
        
    },1500); 

});*/
things.datagridUrl = 'WorkStation/ws_base_list';
$(function() {
    var h = $('body').height()-$('#charts').height();
    console.log(h);
    $('#server').height(h);
    $('#worker').height(h);
    try{
        module.broadcast();
    }catch(e){};
    module2.broadcast();
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
            text: '编辑视音频数据预警'
        },
        tooltip: {},
        legend: {
            data: ['上传数据','未编辑数据','已编辑数据']
        },
        xAxis: {
            data: [],
            axisLabel: {
                interval: 0, //横轴信息全部显示
                rotate: -30, //-30度角倾斜显示
            }
        },
        label:{
            normal:{
                show: true,
                position: 'outer'
            }
        },
        yAxis: [{
            type: 'value',
            axisLabel: {
                formatter: '{value} 条'
            }
        }],
        series: [
            {
                name: '上传数据',
                type: 'line',
                data: []
            },
            {
                name: '未编辑数据',
                type: 'line',
                data: []
            },
            {
                name: '已编辑数据',
                type: 'line',
                data: []
            }
        ]
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
                alldata.push(info[x].all);
                ndata.push(info[x].untotal);
                udata.push(info[x].total);
            }
            option2.xAxis.data = xAxis;
            option2.series[0].data = alldata;
            option2.series[1].data = udata;
            option2.series[2].data = ndata;
            myChart.setOption(option2);
			//myChart.hideLoading();
        }
    });
}