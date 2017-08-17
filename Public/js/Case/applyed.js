var things = {};
things.areacode = app.tp.areacode;
things.areaname = app.tp.areaname;
things.datagridUrl = "Case/case_list";
things.editUrl = "Case/edit_case";
things.playUrl = "Case/play_case_info";
var tree = new Tree("#area_list");
things.show = function() {
    $("#searchForm").form("reset");
    $("#datagrid").datagrid("load", {
        rand: Math.random()
    });
};
things.editBar = function(index) {
    var rows = $('#datagrid').datagrid('getData').rows;
    var info = rows[index];
    delete info.edit_name;
    $.extend($.messager.defaults, {
        ok: "编辑接处警信息",
        cancel: "编辑案件信息"
    });
    $.messager.confirm({
        width: 320,
        height: 160,
        title: "选择",
        msg: "选择编辑类型？",
        fn: function(r) {
            if (r) {
                $("#editForm").form("load", info);
                $("#editDialog").dialog("open");
            } else {
                $("#editForm2").form("load", info);
                $("#editDialog2").dialog("open");
            }
        }
    });
    $.extend($.messager.defaults, {
        ok: "确定",
        cancel: "取消"
    });
};
things.edit = function(target) {
    app.extra("add_edit", {
        url: things.editUrl,
        form: "#editForm",
        dialog: "#editDialog",
        datagrid: "#datagrid",
        linkbutton: target,
        parsedata: function(params) {
            delete params["cpxh"];
        }
    });
};
things.edit2 = function(target) {
    app.extra("add_edit", {
        url: things.editUrl,
        form: "#editForm2",
        dialog: "#editDialog2",
        datagrid: "#datagrid",
        linkbutton: target,
        parsedata: function(params) {
            delete params["cpxh"];
        }
    });
};
things.editCancel = function() {
    $("#editDialog").dialog("close");
    $("#editDialog2").dialog("close");
};
things.empty = function() {
    $("#searchForm").form("reset");
    var t = new Date();
    $('#shotS').datetimebox('setValue', new Time(t, 6).init());
    $('#shotE').datetimebox('setValue', new Time(t, 0).init());
};
things.search = function() {
    app.extra("search", {
        form: "#searchForm",
        datagrid: "#datagrid",
        parsedata: function(data) {
            data.areacode = things.areacode;
            data.hand_status = 2;
            data.type = 1;
        }
    });
};
things.clickTree = function(node) {
    things.areacode = node.areacode;
    things.areaname = node.text;
    $("#mu_area").text(things.areaname);
    things.search();
};
things.play = function(case_key, start_time) {
    var url = app.url('Case/play_case') + '?case_key=' + case_key + '&start_time=' + start_time;
    window.open(url);
};
things.init = function(case_key, start_time) {
    $.messager.confirm('操作提示', '退回申请警情么？', function(r) {
        if (r) {
            app.extra('add_edit', {
                url: 'Case/init_apply',
                datagrid: '#datagrid',
                parsedata: function(data) {
                    data.case_key = case_key;
                    data.start_time = start_time;
                }
            });
        }
    });
}
$(function() {
//案件类型下拉框
  app.combobox('#case_type,#edit_case_type',{type:'case_type'});
  //警情类型下拉框
  app.combobox('#alarm_type,#edit_alarm_type',{type:'alarm_type'});
    var t = new Date();
    $('#shotS').datetimebox('setValue', new Time(t, 6).init());
    $('#shotE').datetimebox('setValue', new Time(t, 0).init());
    app.datagrid("#datagrid", {
        url: things.datagridUrl,
        title: "警情移交编辑",
        fit: true,
        queryParams: {
            type: 1,
            hand_status: 2
        },
        columns: [
            [
                { field: "vedio_id", title: "id", checkbox: true },
                { field: "title", title: "标题", width: 200, align: "center" },
                { field: "alarm_no", title: "警情编号", align: "center" },
                { field: "case_name", title: "案事件名称", width: 200, align: "center" },
                { field: "areaname", title: "出警地址", width: 200, align: "center" },
                { field: "jyxm", title: "出警人", align: "center" },
                { field: "start_time", title: "采集日期", width: 200, align: "center" },
                { field: "areaname", title: "移交部门", align: "center" },
                { field: "jyxm", title: "移交人", align: "center" },
                { field: "end_time", title: "移交日期", width: 200, align: "center" },
                { field: "apply_areaname", title: "接收部门", align: "center" },
                { field: "apply_jyxm", title: "接收人", align: "center" },
                {
                    field: "hand_status",
                    title: "移交状态",
                    align: "center",
                    formatter: function(value) {
                        if (value == 0) {
                            return "移交失败";
                        } else {
                            return "移交成功";
                        }
                    }
                },
                {
                    field: "aa",
                    title: "操作",
                    align: "center",
                    width: 100,
                    formatter: function(value, row, index) {
                        return (
                            '<a href="javascript:void(0)" onclick="things.editBar(' + index + ')" name="edit" title="编辑信息"></a>' +
                            '<a href="javascript:void(0)" onclick="things.play(\'' + row.case_key + '\',\'' + row.start_time + '\')" title="播放" name="play" ></a>'+
                            '<a href="javascript:void(0)" onclick="things.init(\'' + row.case_key + '\',\'' + row.start_time + '\')" title="退回警情" name="init"></a>'
                        );
                    }
                }
            ]
        ],
        onLoadSuccess: function(data) {
            $('a[name="play"]').linkbutton({plain: true,iconCls: "icon icon-bofang"});
            $('a[name="edit"]').linkbutton({plain: true,iconCls: "icon icon-pencil"});
            $('a[name="init"]').linkbutton({plain: true,iconCls: "icon icon-cancel"});
            var a = $(".datagrid-cell-rownumber");
            $.each(a, function(i, m) {
                m.style.width = "21px";
                m.style.padding = "4px";
            });
            if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
                $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
                $(this).parent(".datagrid-view").children(".datagrid-view2");
                $(this)
                    .parent(".datagrid-view")
                    .children(".datagrid-view2")
                    .css("left", 0)
                    .find("div.datagrid-body")
                    .html("没有相关记录，请重新搜索！")
                    .css({ color: "#F00", "text-align": "center", "font-size": "20px" });
            }
            if (data.error) {
                $.messager.alert("操作提示", data.error, "info");
            }
        }
    });
    $("#mu_area").text(things.areaname);
    tree.loadData();
    $(tree.dom).tree({
        onClick: things.clickTree
    });

    // $('#mu_ser').text(things.areaname);
    // $('#tip_area').text(things.areaname);
});