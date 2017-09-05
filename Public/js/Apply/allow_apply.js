var module = {};
module.allowCodes = {};
module.allowCodes.length = 0;
module.code = app.tp.code;
module.url = {};
module.url.datagridUrl = app.url('Apply/allow_list');
module.url.toRead = app.url('Apply/toRead');
module.allow  = function(){
    var data = app.serializeJson('#allow_info');
    if(data.status == ''){
        $.messager.alert('操作提示','请选择审核意见','info');
        return false;
    }
    $.ajax({
        url:app.url('Apply/allow'),
        dataType:'json',
        data:data,
        success:function(r){
            $.messager.alert('操作提示',r.message,'info');
            $('#datagrid').datagrid('load');
            $('#showInfo').dialog('close');
        }
    });
}
module.search_tree = function(value){
    tree.search_tree(value,1);
}
$(function(){
    $('#datagrid').datagrid({
        url:module.url.datagridUrl,
        fitColumns:true,
        rownumbers:true,
        fit:true,
        toolbar:'#toolbar',
        pageSize:15,
        pageNumber:1,
        pageList:[2,5,10,15,20,25,30,40,50],
        singleSelect:true,
        columns:[[
          {field:'apply_id',title: '申请单号'},
          {field:'name',title:'申请警员',width: 200,align:'center'},
          {field:'areaname', title: '申请部门', width: 200, align: 'center' },
          {field:'view_name',title:'查看警员', width: 200,align:'center'},
          {field:'names',title:'申请资源', width: 200,align:'center',formatter:function(v,r,i){
                return v;
          }},
          {field:'crt_time',title:'申请时间', width: 200,align:'center'},
          {field:'from_time',title:'资源时间', width: 200,align:'center'},
          {field:'reason',title:'申请原因', width: 200,align:'center'},
          {field:'status_name', title: '审批状态', width: 200, align: 'center' },
          {field:'remark', title: '审批意见', width: 200, align: 'center' }
        ]],
        pagination:true,
        rowStyler:function(index,row){
            if (row.read == 0 && row.status != 0){
                return 'background-color:#D9EDF7;font-weight:bold;';
            }
        },
        onClickRow:function(index,data){
            //审核通过，审核拒绝的不在显示
            if(data.status == 1 || data.status == 3) return false;
            $('#request_codes').html('');
            var codes = data.codes.split(',');
            var names = data.names.split(',');
            for (var i = 0; i < codes.length; i++) {
                var button = '<a id="'+codes[i]+'" class="emp" href="#">'+names[i]+'('+codes[i]+')'+'</a>';
                $('#request_codes').append(button);
                $('#'+codes[i]).linkbutton({iconCls: 'icon-user'});
            }
            $('#apply_id').textbox('setValue',data.apply_id);
            $('#showInfo').dialog('open');
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
});