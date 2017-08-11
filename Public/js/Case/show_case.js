//树的实例化
var tree = new Tree("#area_list");
//var managerTree = new Tree('#areaList');
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.params = {};
var Url = "Case/case_list"; //获取数据列表
var editUrl = "Case/play_case_info"; //编辑
var editSaveUrl = "Case/edit_case"; //编辑保存
var addVideoUrl = "Media/show_unpack"; //追加视频
var caseMerageUrl = "Case/case_merage"; //案件合并
var DATA = {};
var total;

//默认时间
function Time(n) {
  var myDate = new Date();
  var y = myDate.getFullYear();
  var m = (m = myDate.getMonth() + 1) < 10 ? "0" + m : m;
  var d = (d = myDate.getDate()) < 10 ? "0" + d : d;
  var d2 = (d2 = myDate.getDate() - 7) < 10 ? "0" + d2 : d2;
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
}

//开始查询
module.search = function() {
  app.extra("search", {
    url: Url,
    form: "#searchForm",
    datagrid: "#datagrid",
    parsedata: function(data) {
      data.areacode = module.areacode;
      DATA = data;
    } //解析参数
  });
};

//条件重置
module.init_search_form = function() {
  $("#searchForm").form("reset");
  //设置默认时间
  $("#shotS").datetimebox("setValue", Time());
  $("#shotE").datetimebox("setValue", Time("shotS"));
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

//编辑按钮
module.editBar = function(case_key, start_time) {
  // console.log(case_key)
  $.messager.confirm("选择", "是否要编辑接处警信息？点击确认编辑接处警信息，点击取消编辑案件信息", function(r) {
    if (r) {
      if (case_key) {
        $("#editDialog").dialog("open");
      }
      app.datagrid("#video_datagrid", {
        url: editUrl,
        title: "视频详情",
        fit: true,
        columns: [
          [
            {
              field: "id",
              checkbox: true
            },
            {
              field: "wjbh",
              title: "文件名称",
              align: "center"
            },
            {
              field: "source",
              title: "来源",
              align: "center"
            },
            {
              field: "ccfwq_ip",
              title: "存储服务器IP",
              align: "center"
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
              field: "wjlx",
              title: "文件类型",
              align: "center"
            },
            {
              field: "jyxm",
              title: "视频开始时间",
              width: 200,
              align: "center"
            },
            {
              field: "end_time",
              title: "视频结束时间",
              width: 200,
              align: "center"
            },
            /*                 {
                                    field: 'wjcd',
                                    title: '大小（M）',
                                    align: 'center'
                                }, */
            {
              field: "wjcd",
              title: "时长（秒）",
              width: 200,
              align: "center"
            },
            {
              field: "cz",
              title: "操作",
              width: 200,
              align: "center",
              formatter: function(value, row, index) {
                if (row.source == "1") {
                  return '<a href="javascript:void(0)" disabled=true onclick="" name="sc"></a><a href="javascript:void(0)" onclick="" name="cf"></a>';
                } else {
                  return '<a href="javascript:void(0)" onclick="" name="sc"></a><a href="javascript:void(0)" onclick="" name="cf"></a>';
                }
              }
            }
          ]
        ],
        queryParams: {
          case_key: case_key,
          start_time: start_time
        },
        onLoadSuccess: function(data) {
          $("#editForm").form("load", data.info);
          if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
            $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
            $(this).parent(".datagrid-view").children(".datagrid-view2");
            $(this)
              .parent(".datagrid-view")
              .children(".datagrid-view2")
              .css("left", 0)
              .find("div.datagrid-body")
              .html("没有相关记录，请重新搜索！")
              .css({
                color: "#F00",
                "text-align": "center",
                "font-size": "20px"
              });
          }
          if (data.error) {
            $.messager.alert("操作提示", data.error, "info");
          }
          $('a[name="sc"]').linkbutton({
            plain: true,
            iconCls: "icon icon-sc"
          });
          $('a[name="cf"]').linkbutton({
            plain: true,
            iconCls: "icon icon-cf"
          });
        }
      });
    } else {
      if (case_key) {
        $("#editDialog2").dialog("open");
      }
      app.datagrid("#video_datagrid2", {
        url: editUrl,
        title: "视频详情",
        fit: true,
        columns: [
          [
            {
              field: "id",
              checkbox: true
            },
            {
              field: "wjbh",
              title: "文件名称",
              align: "center"
            },
            {
              field: "source",
              title: "来源",
              align: "center"
            },
            {
              field: "ccfwq_ip",
              title: "存储服务器IP",
              align: "center"
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
              field: "wjlx",
              title: "文件类型",
              align: "center"
            },
            {
              field: "jyxm",
              title: "视频开始时间",
              width: 200,
              align: "center"
            },
            {
              field: "end_time",
              title: "视频结束时间",
              width: 200,
              align: "center"
            },
            /*                 {
                                    field: 'wjcd',
                                    title: '大小（M）',
                                    align: 'center'
                                }, */
            {
              field: "wjcd",
              title: "时长（秒）",
              width: 200,
              align: "center"
            },
            {
              field: "cz",
              title: "操作",
              width: 200,
              align: "center",
              formatter: function(value, row, index) {
                if (row.source == "1") {
                  return '<a href="javascript:void(0)" disabled=true onclick="" name="sc"></a><a href="javascript:void(0)" onclick="" name="cf"></a>';
                } else {
                  return '<a href="javascript:void(0)" onclick="" name="sc"></a><a href="javascript:void(0)" onclick="" name="cf"></a>';
                }
              }
            }
          ]
        ],
        queryParams: {
          case_key: case_key,
          start_time: start_time
        },
        onLoadSuccess: function(data) {
          $("#editForm2").form("load", data.info);
          if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
            $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
            $(this).parent(".datagrid-view").children(".datagrid-view2");
            $(this)
              .parent(".datagrid-view")
              .children(".datagrid-view2")
              .css("left", 0)
              .find("div.datagrid-body")
              .html("没有相关记录，请重新搜索！")
              .css({
                color: "#F00",
                "text-align": "center",
                "font-size": "20px"
              });
          }
          if (data.error) {
            $.messager.alert("操作提示", data.error, "info");
          }
          $('a[name="sc"]').linkbutton({
            plain: true,
            iconCls: "icon icon-sc"
          });
          $('a[name="cf"]').linkbutton({
            plain: true,
            iconCls: "icon icon-cf"
          });
        }
      });
    }
  });
};

//编辑保存
module.edit = function(target, n) {
  var shujuObj = {
    url: editSaveUrl,
    form: "#editForm",
    dialog: "#editDialog",
    datagrid: "#datagrid"
  };
  var shujuObj2 = {
    url: editSaveUrl,
    form: "#editForm2",
    dialog: "#editDialog2",
    datagrid: "#datagrid"
  };
  var n = 1 ? shujuObj : shujuObj2;
  n.parsedata = function(params) {
    delete params["cpxh"];
    if (params.alarm_type == "0") {
      $.messager.alert("提示", "编辑时警情类型不可以是未编辑状态", "error");
      return false;
    }
  };
  app.extra("add_edit", n);
};

//编辑取消
module.editCancel = function() {
  $("#editDialog,#editDialog").dialog("close");
};

//计算天数差的函数，通用
function DateDiff(sDate1, sDate2) {
  //sDate1和sDate2是2002-12-18格式
  var aDate, oDate1, oDate2, iDays;
  aDate = sDate1.split("-");
  oDate1 = new Date(aDate[1] + "-" + aDate[2] + "-" + aDate[0]); //转换为12-18-2002格式
  aDate = sDate2.split("-");
  oDate2 = new Date(aDate[1] + "-" + aDate[2] + "-" + aDate[0]);
  iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
  return iDays;
}

//追加视频
module.addvideo = function() {
  $("#addVideo").dialog("open");
  app.datagrid("#addVideo_datagrid", {
    url: addVideoUrl,
    fit: true,
    columns: [
      [
        {
          field: "id",
          checkbox: true
        },
        {
          field: "areaname",
          title: "部门",
          align: "center"
        },
        {
          field: "wjbh",
          title: "文件编号",
          align: "center"
        },
        {
          field: "start_time",
          title: "开始时间",
          align: "center"
        },
        {
          field: "jyxm",
          title: "警员",
          width: 200,
          align: "center"
        },
        {
          field: "cz",
          title: "操作",
          width: 200,
          align: "center",
          formatter: function(value, row, index) {
            return (
              '<a href="javascript:void(0)" title="合并警情" onclick="" name="hb" tiggle="' +
              row.case_key +
              '"></a>'
            );
          }
        }
      ]
    ],
    /*     queryParams: {
          case_key: case_key,
          start_time: start_time
        }, */
    onLoadSuccess: function(data) {
      if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
        $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
        $(this).parent(".datagrid-view").children(".datagrid-view2");
        $(this)
          .parent(".datagrid-view")
          .children(".datagrid-view2")
          .css("left", 0)
          .find("div.datagrid-body")
          .html("没有相关记录，请重新搜索！")
          .css({
            color: "#F00",
            "text-align": "center",
            "font-size": "20px"
          });
      }
      if (data.error) {
        $.messager.alert("操作提示", data.error, "info");
      }
      $('a[name="sc"]').linkbutton({
        plain: true,
        iconCls: "icon icon-sc"
      });
      $('a[name="cf"]').linkbutton({
        plain: true,
        iconCls: "icon icon-cf"
      });
      $('a[name="hb"]').linkbutton({
        plain: true,
        iconCls: "icon icon-hb"
      });
    }
  });
};

//合并警情
module.merge = function(target) {
  var rows = $("#datagrid").datagrid("getSelections");
  if (rows.length < 2) {
    $.messager.alert("提示", "请最少选中2条数据进行合并！", "info");
  } else {
    var caseInfo = {};
    $.each(rows, function(i, m) {
      var info = {};
      caseInfo[m.case_key] = m.start_time;
    });
    app.extra("add_edit", {
      datagrid: "#datagrid",
      url: caseMerageUrl,
      linkbutton: target,
      parsedata: function(data) {
        data.caseInfo = caseInfo;
      }
    });
  }
};

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

  //案件类型下拉框
  var caseTypeUrl = app.tp.ajax + "?tpUrl=Function/dic_val_item&type=case_type";
  $("#case_type,#edit_case_type").combobox({
    method: "GET",
    url: caseTypeUrl,
    valueField: "value",
    textField: "item"
  });

  //警情类型下拉框
  var alarmTypeUrl =
    app.tp.ajax + "?tpUrl=Function/dic_val_item&type=alarm_type";
  $("#alarm_type,#edit_alarm_type").combobox({
    method: "GET",
    url: alarmTypeUrl,
    valueField: "value",
    textField: "item"
  });

  //设置默认时间
  $("#shotS").datetimebox("setValue", Time());
  $("#shotE").datetimebox("setValue", Time("shotS"));

  //数据表单
  app.datagrid("#datagrid", {
    url: Url,
    title: "数据编辑",
    columns: [
      [
        {
          field: "id",
          checkbox: true
        },
        {
          field: "areaname",
          title: "单位",
          align: "center"
        },
        {
          field: "title",
          title: "标题",
          align: "center"
        },
        {
          field: "alarm_name",
          title: "案事件名称",
          align: "center"
        },
        {
          field: "alarm_no",
          title: "警情编号",
          align: "center"
        },
        {
          field: "start_time",
          title: "采集日期",
          align: "center"
        },
        {
          field: "jyxm",
          title: "出警人",
          width: 200,
          align: "center"
        },
        {
          field: "alarm_type_name",
          title: "警情类型",
          width: 200,
          align: "center"
        },
        {
          field: "case_no",
          title: "案件编号",
          align: "center"
        },
        {
          field: "case_type_name",
          title: "案件类型",
          width: 200,
          align: "center"
        },
        /*     {
                        field: 'update_time',
                        title: '更新时间',
                        width: 200,
                        align: 'center'
                    }, */
        {
          field: "scsj",
          title: "上传日期",
          width: 200,
          align: "center"
        },
        /*     {
                        field: 'source',
                        title: '来源',
                        width: 200,
                        align: 'center'
                    }, */
        {
          field: "cz",
          title: "操作",
          width: 220,
          align: "center",
          formatter: function(value, row, index) {
            return (
              '<a href="javascript:void(0)" title="打开文件" onclick="module.play_info(\'' +
              row.case_key +
              '\')" name="play" tiggle="' +
              row.case_key +
              '"></a><a href="javascript:void(0)" onclick="module.editBar(\'' +
              row.case_key +
              "','" +
              row.start_time +
              '\')" name="edit" title="编辑文件"></a><a href="javascript:void(0)" title="撤销编辑" onclick="" name="cx" tiggle="' +
              row.case_key +
              '"></a>'
            );
          }
        }
      ]
    ],
    rowStyler: function(index, row) {
      var dd1 = String(row.start_time);
      var dd2 = dd1;
      var dd = Time("shotS");
      var days = DateDiff(dd, dd2);
      return row.alarm_no == ""
        ? days >= 3 ? (days > 5 ? "color:red" : "color:orange") : ""
        : "";
    },
    onLoadSuccess: function(data) {
      if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
        $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
        $(this).parent(".datagrid-view").children(".datagrid-view2");
        $(this)
          .parent(".datagrid-view")
          .children(".datagrid-view2")
          .css("left", 0)
          .find("div.datagrid-body")
          .html("没有相关记录，请重新搜索！")
          .css({
            color: "#F00",
            "text-align": "center",
            "font-size": "20px"
          });
      }
      if (data.error) {
        $.messager.alert("操作提示", data.error, "info");
      }
      $('a[name="play"]').linkbutton({
        plain: true,
        iconCls: "icon icon-bofang"
      });
      $('a[name="edit"]').linkbutton({
        plain: true,
        iconCls: "icon icon-edit"
      });
      $('a[name="cf"]').linkbutton({
        plain: true,
        iconCls: "icon icon-cf"
      });
      $('a[name="cx"]').linkbutton({
        plain: true,
        iconCls: "icon icon-cx"
      });
    }
  });
});
