var tree = new Tree('#area_list');
var module = {};
//操作所需的url
module.datagridUrl = 'Area/dataList';
module.addUrl = 'Area/dataAdd';
module.editUrl = 'Area/dataEdit';
module.removeUrl = 'Area/dataRemove';
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
//基本的搜索
module.show = function(){
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load',{
        areaid:module.areaid,
        rand:Math.random()
    });
}
//打开增加dialog
module.addBar = function(){
    $('#addForm').form('reset');
    var node = $(tree.dom).tree('find',module.areaid);
    if(node == null){
        node = {};
        node.type = 0;
    }
    if(node.type != 0){
        $('#add_areatype').combobox({readonly:true});
    }else{
        $('#add_areatype').combobox({readonly:false});
    }
    $('#addForm').form('load',{fatherareaid:module.areaid,areatype:node.type});
    $('#infoAreaname').html('*'+module.areaname+'*添加新的子级部门');
    $('#addDialog').dialog('open');
}
//打开编辑dialog
module.editBar = function(){
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
module.add = function(target){
    var params = {};
    app.extra('add_edit',{
        form:'#addForm',
        dialog:'#addDialog',
        url:module.addUrl,
        linkbutton:target,
        parsedata:function(data){
            params = data;
        },
        success:function(data){
            //新增部门
            $('#datagrid').datagrid('load',{areaid:module.areaid});
            var node = $(tree.dom).tree('find',module.areaid);
            $(tree.dom).tree('append',{
                parent: node.target,
                data:[{id:data.add_id,text:params.areaname,type:params.areatype}]
            });
        }
    });
}
module.edit = function(target){
    var params = {};
    app.extra('add_edit',{
        form:'#editForm',
        dialog:'#editDialog',
        url:module.editUrl,
        linkbutton:target,
        parsedata:function(data){
            params = data;
        },
        success:function(data){
            //修改部门
            $('#datagrid').datagrid('load',{areaid:module.areaid});
            var node = $(tree.dom).tree('find',params.areaid);
            if (node){
                $(tree.dom).tree('update', {
                    target: node.target,
                    text: params.areaname
                });
            }
        }
    });
}
//删除事件
module.remove = function(target){
    var nodes = $('#area_list').tree('getChecked');
    var ids = [];
    if(nodes.length == 0)
        return false;
    $.messager.confirm('重要提醒','删除前请确定位于该部门下人员不在职！',function(r){
        if(r){
            $.each(nodes,function(n,m){
                var id= m.id;
                ids.push(id);
            });
            ids = ids.join(',');
            app.extra('remove',{
                url:module.removeUrl,
                datagrid:false,
                linkbutton:target,
                parsedata:function(data){
                    data.areaid = ids;
                },
                success:function(data){
                    $('#datagrid').datagrid('load',{areaid:module.areaid});
                    tree.loadData(true);
                }
            });
        }
    });
}
module.link = function(){
    var options = $(tree.dom).tree('options');
    options.cascadeCheck = true;
    $('#pointInfo').html('部门联级，快速删除整体部门');
}
module.unlink = function(){
    var options = $(tree.dom).tree('options');
    $('#pointInfo').html('部门精确，定点删除个别部门');
    options.cascadeCheck = false;
}
//搜索事件 ----！  需要额外写
module.search = function(){
    app.extra('search',{
        form:'#searchForm',
        datagrid:'#datagrid',
        parsedata:function(data){
            data.areaid = module.areaid;
        }
    });
}
//初始化表格
$(function(){
    $('#mu_area').html(module.areaname);
    app.datagrid('#datagrid',{
        singleSelect:true,
        url:module.datagridUrl,
        title:'部门列表',
        columns:[[
        {field:'areaid',title:'部门id',hidden:true},
        {field:'areaname',title:'部门名称',width:200,align:'center'},
        {field:'areacode',title:'部门编号',width:200,align:'center'},
        {field:'pareaname',title:'父部门',width:200,align:'center'},
        {field:'typename',title:'部门类型',width:200,align:'center'},
        {field:'code',title:'部门标识',width:200,align:'center'},
        {field:'rperson',title:'联系人',width:200,align:'center'},
        {field:'rphone',title:'联系方式',width:200,align:'center'}
        ]],
        queryParams:{
            areaid:module.areaid,
            rand:Math.random()
        }
    });
    tree.loadData();        //管理部门的树
    $(tree.dom).tree({
        checkbox:true,
        onClick:function(node){
            module.areaid = node.id;
            module.areaname = node.text;
            $('#mu_area').html(node.text);
            module.show();
        }
    });
});