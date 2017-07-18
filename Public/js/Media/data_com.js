//树的实例化
var tree = new Tree('#area_list');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
module.params = {};
module.clickTree = function(node) {
        module.areaid = node.id;
        module.areaname = node.text;
        $('#mu_ser').html(module.areaname);
        module.search();
    }
    //基本的搜索
module.show = function() {
        $('#searchForm').form('reset');
        $('#treegrid').treegrid('load', {
            areaid: module.areaid,
            rand: Math.random()
        });
    }
    //导出
module.exports = function() {
        var exportInfo = {};
        exportInfo.treegrid = '#treegrid';
        exportInfo.params = module.params;
        app.exportExcel(exportInfo);
    }
    //搜索事件 ----
module.search = function() {
    var data = app.serializeJson('#searchForm');
    if(!judgeTime.judge(data.btime, data.etime)){
        return false;
    }
    data.areaid = module.areaid;
    module.params = data;
    $('#datagrid').datagrid('load', data);
}
module.draw = function(info){
    var theight = $('#toolbar').height();
    var cheight = $('#chart').height();
    $('#chart').height(cheight-2*theight-5);
    var myChart = echarts.init(document.getElementById('chart'));
    var xAxis = [];
    var data  = [];
    for(var x in info){
        xAxis.push(x);
        data.push(info[x]);
    }
    var searchData = app.serializeJson('#searchForm');
    if(searchData.satType == 0){
        var text = module.areaname+'-警员及部门-执法出勤(周统计)';
    }else{
        var text = module.areaname+'-警员及部门-执法出勤(月统计)';
    }
    var name = '小时';
    var option = {
        title: {
            text: text,
            subtext: '平均时长比对(小时)'
        },
        tooltip: {},
        legend: {
            data:['各单位出勤情况比对']
        },
        xAxis: {
            data: xAxis,
            axisLabel:{
                interval:0,//横轴信息全部显示
                rotate:-30,//-30度角倾斜显示
            }
        },
        yAxis:{
                type : 'value',
                name : name,
                axisLabel : {
                    formatter: '{value}'
                }
            },
        series: [{
            name: '各单位出勤情况比对',
            type: 'bar',
            itemStyle: {
                normal: {color: '#4ad2ff'}
            },
            data: data
        }]
    };
    myChart.setOption(option);
}
$(function() {
    //初始化时间
    var time = new Date();
    $('#etime').datetimebox({ value: new Time(time, 0).init() });
    $('#btime').datetimebox({ value: new Time(time, 7).init() });
    //树的初始化
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick: module.clickTree
    });
    $('#infoAreaname').html('*' + module.areaname + '*添加/修改添加警员！');
    $('#mu_ser').html(module.areaname);
    $('#datagrid').datagrid({
        url: app.url('Media/data_comparison'),
        method: 'get',
        queryParams: {
            areaid: module.areaid,
            rand: Math.random()
        },
        title: '统计信息',
        loadFilter: function(data) {
            if(data.length == 0){
                $.messager.alert('查询提示','该部门下没有警员录入','info');
            }
            module.draw(data);
            var info = {};
            info.total = 0;
            info.rows = [];
            return info;
        },
    });
});