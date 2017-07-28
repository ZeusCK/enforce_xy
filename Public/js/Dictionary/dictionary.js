var module = {};
module.type;
module.name;
module.addBar = function(target,form){
    $(form).form('reset');
    if(form == '#dataForm'){
        if(!module.type){
            $.messager.alert('提示信息','请选择字典名目后添加','info');
            return false;
        }
        $(form).form('load',{type:module.type,name:module.name});
    }
    $(target).dialog('open');
    module.action = 'add';
}
module.editBar = function(target,form,datagrid){
    var infos = $(datagrid).datagrid('getSelections');
    if(infos.length != 1){
        $.messager.alert('操作提示','请选择一条进行编辑','info');
        return false;
    }
    //加载数据
    $(form).form('load',infos[0]);
    $(target).dialog('open');
    module.action = 'edit';
}
module.typeadd_edit = function(target){
    var url = module.action == 'add' ? 'Dictionary/data_add' : 'Dictionary/data_edit';
    app.extra('add_edit',{
        url:url,
        form:'#typeForm',
        datagrid:'#typeDatagrid',
        dialog:'#typeDialog',
        linkbutton:target,
        parsedata:function(data){
            if(module.action == 'add') delete(data.id);
        }
    });
}
module.dataadd_edit = function(target){
    var url = module.action == 'add' ? 'Dictionary/data_add' : 'Dictionary/data_edit';
    app.extra('add_edit',{
        url:url,
        form:'#dataForm',
        datagrid:'#dataDatagrid',
        dialog:'#dataDialog',
        linkbutton:target,
        parsedata:function(data){
            if(module.action == 'add') delete(data.id);
        }
    });
}
module.remove = function(target,datagrid){
    if(datagrid == '#dataDatagrid'){
        idField = 'id';
        action = 2;
    }else{
        idField = 'type';
        action = 1;
    }
    app.extra('remove',{
        url:'Dictionary/data_remove',
        datagrid:datagrid,
        linkbutton:target,
        idField:idField,
        parsedata:function(data){
            data.action = action;
        },
        success:function(data){
            module.type = false;
        }
    });
}
$(function(){
    app.datagrid('#typeDatagrid',{
        url:'Dictionary/type_list',
        columns:[[
            {field:'id',title: '', checkbox: true },
            {field:'name',title: '字典名称', width: 100, align: 'center'},
            {field:'type',title: '字典标识', width: 100, align: 'center'}
        ]],
        onClickRow:function(index,data){
            module.type = data.type;
            module.name = data.name;
            $('#dataDatagrid').datagrid('load',{
                type:module.type
            });
        }
    });
    app.datagrid('#dataDatagrid',{
        url:'Dictionary/data_list',
        columns:[[
            {field:'id',title: '', checkbox: true },
            {field:'item',title: '字典名目', width: 100, align: 'center'},
            {field:'value',title: '字典值', width: 100, align: 'center'},
            {field:'order',title: '排序', width: 100, align: 'center'}
        ]]
    });
});