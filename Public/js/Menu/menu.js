var tree = new Tree('#menu_list');
var module = {};
//操作所需的url
module.addUrl = 'menu/dataAdd';
module.editUrl = 'menu/dataEdit';
module.removeUrl = 'menu/dataRemove';
module.menuid = 0;
module.menuname = '根菜单';
//接收数据之后的操作
module.callback = function(data){
    $.messager.alert('操作提示',data.message,'info');
}
//打开增加dialog
module.addBar = function(){
    $('#addForm').form('reset');
    $('#addForm').form('load',{pid:module.menuid});
    $('#infomenuname').html('*'+module.menuname+'*添加新的子级菜单');
    $('#addDialog').dialog('open');
}
module.addmBar = function(){
    $('#addForm').form('reset');
    module.menuid = 0;
    $('#addForm').form('load',{pid:0});
    $('#infomenuname').html('*根菜单*添加新的子级菜单');
    $('#addDialog').dialog('open');
}
//打开编辑dialog
module.editBar = function(){
    var infos = $('#menu_list').tree('getSelected');
    if(infos == null){
        $.messager.alert('操作提示','请选择单个进行操作','info');
        return false;
    }
    infos.url = infos.attributes ? infos.attributes.url || '' : '';
    infos.name = infos.text;
    infos.iconcls = infos.iconCls;
    $('#editForm').form('load',infos);
    $('#editDialog').dialog('open');
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
            params.id = data.add_id;
            params.text = params.name;
            params.iconCls = params.iconcls;
            params.attributes = {};
            params.attributes.url = params.url;
            //新增菜单
            if(module.menuid == 0){
                $(tree.dom).tree('append',{
                    data:[params]
                });
            }else{
                var node = $(tree.dom).tree('find',module.menuid);
                $(tree.dom).tree('append',{
                    parent: node.target,
                    data:[params]
                });
            }

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
            params.text = params.name;
            params.iconCls = params.iconcls;
            params.attributes = {};
            params.attributes.url = params.url;
            //修改菜单
            var node = $(tree.dom).tree('find',module.menuid);
            params.target = node.target;
            if (node){
                $(tree.dom).tree('update',params);
            }
        }
    });
}
//删除事件
module.remove = function(target){
    var nodes = $('#menu_list').tree('getChecked');
    var ids = [];
    if(nodes.length == 0){
        return false;
    }
    $.messager.confirm('重要提醒','删除前请确定位于该菜单下人员不在职！',function(r){
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
                    data.id = ids;
                },
                success:function(data){
                    $(tree.dom).tree('reload');
                }
            });
        }
    });
}
module.link = function(){
    var options = $(tree.dom).tree('options');
    options.cascadeCheck = true;
    $('#pointInfo').html('菜单联级，快速删除整体菜单');
}
module.unlink = function(){
    var options = $(tree.dom).tree('options');
    $('#pointInfo').html('菜单精确，定点删除个别菜单');
    options.cascadeCheck = false;
}
//搜索事件 ----！  需要额外写
module.search = function(){
    app.extra('search',{
        form:'#searchForm',
        datagrid:'#datagrid',
        parsedata:function(data){
            data.menuid = module.menuid;
        }
    });
}
//初始化表格
$(function(){
    $('#mu_menu').html(module.menuname);
    tree.init();
    $('#infomenuname').html(module.menuname);
    $(tree.dom).tree({
        url:app.url('Menu/datalist2'),
        checkbox:true,
        onClick:function(node){
            module.menuid = node.id;
            module.menuname = node.text;
            $('#infomenuname').html(module.menuname);
        }
    });
});