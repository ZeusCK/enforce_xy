//2017.7.10 改最新信息为工作台 by:wyl
var things = {};
things.datagridUrl = app.url('WorkStation/ws_base_list');
$(function(){
    //最新信息
    $('#myDatagrid').datagrid({
        url:things.datagridUrl,
        title:'工作站',
        fitColumns:true,
        rownumbers:true,
        fit:true,
        pageSize:15,
        pageNumber:1,
        pageList:[2,5,10,15,20,25,30,40,50],
        columns:[[
          { field: 'id', title: 'id', checkbox: true },
          {field:'gzz_ip',title:'工作站IP',align:'center'},
          {field:'dz',title:'地址', width: 200, align:'center'},
          {field:'zxztname',title:'在线状态',width:200,align:'center'},
          {field: 'ztsj', title: '最后在线时间', width: 200, align: 'center' },
          {field: 'qyztname', title: '启用状态', width: 200, align: 'center' }
        ]],
        pagination:true,
        onLoadSuccess:function(r){
            if(r.total==0){
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left','0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({'color':'#F00','text-align':'center','font-size':'16px'});
            }else if(r.error){
                $.messager.alert('操作提示', r.error,'info');
            }
        }
    });
        var myChart3 = echarts.init(document.getElementById('myChart3'));
        var ws_sat = app.url('WorkStation/ws_sat');
        $.ajax({
            url: ws_sat,
            type: 'POST',
            dataType:'json',
            success: function(info){
                var option3 = {
                                title : {
                                    text: '工作站',
                                    subtext: '',
                                    x:'center'
                                },
                                tooltip : {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    data: ['在线','离线']
                                },
                                series : [
                                    {
                                        name: '工作站状态',
                                        type: 'pie',
                                        radius : '55%',
                                        center: ['50%', '60%'],
                                        data:info,
                                        itemStyle: {
                                            emphasis: {
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            }
                                        }
                                    }
                                ]
                            };
                myChart3.setOption(option3);
            }
        })
    pe_sat_chart();
    law_sat();
    unusal_sat();
});
function unusal_sat(){
    var myChart = echarts.init(document.getElementById('myChart'));
    $.ajax({
        url: app.url('Media/unusual_sat'),
        type: 'POST',
        dataType:'json',
        success: function(info){
            var xAxis = [];
            var ndata  = [];
            var udata  = [];
            for(var x in info){
                xAxis.push(x);
                ndata.push(info[x].nomark);
                udata.push(info[x].uploadmark);
            }
            var option2 = {
                title: {
                    text: '异常数据周统计'
                },
                tooltip: {},
                legend: {
                    data:['未编辑数','上传超时']
                },
                xAxis: {
                    data: xAxis,
                    axisLabel:{
                        interval:0,//横轴信息全部显示
                        rotate:-30,//-30度角倾斜显示
                    }
                },
                yAxis: [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} 条'
                        }
                    }
                ],
                series: [{
                    name: '未编辑数',
                    type: 'line',
                    data: ndata
                },{
                    name: '上传超时',
                    type: 'line',
                    data: udata
                }]
            };
            console.log(ndata,udata);
            myChart.setOption(option2);
        }
    });
}
function law_sat(){
    var myChart2 = echarts.init(document.getElementById('myChart2'));
    $.ajax({
        url: app.url('Media/law_sat'),
        type: 'POST',
        dataType:'json',
        success: function(info){
            var xAxis = [];
            var data  = [];
            for(var x in info){
                xAxis.push(x);
                data.push(info[x]);
            }
            var option2 = {
                title: {
                    text: '执法量周统计'
                },
                tooltip: {},
                legend: {
                    data:['执法量']
                },
                xAxis: {
                    data: xAxis,
                    axisLabel:{
                        interval:0,//横轴信息全部显示
                        rotate:-30,//-30度角倾斜显示
                    }
                },
                yAxis: [
                    {
                        type : 'value',
                        axisLabel : {
                            formatter: '{value} 条'
                        }
                    }
                ],
                series: [{
                    name: '执法量',
                    type: 'bar',
                    itemStyle: {
                        normal: {color: '#4ad2ff'}
                    },
                    data: data
                }]
            };
            myChart2.setOption(option2);
        }
    });
}
function pe_sat_chart(){
    var myChart4 = echarts.init(document.getElementById('myChart4'));
    $.ajax({
        url: app.url('Dev/pe_base_list'),
        type: 'POST',
        dataType:'json',
        data:{
            count:  true
        },
        success: function(info){
            var disdata = {name:'停用'};
                disdata.value = info.disuse;
            var activedata = {name:'活跃'};
                activedata.value = info.active;
            var usedata = {name:'低下'};
                usedata.value = info.use;
            var data = [];
            data.push(disdata);
            data.push(activedata);
            data.push(usedata);
            var option4 = {
                title : {
                    text: '执法仪',
                    subtext: '',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['活跃','停用','低下']
                },
                series : [
                    {
                        name: '执法仪使用情况',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:data,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            myChart4.setOption(option4);
        }
    });
}

function show_detail(wjbh){
    var url=app.url('Media/play_video')+'?wjbh='+wjbh;
    var title='媒体详情';
    //弹窗的宽高
    var w=$(document).width()*3/4;
    var h=$(document).height()*3/4;
    //获得窗口的垂直位置
    var iTop = (window.screen.availHeight - 30 - h) / 2;
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth - 10 - w) / 2;
    window.open(url);
}