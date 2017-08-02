var things = {};
things.areaid = app.tp.areaid;
things.areaname = app.tp.areaname;
things.datagridUrl = 'Case/show_apply_list';
things.editUrl = 'Case/apply_case';
things.cancelUrl = 'Case/init_apply';
var tree = new Tree('#area_list');
things.show = function(){
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load',{
        rand:Math.random()
    });
}
things.edit = function(target,id){

    app.extra('add_edit',{
        url:things.editUrl,
        datagrid:'#datagrid',
        linkbutton:target,
        parsedata:function(data){
          data.video_id = id;
        }
    });
}
things.editCancel=function(){
    $('#editDialog').dialog('close');
}
things.search = function(){
    app.extra('search',{
        form:'#searchForm',
        datagrid:'#datagrid'
    });
}
things.clickTree = function(node){
    things.areaid = node.id;
    things.areaname = node.text;
    $('#tip_area').text(node.text);
    $('#mu_ser').text(things.areaname);
    app.extra('search',{
        datagrid:'#datagrid',
        parsedata:function(data){
            data.areaid = things.areaid;
        }
    })
}
things.empty=function(){
  $('#searchForm').form('reset');
}
things.cancel = function(target,id){
    app.extra('add_edit',{
        url:things.cancelUrl,
        datagrid:'#datagrid',
        linkbutton:target,
        parsedata:function(data){
          data.video_id = id;
        }
    });
}
$(function(){
    app.datagrid('#datagrid',{
        url:things.datagridUrl,
        title:'警情移交',
        columns:[[
          {field:'vedio_id', title: 'id', checkbox: true },
          {field:'areaname',title:'单位',width:200,align:'center'},
          {field:'title',title:'标题',width:200,align:'center'},
          {field:'case_name', title: '案事件名称', width: 200, align: 'center' },
          {field:'alarm_no',title:'警情编号', width: 200, align:'center'},
          {field:'areaname', title: '出警地址', width: 200, align: 'center' },
          {field:'jyxm', title: '出警人', width: 200, align: 'center' },
          {field:'start_time', title: '采集日期', width: 200, align: 'center' },    
          {field:'aa',title:'操作',width:100,align:'center',formatter:function(value,row,index){
                return '<a href="javascript:void(0)" onclick="things.edit(this,'+row.video_id+')" name="edit" ><a href="javascript:void(0)" onclick="things.cancel(this,'+row.video_id+')" name="play" ></a>';
          }}
        ]],
        onLoadSuccess:function(data){
            $('a[name="play"]').linkbutton({plain:true,iconCls:'icon icon-arrow_undo'});
            $('a[name="edit"]').linkbutton({plain:true,iconCls:'icon icon-application_key'});
            var a = $('.datagrid-cell-rownumber');
            $.each(a,function(i,m){
                m.style.width='21px';
                m.style.padding='4px';
            })
             if(data.total == 0 && $(this).datagrid('options').showDatagrid){
                $(this).parent('.datagrid-view').find('div.datagrid-view1').hide();
                $(this).parent('.datagrid-view').children('.datagrid-view2');
                $(this).parent('.datagrid-view').children('.datagrid-view2').css('left',0).find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({'color':'#F00','text-align':'center','font-size':'20px'});
            }
            if(data.error){
                $.messager.alert('操作提示',data.error,'info');
            }
        }
    });
    tree.loadData();
    $(tree.dom).tree({
        onClick:things.clickTree
    });
    
    // $('#mu_ser').text(things.areaname);
    // $('#tip_area').text(things.areaname);
});