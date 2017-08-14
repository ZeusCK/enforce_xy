var module = {};
var option = {
    title: {
        text: '服务器',
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
    return '<div id="chart" style="width:100%;height:100%"></div>';
}
module.switch = function(){
    if(module.show == 'table'){
        var showDatagrid = false;
        module.show = 'chart';
    }else{
        var showDatagrid = true;
        module.show = 'table';
    }
    app.extra('search',{
        datagrid:'#listServer',
        showDatagrid:showDatagrid,
        otherView:module.otherView
    });
    setTimeout(function(){
        if(!showDatagrid){
            var chart = echarts.init(document.getElementById('chart'));
            chart.setOption(option);
        }
    },2000);
}
module.broadcast = function() {
    app.datagrid('#listServer', {
        url: 'Server/server_list',
        columns: [
            [
                { field: 'server_ip', title: '服务器IP', width: 200, align: 'center' },
                { field: 'areaname', title: '所属部门', width: 200, align: 'center' },
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
                }
            ]
        ],
        showDatagrid:false,
        otherView:module.otherView
    });
}
$(function() {
    module.broadcast();
    setTimeout(function(){
        var chart = echarts.init(document.getElementById('chart'));
        chart.setOption(option);
    },2000);
});