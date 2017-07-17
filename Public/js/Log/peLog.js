// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
module.params = {};
//导出
module.exports = function() {
    var exportInfo = {};
    exportInfo.datagrid = '#datagrid';
    exportInfo.params = module.params;
    exportInfo.delFields = ['id'];
    app.exportExcel(exportInfo);
};
$(function() {
    var time = new Date();
    $('#etime').datetimebox({ value: new Time(time, 0).init() });
    $('#btime').datetimebox({ value: new Time(time, 7).init() });
    $('#datagrid').datagrid({
        url: app.url('Log/pe_log_list'),
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
                { field: 'id', title: '', checkbox: true },
                { field: 'cpxh', title: '产品序号', width: 100, align: 'center' },
                { field: 'gzz_ip', title: '工作站IP', width: 100, align: 'center' },
                { field: 'name', title: '警员编号', width: 100, align: 'center' },
                { field: 'action', title: '日志类型', width: 100, align: 'center' },
                { field: 'rzsj', title: '日志时间', width: 100, align: 'center' }
            ]
        ],
        loadFilter: function(data) {
            if (data.error) {
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left', '0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '16px' });
                var info = {};
                info.total = 0;
                info.rows = [];
                return info;
            } else {
                return data;
            }

        },
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