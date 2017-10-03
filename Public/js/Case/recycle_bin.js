//树的实例化
var tree = new Tree("#area_list");
//var managerTree = new Tree('#areaList');
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.code = app.tp.code;
module.params = {};
var Url = "Media/show_unpack"; //获取数据列表
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
            data.del_flag = 1;
            data.recycle = 'recycle';
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
module.remove = function(wjbh, start_time) {
    app.extra('remove', {
        url: 'Media/media_remove',
        datagrid: '#datagrid',
        parsedata: function(data) {
            data.del_flag = 2;
            data.wjbh = wjbh;
            data.start_time = start_time;
        }
    });
};
module.back = function(wjbh, start_time) {
    app.extra('add_edit', {
        url: 'Media/meida_back',
        datagrid: '#datagrid',
        checkData:false,
        parsedata: function(data) {
            data.wjbh = wjbh;
            data.start_time = start_time;
        }
    });
};
module.search_tree = function(value) {
    tree.search_tree(value, 1);
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

    //设置默认时间
    $("#shotS").datetimebox("setValue", app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
    $("#shotE").datetimebox("setValue", app.date('Y-m-d') + ' 23:59:59');

    //数据表单
    app.datagrid("#datagrid", {
        url: Url,
        title: "回收视频",
        queryParams:{
            del_flag:1,
            recycle:'recycle'
        },
        columns: [[
                { field: "id", checkbox: true },
                { field: "areaname", title: "单位", width: 200, align: "center" },
                { field: "wjbh", title: "标题", width: 200, align: "center" },
                { field: "start_time", title: "采集日期", width: 200, align: "center" },
                { field: "jyxm", title: "出警人", width: 200, align: "center" },
                { field: "scsj", title: "上传日期", width: 200, align: "center" },
                { field: 'source_name', title: '来源', width: 200, align: 'center' },
                {
                    field: "cz",
                    title: "操作",
                    width: 220,
                    align: "center",
                    formatter: function(value, row, index) {
                        return '<a href="javascript:void(0)" title="回收视频" onclick="module.back(\'' +row.wjbh +"','" +row.start_time +'\')" name="back"></a>'+ 
                               '<a href="javascript:void(0)" title="彻底删除" onclick="module.remove(\'' +row.wjbh +"','" +row.start_time +'\')" name="remove"></a>';
                    }
                }
            ]
        ],
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
            $('a[name="back"]').linkbutton({iconCls: "icon icon-redo"});
            $('a[name="remove"]').linkbutton({iconCls: "icon icon-cancel"});
        }
    });
});