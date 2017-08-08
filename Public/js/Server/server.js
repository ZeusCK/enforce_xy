var module = {};
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
module.datagridUrl = 'Server/server_list';
module.addUrl = 'Server/server_add';
module.editUrl = 'Server/server_edit';
module.removeUrl = 'Server/server_remove';
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
            data.areaid = module.areaid;
            data.areaname = module.areaname;
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
        }
    });
}
module.remove = function(target) {
    app.extra('remove', {
        idField: 'server_ip',
        url: module.removeUrl,
        datagrid: '#datagrid',
        linkbutton: target
    });
}
module.search = function() {
    app.extra('search', {
        form: '#searchForm',
        datagrid: '#datagrid',
    });
}
module.clickTree = function(node) {
    module.areaid = node.id;
    module.areaname = node.text;
    $('#tip_area').text(node.text);
    $('#mu_ser').text(module.areaname);
    app.extra('search', {
        datagrid: '#datagrid',
        parsedata: function(data) {
            data.areaid = module.areaid;
        }
    })
}
module.bind = function(id, choose) {
    var dz = choose ? module.areaname : '';
    var areaid = choose ? module.areaid : 0;
    app.extra('add_edit', {
        datagrid: '#datagrid',
        url: module.editUrl,
        parsedata: function(data) {
            data.id = id;
            data.dz = dz;
            data.areaid = areaid;
        }
    });
}
$(function() {
    app.datagrid('#datagrid', {
        url: module.datagridUrl,
        title: '服务器',
        columns: [
            [
                { field: 'id', title: 'id', checkbox: true },
                { field: 'server_ip', title: '服务器IP', align: 'center' },
                { field: 'areaname', title: '所属部门', align: 'center' },
                { field: 'server_port', title: '端口号', align: 'center' },
                { field: 'trademark', title: '品牌', width: 200, align: 'center' },
                { field: 'config', title: '配置', width: 200, align: 'center' },
                { field: 'account', title: '帐号', width: 200, align: 'center' },
                { field: 'password', title: '密码', width: 200, align: 'center' },
                { field: 'db_user', title: '数据库账号', width: 200, align: 'center' },
                { field: 'db_pwd', title: '数据库密码', width: 200, align: 'center' },
                { field: 'phone', title: '联系电话', width: 200, align: 'center' },
                {
                    field: 'status_name',
                    title: '状态',
                    width: 200,
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (v == '离线') {
                            return '<span style="color:#a00">离线</span>';
                        } else {
                            return '<span style="color:#0a0">在线</span>';
                        }
                    }
                },
                {
                    field: 'handle',
                    title: '操作',
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (d.areaid == 0) {
                            return '<span style="color:#0E2D5F;cursor:pointer;" onClick="module.bind(' + d.id + ',true)">绑定部门</span>';
                        } else {
                            return '<span style="color:#0E2D5F;cursor:pointer;" onClick="module.bind(' + d.id + ',false)">解除部门绑定</span>';
                        }
                    }
                }
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