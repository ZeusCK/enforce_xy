var tree = new Tree('#area_list');
var module = {};
//操作所需的url
module.datagridUrl = app.url('Area/dataList');
module.addUrl = app.url('Area/dataAdd');
module.editUrl = app.url('Area/dataEdit');
module.removeUrl = app.url('Area/dataRemove');
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
//接收数据之后的操作
module.callback = function(data){
   // data = eval('('+data+')');
    $.messager.alert('操作提示',data.message,'info');
    $('#datagrid').datagrid('load',{
        areaid:module.areaid,
        rand:Math.random()
    });
}
//打开增加dialog
module.addBar = function(){
    $('#addForm').form('reset');
    $('#addForm').form('load',{fatherareaid:module.areaid});
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
module.change_info = function(form,url,dialog,type){
    var params = app.serializeJson(form);
    if(!$(form).form('validate')){
        $.messager.alert('操作提示','有未满足条件的选项，无法提交','info');
        return false;
    }
    $.ajax({
        url:url,
        type:'post',
        dataType:'json',
        data:params,
        success:function(data){
            $(dialog).dialog('close');
            module.callback(data);
            //新增部门
            if(data.add_id){
                var node = $(tree.dom).tree('find',module.areaid);
                $(tree.dom).tree('append',{
                    parent: node.target,
                    data:[{id:data.add_id,text:params.areaname}]
                });
            }else{
            //修改部门
                var node = $(tree.dom).tree('find',params.areaid);
                if (node){
                    $(tree.dom).tree('update', {
                        target: node.target,
                        text: params.areaname
                    });
                }
            }
            //tree.loadData(true);    //不使用缓存加载树
        },
        error:function(data){
            $(dialog).dialog('close');
            $.messager.alert('操作提示','网络故障','info');

        }
    });
}
module.add = function(){
    module.change_info('#addForm',module.addUrl,'#addDialog',1);
}
module.edit = function(){
    module.change_info('#editForm',module.editUrl,'#editDialog',2);
}
//删除事件
module.remove = function(){
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
            $.ajax({
                url:module.removeUrl,
                type:'post',
                data:{
                    areaid:ids
                },
                success:function(data){
                    module.callback(data);
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
    var areaname = $('#areaname').val();
    areaname = $.trim(areaname);
    $('#datagrid').datagrid('load',{
        areaid:module.areaid,
        areaname:areaname
    });
}
//初始化表格
$(function(){
    $('#mu_area').html(module.areaname);
    $('#datagrid').datagrid({
        url:module.datagridUrl,
        method:'get',
        title:'部门列表',
        queryParams:{
            areaid:module.areaid,
            rand:Math.random()
        },
        fitColumns:true,
        rownumbers:true,
        fit:true,
        pageSize:15,
        pageNumber:1,
        pageList:[10,15,20,30,50],
        columns:[[
        {field:'areaid',title:'部门id',hidden:true},
        {field:'areaname',title:'部门名称',width:200,align:'center'},
        {field:'areacode',title:'部门编号',width:200,align:'center'},
        {field:'pareaname',title:'父部门',width:200,align:'center'},
        {field:'rperson',title:'联系人',width:200,align:'center'},
        {field:'rphone',title:'联系方式',width:200,align:'center'}
        ]],
        pagination:true,
        onLoadSuccess:function(r){
            if(r.total==0){
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left','0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({'color':'#F00','text-align':'center','font-size':'16px'});
            }else if(r.error){
                $.messager.alert('操作提示', r.error,'info');
            }
        }
    });

    tree.init();
    tree.loadData();
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