var info={};
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
var searchData = {};
var tree=new Tree('#tree');
module.exports = function(target){
    var total = $('#datagrid').datagrid('getData').total;
    app.extra('export',{
        datagrid:'#datagrid',
        params:searchData,
        linkbutton:target,
        rows: total,
        page: 1,
        parseFileds:function(field){
            delete field.id;
        }
    });
}
module.add_edit = function(target){
    var url= $('#dialog').dialog('options').title=='添加'? 'Dev/pe_base_add' : 'Dev/pe_base_edit';
    app.extra('add_edit',{
        url:url,
        form:'#dialogForm',
        datagrid:'#datagrid',
        dialog:'#dialog',
        linkbutton:target        
    });
}
module.bind = function(id, choose) {
    var dz = choose ? module.areaname : '';
    var areacode = choose ? module.areacode : '';
    app.extra('add_edit', {
        datagrid: '#datagrid',
        url: 'Dev/pe_base_edit',
        parsedata: function(data) {
            data.id = id;
            data.areaname = dz;
            data.areacode = areacode;
        }
    });
}
$(function(){
    //左侧tree的加载
    tree.loadData();
    $('#pos').html(module.areaname);
    //右侧datagrid的加载
    $('#datagrid').datagrid({
        url:app.url('Dev/pe_base_list'),
        title:'执法仪',
        fitColumns:true,
        fit:true,
        striped:true,
        rownumbers:true,
        pagination:true,
        pageSize:15,
        pageNumber:1,
        pageList:[2,5,10,15,20,25,30,40,50],
        pagePosition:'bottom',
        toolbar:'#toolbar',
        columns:[[
            {field:'id',title:'',checkbox:true},
            {field:'areaname',title:'所属部门'},
            {field:'cpxh',title:'产品序号',width:100,align:'center'},
            {field:'jyxm',title:'警员姓名',width:100,align:'center'},
            {field:'jybh',title:'警员编号',width:100,align:'center'},
            {field:'product',title:'生产厂家',width:100,align:'center'},
            {field:'standard',title:'设备规格',width:100,align:'center'},
            {field:'handle',title:'操作',align:'center',formatter:function(v,d,i){
                if(d.areacode == ''){
                    return '<span style="color:#0E2D5F;cursor:pointer;" onClick="module.bind('+d.id+',true)">绑定部门</span>';
                }else{
                    return '<span style="color:#0E2D5F;cursor:pointer;" onClick="module.bind('+d.id+',false)">解除部门绑定</span>';
                }
            }}
        ]],
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

    $('#tree').tree({
        onSelect:function(node){
            $('#pos').html(node.text);
            module.areaname = node.text;
            module.areacode = node.areacode;
            info = app.serializeJson('#form');
            info.areacode=node.areacode;
            $('#datagrid').datagrid('load',info);
            searchData = info;
            
        }
    });
    //搜索按钮
    $('#searching').click(function(){
        var searchData = app.serializeJson('#form');
        searchData.areacode = module.areacode;
       $('#datagrid').datagrid('load',searchData);
    });
    //添加按钮
    $('#add').click(function(){
        operation('添加');
    });
    //修改按钮
    $('#edit').click(function(){
        operation('修改');
    });
    //删除按钮
    $('#del').click(function(){
        var rows = $('#datagrid').datagrid('getSelections');
        if(rows.length<1){
            $.messager.alert('操作提示','您未选中任何记录，请选择！','info');
            return false;
        }
        $.messager.confirm('操作提示','确定要删除这'+rows.length+'条记录吗？',function(r){
            if(r){
                var cpxh=[];
                $.each(rows,function(i,m){
                    cpxh.push(m.cpxh);
                });
                $.ajax({
                    url:app.url('Dev/pe_base_remove'),
                    type:'POST',
                    data:{cpxh:cpxh.join()},
                    success:function(re){
                        $('#datagrid').datagrid('reload');
                        $.messager.alert('操作提示',re.message,'info');
                    }
                });
            }
        });
    });
    //添加、修改面板的 确定按钮
    /*$('#dialogOk').click(function(){
        var url=$('#dialog').dialog('options').title=='添加'?app.url('Dev/pe_base_add'):app.url('Dev/pe_base_edit');
        var data=app.serializeJson('#dialogForm');
        if(data.cpxh==''){
            $.messager.alert('操作提示','产品序号为必填项！','info');
            return false;
        }
        $.ajax({
            url:url,
            data:data,
            type:'GET',
            success:function(r){
                $('#datagrid').datagrid('reload');
                $('#dialog').dialog('close');
                $.messager.alert('操作提示',r.message,'info');
            }
        });
    });*/
    //添加、修改面板的 取消按钮
    $('#dialogDel').click(function(){
        $('#dialog').dialog('close');
    });
});
function operation(title){
    if(title=='添加'){
        $('#dialog p').html(module.areaname);
        $('#dialogForm').form('reset');
    }else{
        $('#dialog p').html('');
        var rows=$('#datagrid').datagrid('getSelections');
        if(rows==null || rows.length == 0){
            $.messager.alert('操作提示','请选择所要修改内容，仅限一条','info');
            return false;
        }else if(rows.length>1){
            $.messager.alert('操作提示','一次只能修改一条数据，请重新选择','info');
            return false;
        }else{
            $('#dialogForm').form('load',rows[0]);
        }
    }
    $('#jyxm').combobox({
        url:app.tp.ajax+'?tpUrl=Employee/get_area_emp&areacode='+module.areacode,
        valueField:'name',
        textField:'name',
        method:'get',
        onSelect:function(record){
            $('#jybh').textbox('setValue',record.code);
        }
    });
    $('#dialog').dialog({
        title:title,
        shadow:false,
        buttons:'#dialogBtns',
        modal:true,
        closed:false
    }).dialog('center');
}