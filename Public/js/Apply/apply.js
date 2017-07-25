//调阅管理的树
var area_emp_tree = new Tree('#area_emp');
var area_emp_show = new Tree('#area_emp_show');
var module = {};
module.allowCodes = {};
module.allowCodes.length = 0;
module.code = app.tp.code;
module.url = {};
module.url.get_parent = app.url('Apply/get_parent');
module.url.datagridUrl = app.url('Apply/apply_list');
module.url.toRead = app.url('Apply/toRead');
module.applyType = 1;   //提交状态 1 add 2 edit
module.data = {};
module.status = true;       //是否处于可编辑状态
module.toBeAllow = true;
module.submit = function(){
    if(module.allowCodes.length < 1){
        $.messager.alert('信息提示','请选择调阅警员','info');
        return false;
    }
    if(!module.data.parent_name){
        $.messager.alert('信息提示','请选择审核领导','info');
        return false;
    }
    if(!module.data.view_code){
        $.messager.alert('信息提示','请输入查看警员','info');
        return false;
    }
    var from_time = $('#from_time').datebox('getValue');     //资源时间
    if(from_time != ''){
        module.data.from_time = from_time;
    }else{
        $.messager.alert('信息提示','请选择资源时间','info');
        return false;
    }
    var codes = [];     //资源警号
    for(var code in module.allowCodes){
        if(code == 'length') continue;
        codes.push(code);
    }
    module.data.codes = codes.join(',');
    module.data.reason = $('#reason').textbox('getValue');
    if(module.applyType == 1){
        var url = app.url('Apply/apply_add');
    }else{
        var url = app.url('Apply/apply_edit');
    }
    $.ajax({
        url:url,
        type:'post',
        dataType:'json',
        data:module.data,
        success:function(data){
            $.messager.alert('信息提示',data.message,'info');
            $('#datagrid').datagrid('reload');
        },
        error:function(data){
            $.messager.alert('信息提示','网络故障','info');
        }
    })
}
//加载信息
module.loadInfo = function(data){
    //显示审批结果
    if(data.status != 0){
        $('#allow_info').show();
    }else{
        $('#allow_info').hide();
    }
    $('#request_codes').html('');
    var codes = data.codes.split(',');
    var names = data.names.split(',');
    module.allowCodes = {};
    module.allowCodes.length = codes.length;
    for (var i = 0; i < codes.length; i++) {
        module.allowCodes[codes[i]] = names[i];
        var button = '<a id="'+codes[i]+'" class="emp" href="#">'+names[i]+'('+codes[i]+')'+'</a>';
        $('#request_codes').append(button);
        $('#'+codes[i]).linkbutton({iconCls: 'icon-user'});
    }
    $('#from_time').datebox('setValue',data.from_time);
    $('#parent').combobox('setValue',data.parent_code);
    $('#status_name').textbox('setValue',data.status_name);
    $('#remark').textbox('setValue',data.remark);
    $('#reason').textbox('setValue',data.reason);
    $('#view_code').textbox('setValue',data.view_name);
    module.data.view_code = data.view_code;
    module.data.view_name = data.view_name;
    module.data.parent_code = data.parent_code;
    module.data.parent_name = data.parent_name;
    module.data.apply_id = data.apply_id;
    //允许编辑状态
    if(data.status == 2 || data.status == 0){
        $('#sure').show();
        module.status = true;
        module.applyType = 2;
    }else{          //禁止编辑状态
        $('#sure').hide();
        module.status = false;
    }
}
module.init = function(){
    if(!module.toBeAllow){
        $.messager.alert('操作提示','您无法新建申请单,您已拥有全部的管理权无需申请','info');
        return false;
    }
    $.messager.alert('操作提示','新建申请单，填写申请资源和资源信息后提交','info');
    module.applyType = 1;
    module.allowCodes = {};
    module.allowCodes.length = 0;
    delete(module.data.apply_id);
    $('#request_codes').html('');
    var time = new Date();
    $('#from_time').datebox({value:new Time(time,0).init()});
    $('#parent').combobox('setValue','');
    $('#status_name').textbox('setValue','');
    $('#remark').textbox('setValue','');
    $('#reason').textbox('setValue','');
    $('#view_code').textbox('setValue','');
    module.status = true;
    $('#sure').show();
    $('#allow_info').hide();
}
$(function(){
    //初始化选择请求警员显示
    area_emp_tree.show_apply_tree();
    //初始化选择查看警员显示
    area_emp_show.load_emp_tree();
    //左侧菜单
    $(area_emp_tree.dom).tree({
        onSelect:function(node){
            if(!module.status) return false;
            if(!node.code) return false;
            if(node.code == module.code){
                $.messager.alert('操作提示','无需申请自身','info');
                return false;
            }
            if(module.allowCodes.length >= 20){
                $.messager.alert('操作提示','最多添加20个警员','info');
                return false;
            }
            //判断数组中是否拥有选中值
            if(module.allowCodes[node.code]){
                delete(module.allowCodes[node.code]);
                module.allowCodes.length = module.allowCodes.length - 1;
                $('#'+node.code).remove();
            }else{
                var button = '<a id="'+node.code+'" class="emp" href="#">'+node.name+'('+node.code+')'+'</a>';
                $('#request_codes').append(button);
                $('#'+node.code).linkbutton({iconCls: 'icon-user'});
                module.allowCodes[node.code] = node.name;
                module.allowCodes.length = module.allowCodes.length + 1;
            }
        }
    });
    //右侧菜单
    $(area_emp_show.dom).tree({
        onSelect:function(node){
            if(!module.status) return false;
            if(!node.code) return false;
            module.data.view_code = node.code;
            module.data.view_name = node.name;
            $('#view_code').textbox('setValue',node.name);

        }
    });
    //审核人
    $('#parent').combobox({
        url:module.url.get_parent,
        valueField:'code',
        textField:'name',
        onLoadSuccess:function(){
             var data = $('#parent').combobox('getData');
             if(data.length == 0){
                $('#ponit_info').text('没有合适的上级领导，你无法提交申请。或者本身具有全部的管理权限无需申请');
                $('#sure').hide();
                module.toBeAllow = false;
             }
        },
        onSelect:function(node){
            if(!module.status) return false;
            module.data.parent_name = node.name;
            module.data.parent_code = node.code;
        }
    });
    $('#datagrid').datagrid({
        url:module.url.datagridUrl,
        fitColumns:true,
        rownumbers:true,
        fit:true,
        toolbar:'#toolbar',
        pageSize:15,
        pageNumber:1,
        singleSelect:true,
        pageList:[2,5,10,15,20,25,30,40,50],
        columns:[[
          {field:'apply_id',title: 'id',hidden:true},
          {field:'name',title:'申请警员',width: 200,align:'center'},
          {field:'areaname', title: '申请部门', width: 200, align: 'center' },
          {field:'crt_time',title:'申请时间', align:'center'},
          {field:'parent_name', title: '审批人', width: 200, align: 'center'},
          {field:'status_name', title: '审批状态', width: 200, align: 'center' }
        ]],
        pagination:true,
        rowStyler:function(index,row){
            if (row.read == 0 && row.status != 0){
                return 'background-color:#D9EDF7;font-weight:bold;';
            }
        },
        onClickRow:function(index,data){
            if(data.read == 0 && data.status != 0){
                data.read = 1;
                //更新状态
                $.ajax({
                    url:module.url.toRead,
                    type:'get',
                    data:{read:1,apply_id:data.apply_id}
                });
            }
            module.loadInfo(data);
        },
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
    $('#allow_info').hide();
    var time = new Date();
    $('#from_time').datebox({value:new Time(time,0).init()});
    $('#search_status').combobox({
        onChange: function(n,o){
            $('#datagrid').datagrid('load',{status:n});
        }
    });
});