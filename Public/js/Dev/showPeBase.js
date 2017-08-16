var module = {};
var option = {
    title: {
        text: '执法仪使用情况',
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
module.broadcast = function() {
    app.datagrid('#datagrid', {
        url: 'Dev/pe_base_list',
        showDatagrid:false,
        columns: [
            [
                { field: 'areaname', title: '所属部门', width: 200, align: 'center' },
                { field: 'jyxm', title: '警员姓名', width: 200, align: 'center' },
                { field: 'jybh', title: '警员编号', width: 200, align: 'center' },
                { field: 'cpxh', title: '产品型号', width: 200, align: 'center' },
                {
                    field: 'status',
                    title: '状态',
                    width: 100,
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (v == 0) {
                            return '<span style="color:#a00">停用</span>';
                        } else if(v == 1){
                            return '<span style="color:orange">低频</span>';
                        } else if(v == 2){
                            return '<span style="color:#0a0">在用</span>';
                        }
                    }
                }
            ]
        ],
        otherView:module.otherView,
        otherViewSuccess:function(data){
            var chart = echarts.init(document.getElementById('chart'));
            chart.setOption(option);
        }
    });
};
module.show = 'chart';
module.otherView = function(info){
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
    option.series[0].data = data;
    return '<div id="chart" style="width:100%;height:100%;overflow-y:hidden;"></div>';
};
module.switchs = function(){
    if(module.show == 'table'){
        var showDatagrid = false;
        module.show = 'chart';
    }else{
        var showDatagrid = true;
        module.show = 'table';
    }
    app.extra('search',{
        datagrid:'#datagrid',
        showDatagrid:showDatagrid
    });
}
$(function() {
    module.broadcast();
});