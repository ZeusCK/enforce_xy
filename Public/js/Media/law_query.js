//树的实例化
var tree = new Tree('#area_list');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
//var managerTree = new Tree('#areaList');
var module = {};
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
module.params = {};
var str;
//基本的搜索
module.show = function() {
        $('#searchForm').form('reset');
        $('#datagrid').datagrid('load', {
            areaid: module.areaid,
            rand: Math.random()
        });
    }
//搜索事件 ----
module.search = function(emmet) {
    $(emmet).linkbutton('disable');
    var data = app.serializeJson('#searchForm');
    if(data.search_type == 1){
        if(!judgeTime.judge(data['start_time[btime]'], data['start_time[etime]'])){
            return false;
        }
        delete(data['scsj[btime]']);
        delete(data['scsj[etime]']);
    }
    if(data.search_type == 2){
        if(!judgeTime.judge(data['scsj[btime]'], data['scsj[etime]'])){
            return false;
        }
        delete(data['start_time[btime]']);
        delete(data['start_time[etime]']);
    }
    var rows = $('#area_list').tree('getChecked');
    var row = $('#area_list').tree('getSelected');
    if (rows.length == 0) {
        if (row == null) {
            data.areaid = module.areaid;
        } else if (row.code) {
            data.jybh = row.code;
        } else {
            data.areaid = row.id;
        }
    } else {
        var code = [];
        $.each(rows, function(i, m) {
            code.push(m.code);
        });
        data.jybh = code.join();
    }
    module.params = data;
    if($('#label_type').combobox('getValue')==1||$('#label_type').combobox('getValue')==0){
        $('.datagrid-view>.datagrid-view1').show();
        $('.datagrid-view>.datagrid-view2').show();
        $('#myP').remove(); 
        $('#datagrid').datagrid('load', data);
        $(emmet).linkbutton('enable');
    }else{
        $('.datagrid-view').css('textAlign','center');
        module.ajaxSerach(data);
        $(emmet).linkbutton('enable');
    }
    
};
module.ajaxSerach=function(params){
    $.ajax({
        url:app.url('Media/media_list'),
        type:'get',
        data:params,
        success:function(info){
            var string = '<div id="myP" style="width:100%; height:100%; overflow:auto;">';
            if(info.total==0){
                var bfwz=app.public+'image/video_error.jpg';
                for(var i=0;i<20;i++){
                    string+='<div class="photo">'+
                    '<div class="title">哈是的覅水电费</div>'+
                    '<img src="'+bfwz+'" width="320px" height="240px">'+
                    '<div class="imgInfo">'+
                    '<div>包头市交管支队:安锐(020004)</div>'+
                    '<div>时间的记得加女的是</div>'+
                    '</div>'+
                    '</div>';
                }
            }else{
                $('.pagination').pagination({
                    total:info.total
                });
                $('.pagination').pagination({
                    pageSize:20,
                    pageList:[20,30,40],
                    onSelectPage:function(pageNumber,pageSize){
                        module.page = pageNumber;
                        module.rows = pageSize;
                        var param={};
                        for(var key in params){
                            param[key]=params[key];
                        }
                        param['page']=pageNumber;
                        param['rows']=pageSize;
                        module.ajaxSerach(param);
                    }
                });
                $.each(info,function(n,empInfo){
                    empInfo.wjbh = empInfo.wjbh == '' ? '--' : empInfo.wjbh;
                    empInfo.areaname = empInfo.areaname == '' ? '未知部门' : empInfo.areaname;
                    empInfo.jyxm = empInfo.jyxm == '' ? '警员姓名' : empInfo.jyxm;
                    empInfo.mark = empInfo.mark == '' ? '描述' : empInfo.mark;
                    empInfo.jybh = empInfo.jybh == '' ? '警员编号' : empInfo.jybh;
                    if(empInfo.wjlx==3&&empInfo.bfwz!=''){
                        empInfo.bfwz=empInfo.bfwz;
                    }else{
                        empInfo.bfwz=app.public+'image/video_error.jpg';
                    }
                    string+='<div class="photo">'+
                    '<div class="title">'+empInfo.wjbh+'</div>'+
                    '<img src="'+empInfo.bfwz+'" width="320px" height="240px">'+
                    '<div class="imgInfo">'+
                    '<div>'+empInfo.areaname+':'+empInfo.jyxm+'('+empInfo.jybh+')</div>'+
                    '<div>'+empInfo.mark+'</div>'+
                    '</div>'+
                    '</div>';
                });
            }
            string += '</div>';
            $('.datagrid-view>.datagrid-view1').hide();
            $('.datagrid-view>.datagrid-view2').hide();
            $('.datagrid-view').append(string);  
        }
    })
};
module.init_search_form = function() {
    $('#searchForm').form('reset');
    var time = new Date();
    $("#shotS").datetimebox({ value: new Time(time, 7).init() });
    $("#shotE").datetimebox({ value: new Time(time, 0).init() });
    $("#upS").datetimebox({ value: new Time(time, 7).init() });
    $("#upE").datetimebox({ value: new Time(time, 0).init() });
};
//批量编辑
module.edit = function() {
    var rows = $('#datagrid').datagrid('getChecked');
    if (rows.length == 0) {
        $.messager.alert('操作提示', '请选择要编辑的文件', 'info');
        return false;
    }
    var texts = [];
    $.each(rows, function(i, m) {
        texts.push(m.wjbh);
    });
    $('#files').html(texts.join('<br/>'));
    $('#editDialog').dialog({
        title: '编辑的文件'
    });
};
//批量编辑的OK
module.editOk = function() {
    var data = app.serializeJson('#editForm');
    data.wjbh = $('#files').html().split('<br>').join();
    // console.log(data);
    $.ajax({
        url: app.url('Media/media_update'),
        data: data,
        type: 'GET',
        success: function(r) {
            $.messager.alert('操作提示', r.message, 'info');
        }
    });
    $('#editDialog').dialog('close');
    $('#datagrid').datagrid('load',module.params);
};
module.editCancel = function() {
    $('#editDialog').dialog('close');
};
//导出
module.exports = function(emmet) {
    $(emmet).linkbutton('disable');
    var exportInfo = {};
    exportInfo.datagrid = '#datagrid';
    exportInfo.params = module.params;
    exportInfo.delFields = ['id', 'detail'];
    app.exportExcel(exportInfo,function(){
        $(emmet).linkbutton('enable');
    });
};
//查看详情
module.detail = function(wjbh) {
        var url = app.url('Media/play_video') + '?wjbh=' + wjbh;
        var title = '媒体详情';
        //弹窗的宽高
        var w = $(document).width() * 3 / 4;
        var h = $(document).height() * 3 / 4;
        //获得窗口的垂直位置
        var iTop = (window.screen.availHeight - 30 - h) / 2;
        //获得窗口的水平位置
        var iLeft = (window.screen.availWidth - 10 - w) / 2;
        var str = 'height=' + h + ',innerHeight=' + h + ',width=' + w + ',innerWidth=' + w + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no';
        window.open(url);

        //window.open(url,title,'height='+(w*0.75)+' height='+(h*0.75));
    }
    //回车键搜索
function searchTree(event) {
    var e = event || window.event || arguments.callee.caller.arguments[0];
    if (e && e.keyCode == 13) {
        var type = $('#treeType').combobox('getValue');
        var info = $('#keyWord').val();
        tree.search_data(tree.data, info, type);
        tree.search_tree(info, type);
        $('#checkedMsg').html('');
    }
}
module.case_edit = function(){
    var rows = $('#datagrid').datagrid('getChecked');
    if (rows.length == 0) {
        $.messager.alert('操作提示', '请选择要编辑的文件', 'info');
        return false;
    }
    var texts = [];
    var standard = rows[0].jybh;
    var peCaseInfo = {};
    peCaseInfo.wjbh = [];
    for (var i = 0; i < rows.length; i++) {
        if(rows[i].jybh != standard){
            $.messager.alert('操作提示', '请选择同一警员的文件进行案件编辑', 'info');
            return false;
        }
        if(i == 0) peCaseInfo.start_time = rows[i].start_time;
        if(i == (rows.length-1)) peCaseInfo.end_time = rows[i].endtime || rows[i].start_time;
        peCaseInfo.wjbh.push(rows[i].wjbh);
    }
    peCaseInfo.video_title = rows[0].start_time + rows[0].jyxm +'('+rows[0].areaname+')';
    peCaseInfo.jybh = rows[0].jybh;
    peCaseInfo.jyxm = rows[0].jyxm;
    peCaseInfo.cpbh = rows[0].cpxh;
    peCaseInfo.areaid = rows[0].areaid;
    peCaseInfo.cjsj = rows[0].start_time;
    peCaseInfo.scsj = rows[0].scsj;
    peCaseInfo.pe_btime=rows[0].start_time;
    peCaseInfo.pe_etime=rows[0].end_time;
    $('#caseDialog').dialog('open');
    //console.log(peCaseInfo);
    $('#caseForm').form('reset');
    $('#caseForm').form('load',peCaseInfo);
}
module.case_add=function(){
    if($('#pe_name').textbox('getText')==''||$('#pe_code').textbox('getText')==''||$('#pe_type').combobox('getValue')==''){
        $.messager.alert('提示','请完善必填项','info');
    }else{
        var data = app.serializeJson('#caseForm');
        $.ajax({
            url: app.url('Case/add_case'),
            data: data,
            type: 'post',
            success: function(r) {
                $.messager.alert('操作提示', r.message, 'info',function(){
                    $('#caseDialog').dialog('close');
                    $('#datagrid').datagrid('reload');
                });
            }
        });
    }
    
};
module.case_close = function() {
    $('#caseDialog').dialog('close');
};
$(function() {
    //树的初始化
    tree.load_emp_tree();
    //树的额外参数
    $(document).keydown(function(event) { searchTree(event) });
    $('#area_list').tree({
        onSelect: function(node) {
            var rows = $('#area_list').tree('getChecked');
            if (rows.length == 0) {
                $('#checkedMsg').html('选择的名称：' + node.text);
            }
            module.search();
        },
        onCheck: function(node) {
            var rows = $('#area_list').tree('getChecked');
            var text = [];
            $.each(rows, function(i, m) {
                text.push(m.text);
            });
            $('#checkedMsg').html('选择的名称：' + text.join());
            module.search();
        }
    });
    //初始化搜索表单
    module.init_search_form();
    $('#datagrid').datagrid({
        url: app.url('Media/media_list'),
        method: 'get',
        title: '统计信息',
        onClickCell: function(r, f, v) {
            if (f == 'detail') {
                var rowData = $(this).datagrid('getData').rows[r];
                module.detail(rowData.wjbh);
            }
        },
        fitColumns: true,
        rownumbers: true,
        fit: true,
        pageSize: 15,
        pageNumber: 1,
        pageList: [15, 20, 25, 30],
        columns: [
            [
                { field: 'id', checkbox: true },
                { field: 'wjbh', title: '文件名', align: 'center' },
                { field: 'wjlx_name', title: '文件类型', width: 200, align: 'center' },
                { field: 'wjcd', title: '文件长度(h)', width: 200, align: 'center' },
                { field: 'jyxm', title: '拍摄警员', width: 200, align: 'center' },
                { field: 'areaname', title: '所属部门', width: 200, align: 'center' },
                { field: 'start_time', title: '拍摄时间', align: 'center' },
                { field: 'end_time', title: '结束时间', align: 'center' },
                { field: 'scsj', title: '上传时间', align: 'center' },
                { field: 'bzlx_name', title: '标注类型', width: 200, align: 'center' },
                { field: 'mark', title: '备注', width: 200, align: 'center' },
                { field: 'video_type_name', title: '视频类型', width: 200, align: 'center' },
                {
                    field: 'detail',
                    title: '查看详情',
                    width: 200,
                    align: 'center',
                    formatter: function(v, r, i) {
                        return '点击查看';
                    },
                    styler: function(v, r, i) {
                        return 'color:#0E2D5F;cursor:pointer;';
                    }
                }
            ]
        ],
        pagination: true,
        loadFilter: function(data) {
            if (data.error) {
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left', '0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '16px' });
                var info = {};
                info.total = 0;
                info.rows = [];
                return info;
            } else {
                return data;
            }

        },
        onLoadSuccess: function(r) {
            if (r.total == 0) {
                $('div.datagrid-view').find('div.datagrid-view1').hide();
                $('div.datagrid-view2').css('left', '0');
                $('div.datagrid-view2').find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '16px' });
            } else if (r.error) {
                $.messager.alert('操作提示', r.error, 'info');
            }
        }
    });
    $('#label_type').combobox({
        onSelect:function(e){
            if(e.value==2||e.value==3){
                $('#caseEdit').hide();
                $('#Edit').hide();
            }else{
                $('#caseEdit').show();
                $('#Edit').show();
            }
        }
    });
});