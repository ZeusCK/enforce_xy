//树的实例化
var tree = new Tree('#area_list');
var managerTree = new Tree('#areaList');
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.area_is_read = app.tp.area_is_read;
module.code = app.tp.code;
module.actionType = 1;
module.empid = app.tp.empid;
var searchData = {};
module.clickTree = function(node){
    module.areacode = node.areacode;
    module.areaname = node.text;
    module.area_is_read = node.is_read;
    var is_read_info = module.area_is_read == 0 ? '(只读)':'';
    $('#mu_ser').html(module.areaname+is_read_info);
    $('#infoAreaname').html('*<span style="color:red;">'+module.areaname+'</span>*添加/修改警员！');
    module.search();
}
//基本的搜索
module.show = function(){
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load',{
        areacode:module.areacode,
        rand:Math.random()
    });
}
//搜索事件 ----
module.search = function(){
    var name = $('#name').val();
    name = $.trim(name);
    searchData = {areacode:module.areacode,name:name}
    $('#datagrid').datagrid('load',searchData);
}
module.link = function(){
    var options = $(managerTree.dom).tree('options');
    options.cascadeCheck = true;
    $('#pointInfo').html('部门联级，快速分配部门');
}
module.unlink = function(){
    var options = $(managerTree.dom).tree('options');
    $('#pointInfo').html('部门精确，精确分配部门');
    options.cascadeCheck = false;
}
module.infoBar = function(type){
    module.actionType = type;
    if (module.areacode == '') {
        $.messager.alert('操作提示','你无法向系统根部门添加/修改警员,请先创建部门，重新登录后添加警员！','info');
        return false;
    }
    if(module.area_is_read == 0){
        $.messager.alert('操作提示','你无法向'+module.areaname+'(只读)添加警员','info');
        return false;
    }
    //添加
    if(type == 1){
        var info = {areacode:module.areacode,name:'',code:'',phone:'',remark:'',email:'',empid:''};
        //$('#form').form('clear');
        $('#form').form('load',info);
        $('#dialog').dialog({title:'添加'});
        $('#infoAreaname').show();
    }
    //修改
    if(type == 2){
        var infos = $('#datagrid').datagrid('getSelections');
        if(infos.length != 1){
            $.messager.alert('操作提示','请选择一个警员进行编辑','info');
            return false;
        }
        if(infos[0].empid == module.empid){
            $.messager.alert('操作提示','你无法修改自身。','info');
            return false;
        }
        if(infos[0].login == 0){
            $.messager.alert('操作提示','你无法修改只读部门的警员。','info');
            return false;
        }
        //加载数据
        infos[0].photo = infos[0].photo_path;
        $('#form').form('load',infos[0]);
        $('#dialog').dialog({title:'修改'});
        $('#infoAreaname').hide();
    }

    $('#dialog').dialog('open');
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
            delete field.empid;
        }
    });
}
module.changeinfo = function(){
    var requestUrl = module.actionType == 1 ? app.url('Employee/dataAdd') : app.url('Employee/dataEdit');
    $('#form').form('submit',{
        url:requestUrl,
        onSubmit:function(param){
            if(!$('#form').form('validate')){
                return false;
            }
            if(module.actionType == 1) delete(param.empid);
            //console.log(param.photo);
            var photo = $("#form input[name='photo']").val();
            if(photo != ''){
                var photoArr = photo.split('.');
                var type = photoArr[photoArr.length-1];
                if(type != 'jpg'){
                    $.messager.alert('上传提示','上传图片仅支持jpg格式','info');
                    return false;
                }
            }
        },
        success:function(data){
            data = eval('('+data+')');
            $.messager.alert('结果提示',data.message,'info');
            $('#dialog').dialog('close');
            $('#datagrid').datagrid('reload',{
                areacode:module.areacode,
                rand:Math.random()
            });
        },
        error:function(data){
            $('#dialog').dialog('close');
            $.messager.alert('操作提示','网络故障','info');
        }
    });
}
module.remove = function(target){
    if(module.area_is_read == 0){
        $.messager.alert('操作提示','你无法删除'+module.areaname+'(只读)的警员','info');
        return false;
    }
    var infos = $('#datagrid').datagrid('getSelections');
    if(infos.length == 0) return false;
    for (var i = 0; i < infos.length; i++) {
        if(infos[i].code == 'admin'){
            $.messager.alert('删除提示','超级管理员无法删除','info');
            return false;
        }
        var id= infos[i].empid;
        if(id == module.empid){
            $.messager.alert('删除提示','你无法删除自身,该操作只有上级用户可执行','info');
            return false;
        }
        if(infos[0].login == 0){
            $.messager.alert('操作提示','你无法删除只读部门的警员。','info');
            return false;
        }
    }
    app.extra('remove',{
        url:'Employee/dataRemove',
        datagrid:'#datagrid',
        linkbutton:target,
        idField:'empid'
    });
}
module.allowAreaBar = function(){
    var rowData = $('#datagrid').datagrid('getSelections');
    if(rowData.length != 1){
        $.messager.alert('操作提示','请选择一个警员进行权限分配','info');
        return false;
    }
    rowData = rowData[0];
    if(module.code == rowData.code){
        $.messager.alert('操作提示','你无法为自己分配权限，如有需求请联系上级!','info');
        return false;
    }
    if(rowData.login == 0){
        $.messager.alert('操作提示','你无法为只读部门的警员进行权限分配。','info');
        return false;
    }
    var empid = rowData.empid;
    /*managerTree.show_emp_manger_area(empid);
    $(managerTree.dom).tree({
        checkbox:true
    });*/
    if(module.code == 'admin') $('#initPwd').show();

    $('#areaInfo').hide();
    $('#manInfo').show();
    $('#otherInfoForm').form('load',rowData);
    $("#clientip").combobox('readonly',false);
    $("#bindingip").textbox('readonly',false);
    $('#menu_sure').show();
    $('#otherdialog').dialog('open');
}
module.initPwd = function(target){
    if(module.area_is_read == 0){
        $.messager.alert('操作提示','你无法初始化'+module.areaname+'(只读)的警员密码','info');
        return false;
    }
    $.messager.confirm('操作提示','你确定初始化该警员的登陆密码么？',function(r){
        if(r){
            app.extra('add_edit',{
                form:'#otherInfoForm',
                url:'Employee/initPwd',
                dialog:otherdialog,
                linkbutton:target,
                parsedata:function(data){
                    delete data.bindingip;
                    delete data.clientipDiv;
                }
            });
        }
    });
}
module.allowOther = function(){
    var params = app.serializeJson('#otherInfoForm');
    /*var areas = $(managerTree.dom).tree('getChecked');
    if(areas.length>0){
        var ids=[];
        for(var i=0;i<areas.length;i++){
            ids.push(areas[i].id);
        }
        var userarea = ids.join(',');
        params.userarea = userarea;
    }else{
        params.userarea = '';
    }*/
    $.ajax({
            type:'post',
            url:app.url('Employee/save_other_info'),
            data:params,
            dataType:'json',
            success:function(result){
                $.messager.alert('操作提示',result.message,'info');
                $('#otherdialog').dialog('close');
                $('#datagrid').datagrid('reload',{
                    areacode:module.areacode,
                    rand:Math.random()
                });
            }
        });
}
module.importExcel = function(target){
    app.importExcel({
        url:app.url('Employee/import_excel'),
        form:'#importForm',
        dialog:'#importForm',
        datagrid:'#datagrid',
        linkbutton:target
    });
}
$(function(){
    //树的初始化
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick:module.clickTree
    });
    $('#infoAreaname').html('*<span style="color:red;">'+module.areaname+'</span>*添加/修改警员！');
    var is_read_info = module.area_is_read == 0 ? '(只读)':'';
    $('#mu_ser').html(module.areaname+is_read_info);
    $('#datagrid').datagrid({
        url:app.url('Employee/dataList'),
        method:'get',
        queryParams:{
            areacode:module.areacode,
            rand:Math.random()
        },
        onClickCell:function(r,f,v){
            if(f=='otherInfo'){
                $('#areaInfo').show();
                $('#manInfo').hide();
                var rowData = $(this).datagrid('getData').rows[r];
                var empid = rowData.empid;
                managerTree.show_emp_manger_area(empid);
                $(managerTree.dom).tree({
                    checkbox:true
                });
                $('#otherInfoForm').form('load',rowData);
                $("#clientip").combobox('readonly',true);
                $("#bindingip").textbox('readonly',true);
                $('#menu_sure').hide();
                $('#otherdialog').dialog('open');
            }
        },
        title:'警员列表',
        fitColumns:true,
        rownumbers:true,
        fit:true,
        pageSize:15,
        pageNumber:1,
        pageList:[15,20,25,30],
        columns:[[
        {field:'empid',title:'警员id',checkbox:true},
        {field:'code',title:'警员警号',align:'center'},
        {field:'name',title:'姓名',width:200,align:'center'},
        {field:'sex',title:'性别',width:200,align:'center'},
        {field:'rolename',title:'所属角色',width:200,align:'center'},
        {field:'remark',title:'备注',width:200,align:'center'},
        {field:'areaname',title:'所属部门',width:200,align:'center'},
        {field:'phone',title:'电话',width:200,align:'center'}
        /*{field:'otherInfo',title:'权限信息',width:200,align:'center',formatter:function(v,r,i){
            return '点击查看';
        },styler:function(v,r,i){
            return 'color:#0E2D5F;cursor:pointer;';
        }}*/
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
});