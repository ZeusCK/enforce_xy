//树的实例化
var tree = new Tree("#area_list");
//var managerTree = new Tree('#areaList');
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.code = app.tp.code;
module.params = {};
module.user = app.tp.user;
module.source = 1;
var Url = "Case/case_list"; //获取数据列表
var DATA = {};
var total;

//默认时间
/*function Time(n) {
  var myDate = new Date();
  var y = myDate.getFullYear();
  var m = (m = myDate.getMonth() + 1) < 10 ? "0" + m : m;
  var d = (d = myDate.getDate()) < 10 ? "0" + d : d;
  var d2 = (d2 = myDate.getDate() - 6) < 10 ? "0" + d2 : d2;
  var hh = (hh = myDate.getHours()) < 10 ? "0" + hh : hh;
  var mm = (mm = myDate.getMinutes()) < 10 ? "0" + mm : mm;
  var ss = (ss = myDate.getSeconds()) < 10 ? "0" + ss : ss;
  var shotS = y + "-" + m + "-" + d + " " + hh + ":" + mm + ":" + ss;
  var shotE = y + "-" + m + "-" + d2 + " " + hh + ":" + mm + ":" + ss;
  if (n == "shotS") {
    return shotS; //当天时间
  } else {
    return shotE; //7天前时间
  }
}*/

//开始查询
module.search = function() {
    app.extra("search", {
        url: Url,
        form: "#searchForm",
        datagrid: "#datagrid",
        parsedata: function(data) {
            data.source = module.source;
            data.areacode = module.areacode;
            DATA = data;
        } //解析参数
    });
};

//条件重置
module.init_search_form = function() {
    $("#searchForm").form("reset");
    //设置默认时间
    $("#shotS").datetimebox("setValue", app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
    $("#shotE").datetimebox("setValue", app.date('Y-m-d') + ' 23:59:59');
};

//导出全部
module.exports = function(target) {
    var total = $("#datagrid").datagrid("getData").total;
    app.extra("export", {
        datagrid: "#datagrid",
        params: DATA,
        rows: total,
        page: 1,
        linkbutton: target,
        parseFileds: function(fields) {
            delete fields["cz"];
        }
    });
};

//上传文件
module.upload = function(case_key, start_time) {
    var url = app.url("Case/case_upload") + "?case_key=" + case_key + "&start_time=" + start_time;
    window.open(url);
};
module.case_add = function() {
    $('#addForm').form('reset');
    var info = {
        title: app.date('Y-m-d H:i:s') + ' ' + module.user + ' 数据',
        source: module.source,
        edit_name: module.user,
        jyxm: module.user,
        scsj: app.date('Y-m-d H:i:s'),
        start_time: app.date('Y-m-d H:i:s')
    };
    $('#addForm').form('load', info);
    $('#addDialog').dialog('open');
};
module.uploadInfo = function(target) {
    app.extra('add_edit', {
        url: 'Case/add_case',
        datagrid: '#datagrid',
        dialog: '#addDialog',
        form: '#addForm',
        linkbutton: target,
        success: function(data) {
            if (data.status) {
                var url = app.url("Case/case_upload") + "?case_key=" + data.case_key + "&start_time=" + data.start_time;
                window.open(url);
            }
        }
    });
};
module.remove = function(case_key, start_time) {
    app.extra('remove', {
        url: 'Case/remove_case',
        datagrid: '#datagrid',
        checkData:false,
        parsedata: function(data) {
            data.case_key = case_key;
            data.start_time = start_time;
        }
    });
}
//计算天数差的函数，通用
function DateDiff(sDate1, sDate2) {
    //sDate1和sDate2是2002-12-18格式
    var aDate, oDate1, oDate2, iDays;
    aDate = sDate1.split("-");
    oDate1 = new Date(aDate[1] + "-" + aDate[2] + "-" + aDate[0]); //转换为12-18-2002格式
    aDate = sDate2.split("-");
    oDate2 = new Date(aDate[1] + "-" + aDate[2] + "-" + aDate[0]);
    iDays = Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24; //把相差的毫秒数转换为天数
    return iDays;
}
module.search_tree = function(value) {
    tree.search_tree(value, 1);
}
module.titleInfo = function(v,r,i){
    return '<span title="'+v+'">'+v+'</span>';
}
$(function() {
    //树的初始化
    tree.loadData(); //管理部门的树
    $("#area_list").tree({
        onClick: function(node) {
            module.areaname = node.text;
            module.areacode = node.areacode;
            $("#mu_area").html(node.text);
            module.search();
        }
    });
    $('#add_case').linkbutton('disable');
    //案件类型下拉框
    app.combobox('#case_type,#edit_case_type', { type: 'case_type' });
    //警情类型下拉框
    app.combobox('#alarm_type,#edit_alarm_type', { type: 'alarm_type' });
    $('#tab').tabs({
        onSelect: function(title,index) {
            if (index == 0) {
                $('#add_case').linkbutton('disable');
                module.source = 1;
            }
            if (index == 1) {
                $('#add_case').linkbutton('enable');
                module.source = 2;
            }
            if (index == 2) {
                $('#add_case').linkbutton('enable');
                module.source = 3;
            }
            // console.log(index);
            if(index == 3){
                var width = $('#collect').width();
                var height = $('#collect').height();
                $('#collect').hide();
                $('#recycleBin').width(width);
                $('#recycleBin').height(height);
                if($('#recycleBin').attr('src') == '') $('#recycleBin').attr('src',app.url('Case/recycle_bin'));
            }else{
                $('#collect').show();
                module.search();
            }
        }
    });
    //设置默认时间
    $("#shotS").datetimebox("setValue", app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
    $("#shotE").datetimebox("setValue", app.date('Y-m-d') + ' 23:59:59');
    //数据表单
    app.datagrid("#datagrid", {
        url: Url,
        title: "数据采集",
        fitColumns: false,
        queryParams: {
            source: 1
        },
        columns: [
            [{
                    field: "id",
                    checkbox: true
                },
                {
                    field: "areaname",
                    title: "单位",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "title",
                    title: "标题",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "alarm_name",
                    title: "案事件名称",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "alarm_no",
                    title: "警情编号",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "start_time",
                    title: "拍摄日期",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "jyxm",
                    title: "出警人",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "alarm_type_name",
                    title: "警情类型",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "case_no",
                    title: "案件编号",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "case_type_name",
                    title: "案件类型",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "scsj",
                    title: "上传日期",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "update_time",
                    title: "更新时间",
                    // width: 200,
                    align: "center",formatter:module.titleInfo
                },
                {
                    field: "cz",
                    title: "操作",
                    width: 75,
                    align: "left",
                    formatter: function(value, row, index) {
                        if (row.hand_status == 2 && row.jybh == module.code) {
                            return '<a style="red">已移交</a>';
                        } else{
                            if (row.is_read == '0') {
                                return '<a style="red">部门只读</a>';
                            } else {
                                return (
                                    '<a href="javascript:void(0)" title="上传文件" onclick="module.upload(\'' +
                                    row.case_key +
                                    "','" +
                                    row.start_time +
                                    '\')" name="upload"></a>' +
                                    '<a href="javascript:void(0)" title="删除警情" onclick="module.remove(\'' +
                                    row.case_key +
                                    "','" +
                                    row.start_time +
                                    '\')" name="remove"></a>'
                                );
                            }

                        } /*else {
                            if (row.is_read == '0') {
                                return '<a style="red">部门只读</a>';
                            } else {
                                return '<a href="javascript:void(0)" title="上传文件" onclick="module.upload(\'' +
                                    row.case_key +
                                    "','" +
                                    row.start_time +
                                    '\')" name="upload"></a>';
                            }
                        }*/
                    }
                }
            ]
        ],
        rowStyler: function(index, row) {
            var dd1 = String(row.scsj);
            var checkTime = app.date('Y-m-d H:i:s', app.time() - 3.5 * 24 * 60 * 60);
            return row.alarm_type == 0 ? checkTime > dd1 ? "color:red" : "color:orange" : "";
        },
        onLoadSuccess: function(data) {
            if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
                // $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
                // $(this).parent(".datagrid-view").children(".datagrid-view2");
                /*$(this).parent(".datagrid-view").children(".datagrid-view2").css("left", 0)
                    .find("div.datagrid-body")
                    .html("没有相关记录，请重新搜索！")
                    .css({
                        color: "#F00",
                        "text-align": "center",
                        "font-size": "20px"
                    });*/
            }
            if (data.error) {
                $.messager.alert("操作提示", data.error, "info");
            }
            try {
                $('a[name="upload"]').linkbutton({
                    iconCls: "icon icon-upload"
                });
            } catch (e) {}
            try {
                $('a[name="remove"]').linkbutton({
                    iconCls: "icon icon-cancel"
                });
            } catch (e) {}

        }
    });
});