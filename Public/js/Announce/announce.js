var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.datagridUrl = 'Announce/announce_list';
module.addUrl = 'Announce/announce_add';
module.editUrl = 'Announce/announce_edit';
module.removeUrl = 'Announce/announce_remove';
var tree = new Tree('#area_list');
module.show = function() {
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load', {
        rand: Math.random()
    });
}
module.addBar = function() {
    $('#dialog').dialog({
        title: '增加',
        iconCls: 'icon-add',
        shadow: false,
        onOpen: function() {
            $('#ok').show();
            $('#update').hide();
        }
    }).dialog('open');
    $('#form').form('reset');
    var t = new Date();
    $('#start_time').datebox('setValue', new Time(t, 7).init());
    $('#end_time').datebox('setValue', new Time(t, 0).init());
}
module.editBar = function() {
    var infos = $('#datagrid').datagrid('getSelections');
    if (infos.length > 1) {
        $.messager.alert('操作提示', '请选择单个进行操作', 'info');
        return false;
    } else if (infos.length == 1) {
        module.id = infos[0].id;
        $('#dialog').form('load', infos[0]);
        $('#dialog').dialog({
            buttodns: null
        });
        $('#dialog').dialog({
            title: '修改',
            iconCls: 'icon-edit',
            shadow: false,
            onOpen: function() {
                $('#ok').hide();
                $('#update').show();
            }
        }).dialog('open');
    }
}
module.add = function(target) {
    app.extra('add_edit', {
        url: module.addUrl,
        form: '#form',
        dialog: '#dialog',
        datagrid: '#datagrid',
        linkbutton: target,
        parsedata: function(data) {
            var begin = new Date(data.start_time).getTime();
            var end = new Date(data.end_time).getTime();
            if (end - begin < 0) {
                $.messager.alert('操作提示', '开始时间不能大于结束时间', 'info');
                return false;
            }
            return true;
        }
    });
}
module.edit = function(target) {
    app.extra('add_edit', {
        url: module.editUrl,
        form: '#form',
        dialog: '#dialog',
        datagrid: '#datagrid',
        linkbutton: target,
        parsedata: function(data) {
            data.id = module.id;
            var begin = new Date(data.start_time).getTime();
            var end = new Date(data.end_time).getTime();
            if (end - begin < 0) {
                $.messager.alert('操作提示', '开始时间不能大于结束时间', 'info');
                return false;
            }
            return true;
        }
    });
}
module.remove = function(target) {
    var infos = $('#datagrid').datagrid('getSelections');
    app.extra('remove', {
        idField: 'id',
        url: module.removeUrl,
        datagrid: '#datagrid',
        linkbutton: target
    });
}
module.search = function() {
    app.extra('search', {
        form: '#searchForm',
        datagrid: '#datagrid',
        parsedata: function(data) {
            data.areacode = module.areacode;
            var begin = new Date(data['create_time[btime]']).getTime();
            var end = new Date(data['create_time[etime]']).getTime();
            if (end - begin < 0) {
                $.messager.alert('操作提示', '开始时间不能大于结束时间', 'info');
                return false;
            }
            return true;
        }
    });
}
module.clickTree = function(node) {
    module.areacode = node.areacode;
    module.areaname = node.text;
    $('#tip_area').text(node.text);
    $('#mu_ser').text(module.areaname);
    module.search();
}
$(function() {
    var t = new Date();
    $('#bTime').datebox('setValue', new Time(t, 6).init());
    $('#eTime').datebox('setValue', new Time(t, 0).init());
    app.datagrid('#datagrid', {
        url: module.datagridUrl,
        title: '公告',
        columns: [
            [
                { field: 'id', title: 'id', width: 200, checkbox: true },
                { field: 'title', title: '公告标题', width: 200, align: 'center'},
                { field: 'content', title: '公告内容', width: 400, align: 'center'},
                { field: 'areaname', title: '单位', width: 200, align: 'center'},
                { field: 'start_time', title: '开始日期', width: 200, align: 'center'},
                { field: 'end_time', title: '结束日期', width: 200, align: 'center' }
            ]
        ]
    });
    tree.loadData();
    $(tree.dom).tree({
        onClick: module.clickTree
    });
    $('#mu_ser').text(module.areaname);
    $('#tip_area').text(module.areaname);
});