var things = {};
things.areaid = app.tp.areaid;
things.areaname = app.tp.areaname;
things.datagridUrl = app.url('WorkStation/ws_base_list');
things.addUrl = app.url('WorkStation/ws_base_add');
things.editUrl = app.url('WorkStation/ws_base_edit');
things.removeUrl = app.url('WorkStation/ws_base_remove');
var tree = new Tree('#area_list');
things.show = function(){
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load',{
        rand:Math.random()
    });
}
things.addBar = function(){
    $('#addDialog').dialog('open');
    $('#addForm').form('reset');
}
things.editBar = function(){
    var infos = $('#datagrid').datagrid('getSelections');
    if(infos.length > 1){
        $.messager.alert('操作提示','请选择单个进行操作','info');
        return false;
    }
    if(infos.length == 1){
        $('#editForm').form('load',infos[0]);
        $('#editDialog').dialog('open');
    }
}
things.add = function(target){
    app.extra('add_edit',{
        url:things.addUrl,
        form:'#addForm',
        dialog:'#addDialog',
        datagrid:'#datagrid',
        linkbutton:target
    });
}
things.edit = function(target){
    app.extra('add_edit',{
        url:things.editUrl,
        form:'#editForm',
        dialog:'#editDialog',
        datagrid:'#datagrid',
        linkbutton:target
    });
}
things.remove = function(target){
    app.extra('remove',{
        idField:'gzz_ip',
        url:things.removeUrl,
        datagrid:'#datagrid',
        linkbutton:target
    });
}
things.search = function(){
    app.extra('search',{
        form:'#searchForm',
        datagrid:'#datagrid'
    });
}
things.clickTree = function(node){
    things.areaid = node.id;
    things.areaname = node.text;
    $('#tip_area').text(node.text);
    $('#mu_ser').text(things.areaname);
    app.extra('search',{
        datagrid:'#datagrid',
        parsedata:function(data){
            data.areaid = things.areaid;
        }
    })
}
things.bind = function(id,choose){
    var dz = choose ? things.areaname : '';
    var areaid = choose ? things.areaid : 0;
    app.extra('add_edit',{
        datagrid:'#datagrid',
        url:things.editUrl,
        parsedata:function(data){
            data.id = id;
            data.dz = dz;
            data.areaid = areaid;
        }
    });
}
$(function(){
    app.datagrid('#datagrid',{
        url:things.datagridUrl,
        title:'工作站',
        columns:[[
          {field:'id', title: 'id', checkbox: true },
          {field:'gzz_ip',title:'工作站IP',align:'center'},
          {field:'dz',title:'地址', width: 200, align:'center'},
          {field:'ztsj', title: '最后在线时间', width: 200, align: 'center' },
          {field:'hzr', title: '负责人', width: 200, align: 'center' },
          {field:'dh', title: '负责人电话', width: 200, align: 'center' },
          {field:'qyztname', title: '启用状态', width: 200, align: 'center' },
          {field:'zxztname',title:'在线状态',width:200,align:'center'},
          {field:'handle',title:'操作',align:'center',formatter:function(v,d,i){
                if(d.areaid == 0){
                    return '<span style="color:#0E2D5F;cursor:pointer;" onClick="things.bind('+d.id+',true)">绑定部门</span>';
                }else{
                    return '<span style="color:#0E2D5F;cursor:pointer;" onClick="things.bind('+d.id+',false)">解除部门绑定</span>';
                }
          }}
        ]]
    });
    tree.loadData();
    $(tree.dom).tree({
        onClick:things.clickTree
    });
    $('#mu_ser').text(things.areaname);
    $('#tip_area').text(things.areaname);
});