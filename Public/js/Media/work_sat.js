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
    $('#datagrid').datagrid('load', {
        areaid: module.areaid,
        rand: Math.random()
    });
};
//搜索事件 ----
module.search = function() {
    var searchFormV = app.serializeJson('#searchForm');
    if(!judgeTime.judge(searchFormV.btime, searchFormV.etime)){
        return false;
    }
    searchFormV.areaid = module.areaid;
    module.params = searchFormV;
    $('#datagrid').datagrid('load', searchFormV);
};
//导出
module.exports = function() {
    var exportInfo = {};
    exportInfo.datagrid = '#datagrid';
    exportInfo.params = module.params;
    app.exportExcel(exportInfo);
};
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
        url: app.url('Media/work_emp_sat'),
        method: 'get',
        queryParams: {
            areaid: module.areaid,
            rand: Math.random()
        },
        title: '统计信息',
        fitColumns: true,
        rownumbers: true,
        fit: true,
        pageSize: 15,
        pageNumber: 1,
        pageList: [15, 20, 25, 30],
        columns: [
            [
                { field: 'name', title: '警员', width: 200, align: 'center' },
                { field: 'areaname', title: '单位', width: 200, align: 'center' },
                { field: 'num', title: '总数', width: 200, align: 'center' },
                { field: 'video', title: '视频', width: 200, align: 'center' },
                { field: 'vioce', title: '音频', width: 200, align: 'center' },
                { field: 'wjcd', title: '文件长度(h)', width: 200, align: 'center' },
                { field: 'picture', title: '图片', width: 200, align: 'center' },
                { field: 'unkonwn', title: '未知文件', width: 200, align: 'center' },
                { field: 'ismark', title: '已编辑', width: 200, align: 'center' },
                { field: 'nomark', title: '未编辑', width: 200, align: 'center' }
            ]
        ],
        pagination: true,
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
});