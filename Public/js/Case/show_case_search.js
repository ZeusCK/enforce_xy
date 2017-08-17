//树的实例化
var tree = new Tree("#area_list");
//var managerTree = new Tree('#areaList');
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.params = {};
var Url = "Case/case_list"; //获取数据列表
var DATA = {};
var total;

//默认时间
function Time(n) {
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

//播放视频
module.play = function(case_key, start_time) {
  var url =
    app.url("Case/play_case") +
    "?case_key=" +
    case_key +
    "&start_time=" +
    start_time;
  window.open(url);
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
  app.combobox('#case_type,#edit_case_type',{type:'case_type'});
  //警情类型下拉框
  app.combobox('#alarm_type,#edit_alarm_type',{type:'alarm_type'});

  //设置默认时间
  $("#shotS,#shotS2").datetimebox("setValue", Time());
  $("#shotE,#shotE2").datetimebox("setValue", Time("shotS"));

  //数据表单
  app.datagrid("#datagrid", {
    url: Url,
    title: "数据查询",
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
        {
          field: "scsj",
          title: "上传日期",
          width: 200,
          align: "center"
        },
        {
          field: "cz",
          title: "操作",
          width: 220,
          align: "center",
          formatter: function(value, row, index) {
            if (row.hand_status == 2) {
              return '<a style="red">已移交</a>';
            } else {
              return (
                '<a href="javascript:void(0)" title="打开文件" onclick="module.play(\'' +
                row.case_key +
                "','" +
                row.start_time +
                '\')" name="play"></a>'
              );
            }
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
    }
  });
});
