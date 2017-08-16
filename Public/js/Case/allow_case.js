var things = {};
things.areacode = app.tp.areacode;
things.areaname = app.tp.areaname;
things.datagridUrl = 'Case/case_list';
things.editUrl = 'Case/allow_apply';
things.cancelUrl = 'Case/init_apply';
var tree = new Tree('#area_list');
things.show = function() {
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load', {
        rand: Math.random()
    });
}

things.allow = function(target, case_key, start_time) {
    $.messager.confirm('操作提示', '你确定审核通过么？', function(r) {
        if (r) {
            app.extra('add_edit', {
                url: things.editUrl,
                datagrid: '#datagrid',
                linkbutton: target,
                parsedata: function(data) {
                    data.start_time = start_time;
                    data.case_key = case_key;
                }
            });
        }
    });
}
things.deny = function(target, case_key, start_time) {
    $.messager.confirm('操作提示', '你确定审核拒绝么？', function(r) {
        if (r) {
            app.extra('add_edit', {
                url: things.cancelUrl,
                datagrid: '#datagrid',
                linkbutton: target,
                parsedata: function(data) {
                    data.start_time = start_time;
                    data.case_key = case_key;
                    data.action = 1;
                }
            });
        }
    });
}
things.editCancel = function() {
    $('#editDialog').dialog('close');
}
things.search = function() {
    app.extra('search', {
        form: '#searchForm',
        datagrid: '#datagrid',
        parsedata: function(data) {
            data.areacode = things.areacode;
            data.type = 0;
            data.hand_status = 1;
        }
    });
}
things.clickTree = function(node) {
    things.areacode = node.areacode;
    things.areaname = node.text;
    $('#tip_area').text(node.text);
    $('#mu_ser').text(things.areaname);
    things.search();
}
things.empty = function() {
    $('#searchForm').form('reset');
    var t = new Date();
    $('#shotS').datetimebox('setValue', new Time(t, 6).init());
    $('#shotE').datetimebox('setValue', new Time(t, 0).init());
}
$(function() {
    app.datagrid('#datagrid', {
        url: things.datagridUrl,
        title: '审核视频',
        fit: true,
        queryParams: {
            type: 0,
            hand_status: 1
        },
        columns: [
            [
                { field: 'case_key', title: 'id', checkbox: true },
                { field: 'title', title: '标题', width: 200, align: 'center' },
                { field: 'alarm_no', title: '警情编号', align: 'center' },
                { field: 'case_name', title: '案事件名称', width: 200, align: 'center' },
                { field: 'areaname', title: '出警地址', width: 200, align: 'center' },
                { field: 'jyxm', title: '出警人', align: 'center' },
                { field: 'start_time', title: '采集日期', width: 200, align: 'center' },
                { field: 'areaname', title: '移交部门', width: 200, align: 'center' },
                { field: 'jyxm', title: '移交人', align: 'center' },
                { field: 'end_time', title: '移交日期', width: 200, align: 'center' },
                { field: 'apply_areaname', title: '接收部门', width: 200, align: 'center' },
                { field: 'apply_jyxm', title: '接收人', width: 200, align: 'center' },
                {
                    field: 'hand_status',
                    title: '移交状态',
                    width: 200,
                    align: 'center',
                    formatter: function(value) {
                        if (value == 1) {
                            return '待审核';
                        } else {
                            return '已审核';
                        }
                    }
                },
                {
                    field: 'aa',
                    title: '操作',
                    width: 200,
                    align: 'center',
                    formatter: function(value, row, index) {
                        return '<a href="javascript:void(0)" onclick="things.allow(this,\'' + row.case_key + '\',\'' + row.start_time + '\')" name="edit" title="审核通过"></a><a href="javascript:void(0)" onclick="things.deny(this,\'' + row.case_key + '\',\'' + row.start_time + '\')" name="play" title="审核拒绝"></a>';
                    }
                }
            ]
        ],
        onLoadSuccess: function(data) {
            $('a[name="play"]').linkbutton({ plain: true, iconCls: 'icon icon-cancel' });
            $('a[name="edit"]').linkbutton({ plain: true, iconCls: 'icon icon-accept' });
            var a = $('.datagrid-cell-rownumber');
            $.each(a, function(i, m) {
                m.style.width = '21px';
                m.style.padding = '4px';
            })
            if (data.total == 0 && $(this).datagrid('options').showDatagrid) {
                $(this).parent('.datagrid-view').find('div.datagrid-view1').hide();
                $(this).parent('.datagrid-view').children('.datagrid-view2');
                $(this).parent('.datagrid-view').children('.datagrid-view2').css('left', 0).find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '20px' });
            }
            if (data.error) {
                $.messager.alert('操作提示', data.error, 'info');
            }
        }
    });
    tree.loadData();
    $(tree.dom).tree({
        onClick: things.clickTree
    });
    var t = new Date();
    $('#shotS').datetimebox('setValue', new Time(t, 6).init());
    $('#shotE').datetimebox('setValue', new Time(t, 0).init());
    // $('#mu_ser').text(things.areaname);
    // $('#tip_area').text(things.areaname);
});