//树的实例化
var tree = new Tree('#area_list');
//var managerTree = new Tree('#areaList');
var module = {};
module.areaid = app.tp.areaid;
module.areaname = app.tp.areaname;
module.params = {};
var Url = 'Case/case_list'; //获取数据列表
var editUrl = 'Case/play_case_info'; //编辑
var editSaveUrl = 'Case/edit_case'; //编辑保存
var DATA = {};
var total;
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

//默认时间
function Time(n) {
    var myDate = new Date();
    var y = myDate.getFullYear();
    var m = (m = (myDate.getMonth() + 1)) < 10 ? '0' + m : m;
    var d = (d = myDate.getDate()) < 10 ? '0' + d : d;
    var d2 = (d2 = myDate.getDate() + 7) < 10 ? '0' + d2 : d2;
    var hh = (hh = myDate.getHours()) < 10 ? '0' + hh : hh;
    var mm = (mm = myDate.getMinutes()) < 10 ? '0' + mm : mm;
    var ss = (ss = myDate.getSeconds()) < 10 ? '0' + ss : ss;
    var shotS = y + '-' + m + '-' + d;
    var shotE = y + '-' + m + '-' + d2;
    if (n == "shotS") {
        return shotS;
    } else {
        return shotE;
    }
}

//开始查询
module.search = function () {
    app.extra('search', {
        form: '#searchForm',
        datagrid: '#datagrid',
        parsedata: function (data) {
            DATA = data;
        }, //解析参数
    });
}

//条件重置
module.init_search_form = function () {
    $('#searchForm').form('reset');
    //设置默认时间
    $('#shotS').datebox('setValue', Time("shotS"));
    $('#shotE').datebox('setValue', Time());
}

//导出全部
module.exports = function (target) {
    var total = $('#datagrid').datagrid('getData').total;
    app.extra('export', {
        datagrid: '#datagrid',
        params: DATA,
        rows: total,
        page: 1,
        linkbutton: target,
        parseFileds: function (fields) {
            delete fields['cz'];
        }
    })
}

//编辑按钮
module.editBar = function (video_id) {
    if (video_id) {
        $('#editDialog').dialog('open');
        $.ajax({
            url: app.tp.ajax + '?tpUrl=' + editUrl,
            method: 'GET',
            data: {
                video_id: video_id
            },
            success: function (params) {
                // console.log(params.info)
                $('#editForm').form('load', params.info);
            }
        })
    }
    app.datagrid('#video_datagrid', {
        url: editUrl,
        title: '视频详情',
        columns: [
            [{
                    field: 'wjbh',
                    title: '文件名称',
                    align: 'center'
                },
                {
                    field: 'ccfwq_ip',
                    title: '存储服务器IP',
                    align: 'center'
                },
                /*    {
                       field: 'alarm_name',
                       title: '保质期限',
                       align: 'center'
                   },
                   {
                       field: 'alarm_no',
                       title: '剩余期限',
                       align: 'center'
                   }, */
                {
                    field: 'wjlx',
                    title: '文件类型',
                    align: 'center'
                },
                {
                    field: 'jyxm',
                    title: '视频开始时间',
                    width: 200,
                    align: 'center'
                },
                {
                    field: 'end_time',
                    title: '视频结束时间',
                    width: 200,
                    align: 'center'
                },
                /*                 {
                                    field: 'wjcd',
                                    title: '大小（M）',
                                    align: 'center'
                                }, */
                {
                    field: 'wjcd',
                    title: '时长（秒）',
                    width: 200,
                    align: 'center'
                },
                {
                    field: 'cz',
                    title: '操作',
                    width: 200,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return '<a href="javascript:void(0)" onclick="module.unbind(' + row.video_id + ')" name="unbind"></a>';
                    }
                }
            ]
        ]
    })
}

//编辑保存
module.edit = function (target) {
    app.extra('add_edit', {
        url: editSaveUrl,
        form: '#editForm',
        dialog: '#editDialog',
        datagrid: '#datagrid'
    });
}

//编辑取消
module.editCancel = function () {
    $('#editDialog').dialog('close');
}

//计算天数差的函数，通用
function DateDiff(sDate1, sDate2) { //sDate1和sDate2是2002-12-18格式
    var aDate, oDate1, oDate2, iDays;
    aDate = sDate1.split("-");
    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); //转换为12-18-2002格式
    aDate = sDate2.split("-");
    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
    return iDays;
}

$(function () {
    //树的初始化
    tree.load_emp_tree();

    //树的额外参数
    $(document).keydown(function (event) {
        searchTree(event)
    });
    $('#area_list').tree({
        onSelect: function (node) {
            var rows = $('#area_list').tree('getChecked');
            if (rows.length == 0) {
                $('#checkedMsg').html('选择的名称：' + node.text);
            }
            module.search();
        },
        onCheck: function (node) {
            var rows = $('#area_list').tree('getChecked');
            var text = [];
            $.each(rows, function (i, m) {
                text.push(m.text);
            });
            $('#checkedMsg').html('选择的名称：' + text.join());
            module.search();
        }
    });

    //案件类型下拉框
    var caseTypeUrl = app.tp.ajax + '?tpUrl=Function/dic_val_item&type=case_type';
    $('#case_type,#edit_case_type').combobox({
        method: 'GET',
        url: caseTypeUrl,
        valueField: 'value',
        textField: 'item'
    })

    //警情类型下拉框
    var alarmTypeUrl = app.tp.ajax + '?tpUrl=Function/dic_val_item&type=alarm_type';
    $('#alarm_type,#edit_alarm_type').combobox({
        method: 'GET',
        url: alarmTypeUrl,
        valueField: 'value',
        textField: 'item'
    })



    //设置默认时间
    $('#shotS').datebox('setValue', Time("shotS"));
    $('#shotE').datebox('setValue', Time());

    //数据表单
    app.datagrid('#datagrid', {
        url: Url,
        title: '数据编辑',
        columns: [
            [{
                    field: 'id',
                    checkbox: true
                },
                {
                    field: 'areaname',
                    title: '单位',
                    align: 'center'
                },
                {
                    field: 'title',
                    title: '标题',
                    align: 'center'
                },
                {
                    field: 'alarm_name',
                    title: '案事件名称',
                    align: 'center'
                },
                {
                    field: 'alarm_no',
                    title: '警情编号',
                    align: 'center'
                },
                {
                    field: 'start_time',
                    title: '采集日期',
                    align: 'center'
                },
                {
                    field: 'jyxm',
                    title: '出警人',
                    width: 200,
                    align: 'center'
                },
                {
                    field: 'alarm_type_name',
                    title: '警情类型',
                    width: 200,
                    align: 'center'
                },
                {
                    field: 'case_no',
                    title: '案件编号',
                    align: 'center'
                },
                {
                    field: 'case_type_name',
                    title: '案件类型',
                    width: 200,
                    align: 'center'
                },
                /*     {
                        field: 'update_time',
                        title: '更新时间',
                        width: 200,
                        align: 'center'
                    }, */
                {
                    field: 'scsj',
                    title: '上传日期',
                    width: 200,
                    align: 'center'
                },
                /*     {
                        field: 'source',
                        title: '来源',
                        width: 200,
                        align: 'center'
                    }, */
                {
                    field: 'cz',
                    title: '操作',
                    width: 200,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return '<a href="javascript:void(0)" onclick="module.play_info(' + row.video_id + ')" name="play" tiggle="' + row.video_id + '"></a><a href="javascript:void(0)" onclick="module.editBar(' + row.video_id + ')" name="edit"></a>';
                    }
                }
            ]
        ],
        rowStyler: function (index, row) {
            var dd1 = String(row.start_time);
            var dd2 = dd1.substring(0, 10);
            var dd = Time("shotS");
            var days = DateDiff(dd, dd2);
            return days >= 3 ? days > 5 ? 'color:red' : 'color:orange' : '';
        },
        onLoadSuccess: function (data) {
            if (data.total == 0 && $(this).datagrid('options').showDatagrid) {
                $(this).parent('.datagrid-view').find('div.datagrid-view1').hide();
                $(this).parent('.datagrid-view').children('.datagrid-view2');
                $(this).parent('.datagrid-view').children('.datagrid-view2').css('left', 0).find('div.datagrid-body').html('没有相关记录，请重新搜索！').css({
                    'color': '#F00',
                    'text-align': 'center',
                    'font-size': '20px'
                });
            }
            if (data.error) {
                $.messager.alert('操作提示', data.error, 'info');
            }
            $('a[name="play"]').linkbutton({
                plain: true,
                iconCls: 'icon icon-search'
            });
            $('a[name="edit"]').linkbutton({
                plain: true,
                iconCls: 'icon icon-edit'
            });
        }
    });

});