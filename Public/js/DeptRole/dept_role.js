var tree = new Tree('#deptList');
var module = {};
//操作所需的url
module.datagridUrl = 'DeptRole/dataList';
module.addUrl = 'DeptRole/dataAdd';
module.editUrl = 'DeptRole/dataEdit';
module.removeUrl = 'DeptRole/dataRemove';
module.saveDeptsUrl = 'DeptRole/save_depts';
var searchData = {};
//基本的搜索
module.show = function(){
    $('#searchForm').form('reset');
    module.search();
}
//打开增加dialog
module.addBar = function(){
    var params = {areaid:module.areaid};
    params.tpUrl = 'Area/get_add_code';
    $.ajax({
        url:app.tp.ajax,
        type:'post',
        dataType:'json',
        data:params,
        success:function(data){
            $('#codetext').html(module.areacode);
            $('#areacodeAdd').textbox('setValue',data.areacode);
        }
    });
    $('#addForm').form('reset');
    //areatype:module.area_type, 
    $('#addForm').form('load',{fatherareaid:module.areaid,is_read:module.area_is_read});
    if(module.area_is_read == 0){
        $('#add_area_is_read').combobox('readonly',true);
    }else{
        $('#add_area_is_read').combobox('readonly',false);
    }
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
        datagrid:'#datagrid',
        url:module.addUrl,
        linkbutton:target,
        parsedata:function(data){
            params = data;
        }
    });
}
module.edit = function(target){
    var params = {};
    app.extra('add_edit',{
        form:'#editForm',
        dialog:'#editDialog',
        datagrid:'#datagrid',
        url:module.editUrl,
        linkbutton:target,
        parsedata:function(data){
            params = data;
        }
    });
}
//删除事件
module.remove = function(target){
    app.extra('remove',{
        url:module.removeUrl,
        datagrid:'#datagrid',
        idField:'dept_role_id',
        linkbutton:target
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
            searchData = data;
        }
    });
}
module.exports = function(target){
    var total = $('#datagrid').datagrid('getData').total;
    app.extra('export',{
        datagrid:'#datagrid',
        params:searchData,
        linkbutton:target,
        rows: total,
        page: 1,
        parseFileds:function(field){
            delete field.dept_role_id;
        }
    });
}
module.allowDeptBar = function(){
    var row =$('#datagrid').datagrid('getSelections');
    if (row.length > 1){
        $.messager.alert('提示','一次只能修改一条记录!','info');
        return false;
    }
    if(row.length == 0) return false;
    if(row.length == 1){
        $('#dept_sure').show();
        $('#deptDialog').dialog('open').dialog('setTitle','权限分配');
    }

    var dept_role_id = row[0].dept_role_id;
    tree.load_dept_role(dept_role_id);
}
module.allowDept = function(target){
    var menuSelect = $(tree.dom).tree('getChecked');
    var roleRow = $('#datagrid').datagrid('getSelections');
    var dept_role_id = roleRow[0].dept_role_id;
    if(menuSelect.length>0){
        var ids=[];
        for(var i=0;i<menuSelect.length;i++){
            ids.push(menuSelect[i].areacode);
        }
        var dept_list = ids.join(',');
        app.extra('add_edit',{
            url:module.saveDeptsUrl,
            datagrid:'#datagrid',
            dialog:'#deptDialog',
            linkbutton:target,
            parsedata:function(data){
                data.dept_list = dept_list;
                data.dept_role_id = dept_role_id;
            }
        });
        /*$.ajax({
            type:'GET',
            url:module.saveDeptsUrl,
            data:{
                dept_list:dept_list,
                dept_role_id:dept_role_id
            },
            success:function(result){
                var result=eval(result);
                $.messager.alert('操作提示',result.message,'info');
                $('#menuDialog').dialog('close');
                $('#datagrid').datagrid('reload');
            }
        });*/
    }else{
        $.meassager.alert('信息提示','没有分配权限','info');
    }
}
//初始化表格
$(function(){
    $('#mu_area').html(module.areaname);
    $("#areacodeAdd").next('span').find('input.textbox-text').before('<span style="display: inline-block;padding-top:4px;font-family:Arial;padding-left: 5px;" id="codetext"></span>');
    $("#areacodeEdit").next('span').find('input.textbox-text').before('<span style="display: inline-block;padding-top:4px;font-family:Arial;padding-left: 5px;" id="codetext_1"></span>');
    app.datagrid('#datagrid',{
        url:module.datagridUrl,
        title:'部门角色列表',
        onClickCell:function(r,f,v){
            if(f=='dept_list'){
                var rowData = $(this).datagrid('getData').rows[r];
                var dept_role_id = rowData.dept_role_id;
                tree.load_dept_role(dept_role_id);
                $('#deptDialog').dialog('setTitle','权限查看').dialog('open');
                $('#dept_sure').hide();

            }
        },
        columns:[[
        {field:'dept_role_id',title:'部门角色ID',checkbox:true},
        {field:'rolename',title:'角色名',width:200,align:'center'},
        {field:'remark',title:'角色说明',width:200,align:'center'},
        {field:'dept_list',title:'部门清单',width:200,align:'center',formatter:function(v,r,i){
            return '<span style="color:#0E2D5F;cursor:pointer;">点击查看</span>';
        }}
        ]],
        queryParams:{
            rand:Math.random()
        }
    });
});