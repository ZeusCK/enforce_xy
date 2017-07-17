var info={};
var areaid = app.tp.areaid;
var areaname = app.tp.areaname;
var tree=new Tree('#tree');
$(function(){
    //左侧tree的加载
    tree.init();
    tree.load_emp_tree();

    $('#pos').html(areaname);
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
            {field:'cpxh',title:'产品序号',width:100,align:'center'},
            {field:'jyxm',title:'警员姓名',width:100,align:'center'},
            {field:'jybh',title:'警员编号',width:100,align:'center'},
            {field:'product',title:'生产厂家',width:100,align:'center'},
            {field:'standard',title:'设备规格',width:100,align:'center'}
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
            info={};
            if(node.iconCls=='icon-user'){
                info.jybh=node.code;
                info.jyxm=node.text;
                $('#datagrid').datagrid('load',info);
                $('#jyxm').textbox('setValue',node.text);
            }else{
                info.areaid=node.id;
                $('#datagrid').datagrid('load',info);
            }
        }
    });
    //搜索按钮
    $('#searching').click(function(){
       $('#datagrid').datagrid({
           queryParams:app.serializeJson('#form')
       });
    });
    //添加按钮
    $('#add').click(function(){
        if(!info.jyxm){
            $.messager.alert('操作提示','请在左侧属性菜单选择警员后添加','info');
            return false;
        }
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
    $('#dialogOk').click(function(){
        var url=$('#dialog').dialog('options').title=='添加'?app.url('Dev/pe_base_add'):app.url('Dev/pe_base_edit');
        var data=app.serializeJson('#dialogForm');
        if(data.cpxh==''){
            $.messager.alert('操作提示','产品序号为必填项！','info');
            return false;
        }
        data.jybh=info.jybh;
        data.jyxm=info.jyxm;
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
    });
    //添加、修改面板的 取消按钮
    $('#dialogDel').click(function(){
        $('#dialog').dialog('close');
    });
});
function operation(title){
    if(title=='添加'){
        $('#dialog p').html('向 '+info.jyxm+' 添加仪器');
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
    $('#dialog').dialog({
        title:title,
        shadow:false,
        buttons:'#dialogBtns',
        modal:true,
        closed:false
    }).dialog('center');
}