//树的实例化
var tree = new Tree('#area_list');
var managerTree = new Tree('#areaList');
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
    $('#treegrid').treegrid('load', data);
}
$(function() {
    //初始化时间
    var time = new Date();
    $('#etime').datetimebox({ value: new Time(time, 0).init() });
    $('#btime').datetimebox({ value: new Time(time, 7).init() });
    //树的初始化
    tree.init();
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick: module.clickTree
    });
    $('#infoAreaname').html('*' + module.areaname + '*添加/修改添加警员！');
    $('#mu_ser').html(module.areaname);
    $('#treegrid').treegrid({
        url: app.url('Media/area_sat'),
        method: 'get',
        queryParams: {
            areaid: module.areaid,
            rand: Math.random()
        },
        idField: 'areaid',
        treeField: 'areaname',
        fit: true,
        title: '统计信息',
        fitColumns: true,
        rownumbers: true,
        columns: [
            [
                { field: 'areaname', title: '所属部门' },
                { field: 'num', title: '总数', width: 200, align: 'center' },
                { field: 'video', title: '视频', width: 200, align: 'center' },
                { field: 'vioce', title: '音频', width: 200, align: 'center' },
                { field: 'wjcd', title: '文件长度(h)', width: 200, align: 'center' },
                { field: 'picture', title: '图片', width: 200, align: 'center' },
                { field: 'unkonwn', title: '未知文件', width: 200, align: 'center' },
                { field: 'ismark', title: '已编辑', width: 200, align: 'center' },
                { field: 'nomark', title: '未编辑', width: 200, align: 'center' }
            ]
        ]
    });
});