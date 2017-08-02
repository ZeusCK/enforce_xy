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
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick: module.clickTree
    });
    $('#mu_ser').html(module.areaname);
    app.treegrid('#treegrid',{
        url: 'Case/case_sat',
        queryParams: {
            areaid: module.areaid,
            rand: Math.random()
        },
        idField: 'areaid',
        treeField: 'areaname',
        title: '统计信息',
        columns: [
            [
                { field: 'areaname', title: '所属部门', rowspan: 2, width: 80, align: 'center' },
                { field: 'empnum', title: '警员总数', rowspan: 2, width: 80, align: 'center' },
                { field: 'workemp', title: '上传警员数', rowspan: 2, width: 80, align: 'center' },
                { field: 'percent', title: '警员上传率', rowspan: 2, width: 80, align: 'center' },
                { title: '警情', colspan: 9 },
                { title: '案件', colspan: 3 },
                { title: '工作站', colspan: 3 }
            ],
            [
                { field: 'common', title: '一般警情', width: 80, align: 'center' },
                { field: 'major', title: '重大警情', width: 80, align: 'center' },
                { field: 'major', title: '重大警情', width: 80, align: 'center' },
                { field: 'impede', title: '阻碍民警执法妨碍公务', align: 'center' },
                { field: 'force', title: '行政强制执行', width: 80, align: 'center' },
                { field: 'spot', title: '当场盘问检查', align: 'center' },
                { field: 'disuse', title: '无效数据', align: 'center' },
                { field: 'unmark', title: '未编辑', align: 'center' },
                { field: 'num', title: '合计', align: 'center' },
                { field: 'criminal', title: '刑侦案件', align: 'center' },
                { field: 'administration', title: '行政案件', align: 'center' },
                { field: 'case_num', title: '合计', width: 80, align: 'center' },
                { field: 'wsbase_num', title: '总数', width: 80, align: 'center' },
                { field: 'wsbase_online', title: '在线数', width: 80, align: 'center' },
                { field: 'case_num', title: '在线率', width: 80, align: 'center' },
            ]
        ]
    });
});