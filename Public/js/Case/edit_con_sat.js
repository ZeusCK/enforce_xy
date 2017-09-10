var column = [
    [
        { field: 'areaname', title: '单位', rowspan: 3,width: 200, align: 'center' },
        { field: 'upload', title: '已上传数据', rowspan: 3,width: 80, align: 'center' },
        { field: 'unmark', title: '未编辑数据', rowspan: 3,width: 80, align: 'center' },
        { field: 'mark', title: '已编辑数据', colspan: 10, align: 'center' },
        { field: 'uploadediter', title: '上传编辑率', rowspan: 3, width: 80,align: 'center' }
    ],
    [
        { field: 'markTotal', title: '合计', rowspan: 2, width: 80,align: 'center' },
        { field: 'alarm', title: '警情', colspan: 6, align: 'center' },
        { field: 'case', title: '案件', colspan: 2, align: 'center' },
        { field: 'disuse', title: '无效数据', rowspan: 2, width: 80,align: 'center' }
    ],
    [
        { field: 'common', title: '一般警情', width: 80, align: 'center' },
        { field: 'major', title: '重大警情', width: 80, align: 'center' },
        { field: 'spot', title: '当场盘问检查', width: 80, align: 'center' },
        { field: 'force', title: '行政强制执行', width: 80, align: 'center' },
        { field: 'impede', title: '阻碍民警执法妨碍公务', width: 80, align: 'center' },
        { field: 'otherdata', title: '其他数据', width: 80, align: 'center' },
        { field: 'administration', title: '行政案件', width: 80, align: 'center' },
        { field: 'criminal', title: '刑事案件',width: 80,  align: 'center' }
    ]
];

//树的实例化
var tree = new Tree('#area_list');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
var searchData = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.link = 'link';
module.search = function(data){
    var data = app.serializeJson('#searchForm');
    data.areacode = module.areacode;
    searchData = data;
    $('#datagrid').datagrid('load', data);
}
module.clickTree = function(node) {
    /*var chs = $(tree.dom).tree('getChildren',node.target);
    if(chs.length == 0){
        $.messager.alert('操作提示','该部门没有子部门无法进行统计','info');
        return false;
    }*/
    module.areacode = node.areacode;
    module.areaname = node.text;
    $('#mu_ser').html(module.areaname);
    module.search();
}
module.exports = function(target) {
    app.extra('export',{
        datagrid:'#datagrid',
        autoRowHeight:false,
        params:searchData,
        linkbutton:target,
        parseFileds:function(field){
            delete field.upload;
            delete field.collect;
            delete field['case'];
            delete field['warning'];
        }
    });
}
module.search_tree = function(value){
    tree.search_tree(value,1);
}
$(function() {
    //初始化时间
    var time = new Date();
    $('#etime').datebox({ value: new Time(time, 0).init() });
    $('#btime').datebox({ value: new Time(time, 6).init() });
    //树的初始化
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick: module.clickTree,
    });
    $('#mu_ser').html(module.areaname);
    app.datagrid('#datagrid', {
        url: 'Case/sat_edit_con',
        queryParams: {
            areacode: module.areacode,
            link: module.link,
            rand: Math.random()
        },
        title: '统计信息',
        columns: column
    });
});