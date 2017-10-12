var things = {};
things.areacode = app.tp.areacode;
things.areaname = app.tp.areaname;
things.datagridUrl = 'Case/show_apply_list';
things.editUrl = 'Case/apply_case';
things.cancelUrl = 'Case/init_apply';
things.jybh = app.tp.code;
var tree = new Tree('#area_list');
things.show = function() {
    $('#searchForm').form('reset');
    $('#datagrid').datagrid('load', {
        rand: Math.random()
    });
}
things.apply = function(target, case_key, start_time) {
    $.messager.confirm('操作提示', '你确定提交申请么？', function(r) {
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
things.applyCancel = function() {
    $('#editDialog').dialog('close');
}
things.search = function() {
    app.extra('search', {
        form: '#searchForm',
        datagrid: '#datagrid',
        parsedata: function(data) {
            data.areacode = things.areacode;
            data.action = 0;
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
things.applyCancel = function(target, case_key, start_time) {
    $.messager.confirm('操作提示', '你确定撤销申请么？', function(r) {
        if (r) {
            app.extra('add_edit', {
                url: things.cancelUrl,
                datagrid: '#datagrid',
                linkbutton: target,
                parsedata: function(data) {
                    data.case_key = case_key;
                    data.start_time = start_time;
                }
            });
        }
    });
}
things.search_tree = function(value) {
    tree.search_tree(value, 1);
}
things.titleInfo = function(v, r, i) {
    return '<span title="' + v + '">' + v + '</span>';
}
$(function() {
    app.datagrid('#datagrid', {
        url: things.datagridUrl,
        title: '警情移交',
        columns: [
            [
                { field: 'vedio_id', title: 'id', checkbox: true },
                { field: 'areaname', title: '单位', width: 200, align: 'center', formatter: things.titleInfo },
                { field: 'title', title: '标题', width: 200, align: 'center', formatter: things.titleInfo },
                { field: 'alarm_name', title: '案事件名称', width: 200, align: 'center', formatter: things.titleInfo },
                { field: 'alarm_no', title: '警情编号', width: 200, align: 'center', formatter: things.titleInfo },
                // { field: 'areaname', title: '出警部门', width: 200, align: 'center' },
                { field: "case_addr", title: "出警地址", width: 200, align: "center", formatter: things.titleInfo },
                { field: 'jyxm', title: '出警人', width: 200, align: 'center', formatter: things.titleInfo },
                { field: 'start_time', title: '拍摄日期', width: 200, align: 'center', formatter: things.titleInfo },
                {
                    field: 'aa',
                    title: '操作',
                    width: 100,
                    align: 'center',
                    formatter: function(value, row, index) {
                        if (row.is_read == '0') {
                            var htmlString = '<a style="color:red;">部门只读</a>';
                        } else {
                            if (row.hand_status == 1 && row.apply_jybh == things.jybh) {
                                var htmlString = '<a href="javascript:void(0)" onclick="things.applyCancel(this,\'' + row.case_key + '\',\'' + row.start_time + '\')" name="play" title="撤销申请"></a>';
                            }
                            if (row.hand_status == 1 && row.apply_jybh != things.jybh) {
                                var htmlString = '<a style="color:red;">资源已被申请</a>';
                            }
                            if (row.hand_status == 0) {
                                var htmlString = '<a href="javascript:void(0)" onclick="things.apply(this,\'' + row.case_key + '\',\'' + row.start_time + '\')" name="edit" title="提交申请"></a>';
                            }
                        }
                        return htmlString;
                    }
                }
            ]
        ],
        onLoadSuccess: function(data) {
            try { $('a[name="play"]').linkbutton({ iconCls: 'icon icon-arrow_undo' }); } catch (e) {}
            try { $('a[name="edit"]').linkbutton({ iconCls: 'icon icon-application_key' }); } catch (e) {}
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
    tree.load_no_read_area();
    $(tree.dom).tree({
        onClick: things.clickTree
    });
    $('#shotS').datetimebox('setValue', app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
    $('#shotE').datetimebox('setValue', app.date('Y-m-d') + ' 23:59:59');
});