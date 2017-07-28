//树的实例化
var tree = new Tree('#area_list');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
//var managerTree = new Tree('#areaList');
var module = {};
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
module.params = {};
//基本的搜索
module.show = function() {
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load', {
        areaid: module.areaid,
        rand: Math.random()
    });
}
//搜索事件 ----
module.search = function() {
    var data = app.serializeJson('#searchForm');
    if(!judgeTime.judge(data['cjsj[btime]'], data['cjsj[etime]'])){
        return false;
    }
    var rows = $('#area_list').tree('getChecked');
    var row = $('#area_list').tree('getSelected');
    if (rows.length == 0) {
        if (row == null) {
            data.areaid = module.areaid;
        } else if (row.code) {
            data.jybh = row.code;
        } else {
            data.areaid = row.id;
        }
    } else {
        var code = [];
        $.each(rows, function(i, m) {
            code.push(m.code);
        });
        data.jybh = code.join();
    }
    module.params = data;
    $('#datagrid').datagrid('load', data);
};
module.init_search_form = function() {
    $('#searchForm').form('reset');
    var time = new Date();
    $("#shotS").datetimebox({ value: new Time(time, 7).init() });
    $("#shotE").datetimebox({ value: new Time(time, 0).init() });
};
//编辑
module.edit = function(data) {
    var row=$('#datagrid').datagrid('getRows');
    var index;
    $.each(row,function(i,m){
        if(m.uniqid==data.attr('tiggle') ){
            index=i;
        }
    })
    $('#editDialog').dialog({
        title:'编辑'
    })
    $('#editForm').form('load',row[index]);
};
//编辑保存
module.editOk = function() {
    var data = app.serializeJson('#editForm');
    $.ajax({
        url: app.url('Case/edit_case'),
        data: data,
        type: 'GET',
        success: function(r) {
            $.messager.alert('操作提示', r.message, 'info',function(){
                $('#editDialog').dialog('close');
                $('#datagrid').datagrid('reload');
            });
        }
    });
};
module.editCancel = function() {
    $('#editDialog').dialog('close');
};
//导出
module.exports = function() {
    var exportInfo = {};
    exportInfo.datagrid = '#datagrid';
    exportInfo.params = module.params;
    exportInfo.delFields = ['id', 'detail'];
    app.exportExcel(exportInfo);
};
module.play_info = function(data) {
    var url='play_case.html'+'?uniqid='+data.attr('tiggle');
    window.open(url);
};
//回车键搜索
function searchTree(event) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 13) {
        var type = $('#treeType').combobox('getValue');
        var info = $('#keyWord').val();
        tree.search_data(tree.data, info, type);
        tree.search_tree(info, type);
        $('#checkedMsg').html('');
    }
}
$(function() {
    //树的初始化
    tree.load_emp_tree();
    //树的额外参数
    $(document).keydown(function(event) { searchTree(event) });
    $('#area_list').tree({
        onSelect: function(node) {
            var rows = $('#area_list').tree('getChecked');
            if (rows.length == 0) {
                $('#checkedMsg').html('选择的名称：' + node.text);
            }
            module.search();
        },
        onCheck: function(node) {
            var rows = $('#area_list').tree('getChecked');
            var text = [];
            $.each(rows, function(i, m) {
                text.push(m.text);
            });
            $('#checkedMsg').html('选择的名称：' + text.join());
            module.search();
        }
    });
    //初始化搜索表单
    module.init_search_form();
    app.datagrid('#datagrid',{
        url: 'Case/case_list',
        title: '数据编辑',
        onClickCell: function(r, f, v) {
            if (f == 'detail') {
                var rowData = $(this).datagrid('getData').rows[r];
                module.detail(rowData.wjbh);
            }
        },
        columns: [
            [
                { field: 'id', checkbox: true },
                { field: 'areaname', title: '单位', align: 'center' },
                { field: 'video_title', title: '标题', align: 'center' },
                { field: 'pe_name', title: '案事件名称', align: 'center' },
                { field: 'pe_code', title: '警情编号', align: 'center' },
                { field: 'cjsj', title: '采集日期', width: 200, align: 'center' },
                { field: 'jyxm', title: '出警人',width: 200, align: 'center' },
                { field: 'pe_type', title: '警情类型',width: 200, align: 'center' },
                { field: 'case_code', title: '案件编号', align: 'center' },
                { field: 'case_type', title: '案件类型', width: 200, align: 'center' },
                { field: 'create_time', title: '更新时间', width: 200, align: 'center' },
                { field: 'scsj', title: '上传日期', width: 200, align: 'center' },
                { field: 'bb', title: '来源', width: 200, align: 'center' },
                { field: 'aa', title: '操作', width: 200, align: 'center',formatter:function(value,row,index){
                    return '<a href="javascript:void(0)" onclick="module.play_info($(this))" name="play" tiggle="'+row.uniqid+'"></a><a href="javascript:void(0)" onclick="module.edit($(this))" name="edit" tiggle="'+row.uniqid+'"></a><a href="javascript:void(0)" onclick="" name="delete" tiggle="'+row.uniqid+'"></a>';
                }},
            ]
        ]
    });

});