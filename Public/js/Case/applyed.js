var things = {};
things.areaid = app.tp.areaid;
things.areaname = app.tp.areaname;
things.datagridUrl = 'Case/case_list';
things.editUrl = 'Case/edit_case';
things.playUrl = 'Case/play_case_info';
var tree = new Tree('#area_list');
things.show = function(){
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load',{
        rand:Math.random()
    });
}
things.editBar = function(data){
    var row=$('#datagrid').datagrid('getRows');
    var index=0;
    $.each(row,function(i,m){
        if(m.vedio_id==data.attr('tiggle') ){
            index=i;
        }
    })
    $('#editForm').form('load',row[index]);
    $('#editDialog').dialog({
        title:'编辑'
    })
}
things.edit = function(target){
    app.extra('add_edit',{
        url:things.editUrl,
        form:'#editForm',
        dialog:'#editDialog',
        datagrid:'#datagrid',
        linkbutton:target
    });
}
things.editCancel=function(){
    $('#editDialog').dialog('close');
}
things.empty=function(){
  $('#searchForm').form('reset');
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
things.play = function(data,time){
    var url='play_case.html'+'?video_id='+data;
    var params = {video_id:data,start_time:time};
    params.tpUrl = 'Case/play_case_info';
    $.ajax({
        url:app.tp.ajax,
        type:'post',
        dataType:'json',
        data:params,
        success:function(data){
            
        }
    });
    window.open(url);
}
$(function(){
    app.datagrid('#datagrid',{
        url:things.datagridUrl,
        title:'警情移交编辑',
        fit:true,
        queryParams:{
          type:1
        },
        columns:[[
          {field:'vedio_id', title: 'id', checkbox: true },
          {field:'title',title:'标题',width:200,align:'center'},
          {field:'alarm_no',title:'警情编号',  align:'center'},
          {field:'case_name', title: '案事件名称', width: 200, align: 'center' },
          {field:'areaname', title: '出警地址', width: 200, align: 'center' },
          {field:'jyxm', title: '出警人',  align: 'center' },
          {field:'start_time', title: '采集日期', width: 200, align: 'center' },    
          {field:'areaname',title:'移交部门',align:'center'},
          {field:'jyxm',title:'移交人',align:'center'},
          {field:'end_time',title:'移交日期',width:200,align:'center'},
          {field:'apply_areaname',title:'接收部门',align:'center'},
          {field:'apply_jyxm',title:'接收人',align:'center'},
          {field:'hand_status',title:'移交状态',align:'center',formatter:function(value){
            if(value==0){
                return '移交失败';
            }else{
                return '移交成功';
            }
          }},
          {field:'aa',title:'操作',align:'center',width:100,formatter:function(value,row,index){
                return '<a href="javascript:void(0)" onclick="things.editBar($(this))" name="edit" tiggle="'+row.vedio_id+'"></a><a href="javascript:void(0)" onclick="things.play('+row.video_id+','+row.start_time+')" name="play" ></a>';
          }}
        ]],
        onLoadSuccess:function(data){
            $('a[name="play"]').linkbutton({plain:true,iconCls:'icon icon-control_play'});
            $('a[name="edit"]').linkbutton({plain:true,iconCls:'icon icon-edit'});
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