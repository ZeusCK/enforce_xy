// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.params = {};
var tree = new Tree('#area_list');
module.test = function(){
    var setting = {
            async: {
                enable: true,
                url: app.url('Area/ztree')
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            view: {
                expandSpeed: ""
            }/*,
            callback: {
                beforeExpand: beforeExpand,
                onAsyncSuccess: onAsyncSuccess,
                onAsyncError: onAsyncError
            }*/
        };
        $.fn.zTree.init($("#area_list"), setting);
}
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
module.search = function() {
    app.extra('search', {
        form: '#searchForm',
        datagrid: '#datagrid',
        parsedata:function(data){
            if(!judgeTime.judge(data.btime, data.etime)) return false;
            data.areacode = module.areacode;
            searchData = data;
        }
    });
};
module.clickTree = function(node) {
    module.areacode = node.areacode;
    module.areaname = node.text;
    $('#tip_area').text(node.text);
    $('#mu_ser').text(module.areaname);
    module.search();
}
$(function() {
    /*tree.loadData();
    $(tree.dom).tree({
        onClick: module.clickTree
    });*/
    module.test();
    var time = new Date();
    $('#etime').datetimebox('setValue',app.date('Y-m-d')+' 23:59:59');
    $('#btime').datetimebox('setValue',app.date('Y-m-d',app.time()-6*24*60*60)+' 00:00:00');
    $('#datagrid').datagrid({
        url: app.url('Log/sys_log_list'),
        title: '系统日志',
        fitColumns: true,
        fit: true,
        striped: true,
        rownumbers: true,
        pagination: true,
        pageSize: 15,
        pageNumber: 1,
        pageList: [2, 5, 10, 15, 20, 25, 30, 40, 50],
        pagePosition: 'bottom',
        toolbar: '#toolbar',
        columns: [
            [
                { field: 'id', title: 'id', checkbox: true },
                { field: 'areaname', title: '单位', width: 200, align: 'center' },
                { field: 'name', title: '用户', width: 200, align: 'center' },
                { field: 'cmt', title: '操作', width: 200, align: 'center' },
                { field: 'ip', title: 'IP地址', width: 200, align: 'center' },
                { field: 'module', title: '模块', width: 200, align: 'center' },
                { field: 'dte', title: '操作时间', width: 200, align: 'center' }
            ]
        ],
        onLoadSuccess: function(r) {
            if (r.total == 0) {
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left', '0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '16px' });
            } else if (r.error) {
                $.messager.alert('操作提示', r.error, 'info');
            }
        }
    });
    $('#searching').click(function() {
        var data = app.serializeJson('#form');
        if(!judgeTime.judge(data.btime, data.etime)){
            return false;
        }
        module.params = data;
        $('#datagrid').datagrid({
            queryParams: data
        });
    });
});