var module = {};
module.params = {};
//导出
module.exports = function(){
    var exportInfo = {};
    exportInfo.datagrid = '#datagrid';
    exportInfo.params = module.params;
    exportInfo.delFields = ['id'];
    exportInfo.rows = $('#datagrid').datagrid('getData').total;
    exportInfo.page = 1;
    app.exportExcel(exportInfo);
};
$(function(){
    var time=new Date();
    $('#etime').datetimebox('setValue',app.date('Y-m-d')+' 23:59:59');
    $('#btime').datetimebox('setValue',app.date('Y-m-d',app.time()-6*24*60*60)+' 00:00:00');
    $('#datagrid').datagrid({
        url:app.url('Log/ws_log_list'),
        title:'工作站日志',
        fitColumns:true,
        fit:true,
        striped:true,
        rownumbers:true,
        pagination:true,
        pageSize:15,
        pageNumber:1,
        pageList:[2,5,10,15,20,25,30,40,50],
        pagePosition:'bottom',
        toolbar:'#toolbar',
        columns:[[
            {field:'id',title:'',checkbox:true},
            {field:'gzz_ip',title:'工作站',width:100,align:'center'},
            {field:'dxbh',title:'文件编号',width:100,align:'center'},
            {field:'comment',title:'日志类型',width:100,align:'center'},
            {field:'rzsj',title:'日志时间',width:100,align:'center'}
        ]],
        onLoadSuccess:function(r){
            if(r.total==0){
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left','0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({'color':'#F00','text-align':'center','font-size':'16px'});                }else if(r.error){
                $.messager.alert('操作提示', r.error,'info');
            }
        }
    });
    $('#searching').click(function(){
        var data=app.serializeJson('#form');
        //if(data.btime>data.etime){
        //    $.messager.alert('操作提示','初始时间不能大于结束时间，请重新选择','info');
        //    return false;
        //}
        if(!judgeTime.judge(data.btime, data.etime)){
            return false;
        }
        module.params = data;
        $('#datagrid').datagrid({
            queryParams:data
        });
    });
});

