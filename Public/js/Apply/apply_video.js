//树的实例化
var tree = new Tree('#area_list');
//var managerTree = new Tree('#areaList');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
module.params = {};
//基本的搜索
module.show = function() {
        $('#searchForm').form('reset');
        $('#datagrid').datagrid('load', {
            areaid: module.areaid,
            rand: Math.random()
        });
    }
    //搜索事件 ----
module.search = function() {
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
    module.params.isApply = true;
    $('#datagrid').datagrid('load', data);
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
        title: '编辑的文件',
        shadow: false
    });
};
//批量编辑的OK
module.editOk = function() {
    var data = app.serializeJson('#editForm');
    data.wjbh = $('#files').html().split('<br>').join();
    $.ajax({
        url: app.url('Media/media_update'),
        data: data,
        type: 'GET',
        success: function(r) {
            $.messager.alert('操作提示', r.message, 'info');
        }
    });
    $('#editDialog').dialog('close');
}
module.editCancel = function() {
        $('#editDialog').dialog('close');
    }
    //导出
module.exports = function() {
        var exportInfo = {};
        exportInfo.datagrid = '#datagrid';
        exportInfo.params = module.params;
        exportInfo.params.isApply = true;
        exportInfo.delFields = ['id', 'detail'];
        app.exportExcel(exportInfo);
    }
    //查看详情
module.detail = function(wjbh) {
        var url = app.url('Media/play_video/wjbh/' + wjbh);
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
        queryParams: { isApply:true},
        fitColumns: true,
        rownumbers: true,
        fit: true,
        singleSelect: true,
        pageSize: 15,
        pageNumber: 1,
        pageList: [15, 20, 25, 30],
        columns: [
            [
                { field: 'wjbh', title: '文件名', align: 'center' },
                { field: 'wjlx_name', title: '文件类型', width: 200, align: 'center' },
                { field: 'wjcd', title: '文件长度(s)', width: 200, align: 'center' },
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

});