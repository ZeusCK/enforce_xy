var tree = new Tree('#area_list');
var module = {};
//操作所需的url
module.datagridUrl = 'Area/dataList';
module.addUrl = 'Area/dataAdd';
module.editUrl = 'Area/dataEdit';
module.removeUrl = 'Area/dataRemove';
module.areaid = app.tp.areaid;
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.area_is_read = app.tp.area_is_read;
// module.area_type = app.tp.area_type;
var searchData = {};
//验证num是否是01~99的字符
module.checkNum = function(num){
    var nums = num.split('');
    if(nums.length != 2) return false;
    nums[0] = parseInt(nums[0]);
    nums[1] = parseInt(nums[1]);
    if(0 > nums[0] || 9 < nums[0] || isNaN(nums[0])) return false;
    if(0 > nums[1] || 9 < nums[1] || isNaN(nums[1])) return false;
    if(0 == nums[0] && 0 == nums[1]) return false;
    return true;
}
//基本的搜索
module.show = function(){
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load',{
        areacode:module.areacode,
        rand:Math.random()
    });
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
    $('#infoAreaname').text('*'+module.areaname+'*添加新的子级部门');
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
        var info = $.extend({},infos[0]);
        $('#codetext_1').html(infos[0].areacode.substring(0,infos[0].areacode.length-2));
        info.areacode = infos[0].areacode.substring(infos[0].areacode.length-2,infos[0].areacode.length);
        if(infos[0].is_read == 0){
            $('#edit_area_is_read').combobox('readonly',true);
        }else{
            $('#edit_area_is_read').combobox('readonly',false);
        }
        $('#editForm').form('load',info);
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
            if(!module.checkNum(data.areacode)){
                $.messager.alert('提示信息','请输入01~99的两位字符','info');
                return false;
            }
            data.areacode=$('#codetext').html()+data.areacode;
            params = data;
        },
        success:function(data){
            //新增部门  type:params.areatype,
            $('#datagrid').datagrid('load',{areacode:module.areacode});
            var node = $(tree.dom).tree('find',module.areaid);
            $(tree.dom).tree('append',{
                parent: node.target,
                data:[{id:data.add_id,text:params.areaname,areacode:params.areacode}]
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
            if(!module.checkNum(data.areacode)){
                $.messager.alert('提示信息','请输入01~99的两位字符','info');
                return false;
            }
            data.areacode=$('#codetext_1').html()+data.areacode;
            params = data;
        },
        success:function(data){
            //修改部门
            $('#datagrid').datagrid('load',{areacode:params.areacode});
            var node = $(tree.dom).tree('find',params.areaid);
            if (node){
                $(tree.dom).tree('update', {
                    target: node.target,
                    text: params.areaname,
                    areacode:params.areacode
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
    $.messager.confirm('重要提醒','删除会将请确定位于该单位下的 警员/执法记录仪/工作站/服务器 会解除单位属性！',function(r){
        if(r){
            $.each(nodes,function(n,m){
                var areacode= m.areacode;
                ids.push(areacode);
            });
            ids = ids.join(',');
            app.extra('remove',{
                url:module.removeUrl,
                datagrid:false,
                linkbutton:target,
                parsedata:function(data){
                    data.areacode = ids;
                },
                success:function(data){
                    $('#datagrid').datagrid('load',{areacode:module.areacode});
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
            data.areacode = module.areacode;
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
            delete field.areaid;
        }
    });
}
module.importExcel = function(target){
    app.importExcel({
        url:app.url('Area/import_excel'),
        form:'#importForm',
        dialog:'#importForm',
        datagrid:'#datagrid',
        linkbutton:target,
        success:function(data){
            tree.loadData(true);
        }
    });
}
module.search_tree = function(value){
    tree.search_tree(value,1);
}
//初始化表格
$(function(){
    $('#mu_area').html(module.areaname);
    $("#areacodeAdd").next('span').find('input.textbox-text').before('<span style="display: inline-block;padding-top:4px;font-family:Arial;padding-left: 5px;" id="codetext"></span>');
    $("#areacodeEdit").next('span').find('input.textbox-text').before('<span style="display: inline-block;padding-top:4px;font-family:Arial;padding-left: 5px;" id="codetext_1"></span>');
    app.datagrid('#datagrid',{
        singleSelect:true,
        url:module.datagridUrl,
        title:'部门列表',
        columns:[[
        {field:'areaid',title:'部门id',hidden:true},
        {field:'areaname',title:'部门名称',width:200,align:'center'},
        {field:'zddm',title:'部门编号',width:200,align:'center'},
        {field:'pareaname',title:'父部门',width:200,align:'center'},
        // {field:'typename',title:'部门类型',width:200,align:'center'},
        // {field:'is_read_name',title:'部门属性',width:200,align:'center'},
        // {field:'code',title:'部门标识',width:200,align:'center'},
        {field:'rperson',title:'联系人',width:200,align:'center'},
        {field:'rphone',title:'联系方式',width:200,align:'center'},
        {field:'sort',title:'排序',width:200,align:'center'},
        ]],
        queryParams:{
            areacode:module.areacode,
            rand:Math.random()
        }
    });
    tree.loadData();        //管理部门的树
    $(tree.dom).tree({
        checkbox:true,
        onClick:function(node){
            module.areaid = node.id;
            module.areaname = node.text;
            module.areacode = node.areacode;
            module.area_is_read = node.is_read;
            // module.area_type = node.type;
            $('#mu_area').html(node.text);
            module.search();
        }
    });
    /*app.combobox('#edit_areatype,#add_areatype',{
        type:'areatype'
    });*/
    app.combobox('#edit_area_is_read,#add_area_is_read,#area_is_read',{
        type:'is_read'
    });
});