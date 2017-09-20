//树的实例化
var tree = new Tree("#area_list");
//var managerTree = new Tree('#areaList');
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.code = app.tp.code;
module.params = {};
module.editType = 1; //编辑类型 1-警情编辑 2-案件编辑
module.loadVideoDatagrid = false; //是否加载videodatagrid
var Url = "Case/case_list"; //获取数据列表
var editUrl = "Case/play_case_info"; //编辑
var editSaveUrl = "Case/edit_case"; //编辑保存
var addVideoUrl = "Media/show_unpack"; //追加视频显示
var caseMerageUrl = "Case/case_merage"; //案件合并
var caseSliceUrl = "Case/case_slice"; //案件拆分
var mediaPackPopUrl = "Media/pack_pop"; //视频拆分
var mediaPackMerageUrl = "Media/pack_merage"; //视频合包
var caseInitCaseUrl = "Case/init_case"; //数据初始化
var mediaRemoveUrl = "Media/media_remove"; //视频删除
var DATA = {}; //搜索时的数据
var startTime; //警情包开始时间
module.case_key = ''; //警情包的关键字段
var total; //查询之后的总数
module.loadEdit = true;         //需要加载edit
module.loadVideo = true;        //需要加载video
//开始查询
module.search = function() {
    app.extra("search", {
        url: Url,
        form: "#searchForm",
        datagrid: "#datagrid",
        parsedata: function(data) { //解析参数
            data.areacode = module.areacode;
            DATA = data;
        }
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
//编辑按钮
module.editBar = function(case_key, start_time) {
    if(module.loadEdit){
        $('#editEasy').show();
        $.parser.parse('#editEasy');
        $("#shotS4").datetimebox("setValue", app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
        $("#shotE4").datetimebox("setValue", app.date('Y-m-d') + ' 23:59:59');
        module.loadEdit = false;
    }
    startTime = start_time;
    module.case_key = case_key;
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
                $('#case_panel').hide();
                $("#case_no").textbox({ required: false });
                $("#case_name").textbox({ required: false });
                module.editType = 1;
            } else {
                $("#case_no").textbox({ required: true });
                $("#case_name").textbox({ required: true });
                $('#case_panel').show();
                module.editType = 2;
            }
            $("#editDialog").dialog("open");
            if (module.loadVideoDatagrid) {
                $('#video_datagrid').datagrid('load', { case_key: case_key, start_time: start_time });
            } else {
                module.loadVideoDatagrid = true;
                app.datagrid("#video_datagrid", {
                    url: editUrl,
                    title: "视频详情",
                    fit: true,
                    autoRowHeight:false,
                    columns: [
                        [{ field: "id", checkbox: true },
                            { field: "wjbh", title: "文件名称", width: 200, align: "center" },
                            { field: "source_name", title: "来源", width: 200, align: "center" },
                            { field: "jyxm", title: "警员姓名", width: 200, align: "center" },
                            { field: "jybh", title: "警号", width: 200, align: "center" },
                            { field: "cpxh", title: "设备号", width: 200, align: "center" },
                            /*{field: 'alarm_name',title: '保质期限',align: 'center'},
                              {field: 'alarm_no',title: '剩余期限',align: 'center'}, */
                            { field: "file_type_name", title: "文件类型", align: "center" },
                            { field: "start_time", title: "视频开始时间", width: 200, align: "center" },
                            { field: "end_time", title: "视频结束时间", width: 200, align: "center" },
                            /*{field: 'wjcd',title: '大小（M）',align: 'center'}, */
                            { field: "wjcd", title: "时长（秒）", width: 200, align: "center" },
                            {
                                field: "cz",
                                title: "操作",
                                width: 200,
                                align: "center",
                                formatter: function(value, row, index) {
                                    var str = '<a href="javascript:void(0)" title="打开文件" onclick="module.playOne(\'' + row.case_key + "','" + startTime + '\',\''+row.wjbh+'\')" name="play"></a>';
                                    if (row.start_time == startTime) {
                                        str += '<a href="javascript:void(0)" onclick="module.media_remove(\'' +row.start_time +"','" +row.wjbh +'\',\'#video_datagrid\')" name="sc"></a>';
                                        // str += '<span style="color:red">不可操作</span>';
                                        return str;
                                    }
                                    // if (row.source == "3" || row.source == "2") {
                                        str += '<a href="javascript:void(0)" title="删除" onclick="module.media_remove(\'' +
                                            row.start_time +
                                            "','" +
                                            row.wjbh +
                                            '\',\'#video_datagrid\')" name="sc"></a><a href="javascript:void(0)" title="移出警情包" onclick="module.pack_pop(this,\'' +
                                            row.start_time +
                                            "','" +
                                            row.wjbh +
                                            '\',1)" name="cf" ></a>';
                                    /*} else {
                                        str +=
                                            '<a href="javascript:void(0)" onclick="module.pack_pop(this,\'' +
                                            row.start_time +
                                            "','" +
                                            row.wjbh +
                                            '\')" name="cf" title="将文件移出警情包"></a>';
                                    }*/
                                    return str;
                                }
                            }
                        ]
                    ],
                    queryParams: {
                        case_key: case_key,
                        start_time: start_time
                    },
                    onLoadSuccess: function(data) {
                        if (data.total > 0) $("#sbh").val(data.rows[0].cpxh);
                        $("#editForm").form("load", data.info);
                        app.loadInfo('#editForm',data.info);
                        if (data.total == 0 && $(this).datagrid("options").showDatagrid) {
                            $(this)
                                .parent(".datagrid-view")
                                .find("div.datagrid-view1")
                                .hide();
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
                        try {
                            $('a[name="sc"]').linkbutton({
                                iconCls: "icon icon-sc"
                            });
                        } catch (e) {}

                        $('a[name="cf"]').linkbutton({
                            iconCls: "icon icon-cf"
                        });
                        try { $('a[name="play"]').linkbutton({ iconCls: "icon icon-bofang" }); } catch (e) {}
                    },
                    onSelect: function(index, data) {
                        module.timeCompare(this);
                    },
                    onUnselect: function(index, data) {
                        module.timeCompare(this);
                    }
                });
            }
        }
    });
    $.extend($.messager.defaults, {
        ok: "确定",
        cancel: "取消"
    });
};
//警情编辑保存
module.edit = function(target) {
    var n = {
        url: editSaveUrl,
        form: "#editForm",
        dialog: "#editDialog",
        datagrid: "#datagrid",
        linkbutton:target
    };
    n.parsedata = function(params) {
        delete params["cpxh"];
        if (params.alarm_type == "0" || params.alarm_type == "") {
            $.messager.alert("提示", "编辑时警情类型不可以是未编辑或请选择状态", "error");
            return false;
        }
        if (module.editType == 2) {
            if (params.case_type == "0" || params.case_type == "") {
                $.messager.alert("提示", "编辑时案件类型不可以是 未知，请选择 状态", "error");
                return false;
            }
        }
    };
    app.extra("add_edit", n);
};
//编辑取消
module.editCancel = function() {
    $("#editDialog").dialog("close");
};
//播放视频
module.play = function(case_key, start_time) {
    var url = app.url("Case/play_case") + "?case_key=" + case_key + "&start_time=" + start_time;
    window.open(url);
};
module.playOne = function(case_key, start_time,wjbh) {
    var url = app.url("Case/play_case") + "?case_key=" + case_key + "&start_time=" + start_time +'&wjbh='+wjbh;
    window.open(url);
};
module.search_tree = function(value){
    tree.search_tree(value,1);
}
//计算天数差的函数，通用
function DateDiff(sDate1, sDate2) {
    //sDate1和sDate2是2002-12-18格式
    var aDate, oDate1, oDate2, iDays;
    aDate = sDate1.split("-");
    oDate1 = new Date(aDate[1], aDate[2], aDate[0]); //转换为12-18-2002格式
    aDate = sDate2.split("-");
    oDate2 = new Date(aDate[1] + "-" + aDate[2] + "-" + aDate[0]);
    iDays = Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24; //把相差的毫秒数转换为天数
    return iDays;
}
//追加视频查询
module.search2 = function() {
    app.extra("search", {
        url: addVideoUrl,
        form: "#searchForm2",
        datagrid: "#addVideo_datagrid"
    });
};
//追加视频
module.addvideo = function() {
    if(module.loadVideo){
        $('#video').show();
        $.parser.parse('#video');
        $("#shotS2").datetimebox("setValue", app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
        $("#shotE2").datetimebox("setValue", app.date('Y-m-d') + ' 23:59:59');
        module.loadVideo = false;
    }
    $("#addVideo").dialog("open");
    app.datagrid("#addVideo_datagrid", {
        url: addVideoUrl,
        fit: true,
        columns: [
            [{
                    field: "id",
                    checkbox: true
                },
                {
                    field: "areaname",
                    title: "部门",
                    width: 200,
                    align: "center"
                },
                {
                    field: "wjbh",
                    title: "文件编号",
                    width: 200,
                    align: "center"
                },
                {
                    field: "start_time",
                    title: "开始时间",
                    width: 200,
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
                            '<a href="javascript:void(0)" title="合并警情" onclick="module.pack_merage(this,\'' +
                            row.wjbh +
                            "','" +
                            row.start_time +
                            '\')" name="hb"></a>'
                        );
                    }
                }
            ]
        ],
        queryParams: app.serializeJson("#searchForm2"),
        onLoadSuccess: function(data) {
            $("#video_datagrid").datagrid("reload");
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
            $('a[name="hb"]').linkbutton({
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
            singleSelect: true,
            linkbutton: target,
            parsedata: function(data) {
                data.caseInfo = caseInfo;
            }
        });
    }
};

//拆分警情
module.slice = function(target) {
    var rows = $("#video_datagrid").datagrid("getSelections");
    if (rows.length == 0) return false;
    var wjbhInfo = {};
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].start_time == startTime) {
            $.messager.alert('操作提示', '无法拆分采集时间与警情包相同的文件', 'info');
            return false;
        }
        wjbhInfo[rows[i].wjbh] = rows[i].start_time;
    }
    app.extra("add_edit", {
        datagrid: "#video_datagrid",
        url: caseSliceUrl,
        linkbutton: target,
        parsedata: function(data) {
            data.wjbhInfo = wjbhInfo;
            data.case_key = rows[0].case_key;
        }
    });
};
module.search_video = function() {
    app.extra('search', {
        datagrid: '#video_datagrid',
        form: '#searchForm3',
        parsedata: function(data) {
            data.case_key = $('#editForm > input[name="case_key"]').val();
            data.start_time = startTime;
        }
    });
}
//拆分案件
/*module.slice2 = function(target) {
    var rows = $("#video_datagrid2").datagrid("getSelections");
    if (rows.length == 0) return false;
    var wjbhInfo = {};
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].start_time == startTime) {
            $.messager.alert('操作提示', '无法拆分采集时间与警情包相同的文件', 'info');
            return false;
        }
        wjbhInfo[rows[i].wjbh] = rows[i].start_time;
    }
    app.extra("add_edit", {
        datagrid: "#video_datagrid2",
        url: caseSliceUrl,
        linkbutton: target,
        parsedata: function(data) {
            data.wjbhInfo = wjbhInfo;
            data.case_key = rows[0].case_key;
        }
    });
};*/

//视频拆分
module.pack_pop = function(target, start_time, wjbh) {
    var wjbhInfo = {};
    wjbhInfo[wjbh] = start_time;
    var obj = {
        url: mediaPackPopUrl,
        linkbutton: target,
        parsedata: function(data) {
            data.wjbhInfo = wjbhInfo;
        }
    }
    obj.datagrid = '#video_datagrid';
    app.extra("add_edit", obj);
};

//视频合并
module.pack_merage = function(target, wjbh, start_time) {
    var wjbhInfo = {};
    wjbhInfo[wjbh] = start_time;
    app.extra("add_edit", {
        datagrid: "#addVideo_datagrid",
        url: mediaPackMerageUrl,
        linkbutton: target,
        parsedata: function(data) {
            data.wjbhInfo = wjbhInfo;
            data.case_key = module.case_key;
        }
    });
};

//数据初始化
module.init_case = function(case_key, start_time) {
    $.messager.confirm('操作提示', '确定将所填信息进行初始化么？', function(r) {
        if (r) {
            app.extra("add_edit", {
                datagrid: "#datagrid",
                url: caseInitCaseUrl,
                parsedata: function(data) {
                    data.case_key = case_key;
                    data.start_time = start_time;
                }
            });
        }
    });
};

//视频删除
module.media_remove = function(start_time, wjbh, datagrid) {
    app.extra("add_edit", {
        datagrid: datagrid,
        url: mediaRemoveUrl,
        parsedata: function(data) {
            data.wjbh = wjbh;
            data.start_time = start_time;
        }
    });
};
$(function() {
    $.parser.parse('#init');
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
    app.combobox('#case_type,#edit_case_type', { type: 'case_type' });
    //警情类型下拉框
    app.combobox('#alarm_type,#edit_alarm_type', { type: 'alarm_type' });
    //设置默认时间
    $("#shotS").datetimebox("setValue", app.date('Y-m-d', app.time() - 6 * 24 * 60 * 60) + ' 00:00:00');
    $("#shotE").datetimebox("setValue", app.date('Y-m-d') + ' 23:59:59');
    //数据表单
    app.datagrid("#datagrid", {
        url: Url,
        title: "数据编辑",
       /* onClickCell:function(rowIndex, field, value){
            if(field != 'cz' && field != 'id'){
                $.messager.alert('提示信息',value,'info');
            }
        },*/

        // checkOnSelect:false,
        columns: [
            [
                { field: "id", checkbox: true },
                { field: "areaname", title: "单位", width: 200, align: "center",formatter:module.titleInfo },
                { field: "title", title: "标题", width: 200, align: "center",formatter:module.titleInfo },
                { field: "alarm_name", title: "案事件名称", width: 200, align: "center",formatter:module.titleInfo},
                { field: "alarm_no", title: "警情编号", width: 200, align: "center",formatter:module.titleInfo },
                { field: "start_time", title: "采集日期", width: 200, align: "center",formatter:module.titleInfo },
                { field: "jyxm", title: "出警人", width: 200, align: "center",formatter:module.titleInfo },
                { field: "alarm_type_name", title: "警情类型", width: 200, align: "center",formatter:module.titleInfo },
                { field: "case_no", title: "案件编号", width: 200, align: "center",formatter:module.titleInfo },
                { field: "case_type_name", title: "案件类型", width: 200, align: "center",formatter:module.titleInfo },
                { field: 'update_time', title: '更新时间', width: 200, align: 'center',formatter:module.titleInfo },
                { field: "scsj", title: "上传日期", width: 200, align: "center",formatter:module.titleInfo },
                {field: 'source_name',title: '来源',width: 200,align: 'center',formatter:module.titleInfo},
                {
                    field: "cz",
                    title: "操作",
                    width: 220,
                    align: "left",
                    formatter: function(value, row, index) {
                        if (row.hand_status == 2 && row.jybh == module.code) {
                            return '<a style="red">已移交</a>';
                        } else {
                            if(row.is_read == '0'){
                                return '<a href="javascript:void(0)" title="打开文件" onclick="module.play(\'' + row.case_key + "','" + row.start_time + '\')" name="play"></a><a style="red">只读</a>';
                            }else if (row.hand_status == 2) {
                                return '<a href="javascript:void(0)" title="打开文件" onclick="module.play(\'' + row.case_key + "','" + row.start_time + '\')" name="play"></a>' +
                                    '<a href="javascript:void(0)" title="编辑文件" onclick="module.editBar(\'' + row.case_key + "','" + row.start_time + '\')" name="edit" ></a>';
                            } else {
                                return (
                                    '<a href="javascript:void(0)" title="打开文件" onclick="module.play(\'' + row.case_key + "','" + row.start_time + '\')" name="play"></a>' +
                                    '<a href="javascript:void(0)" title="编辑文件" onclick="module.editBar(\'' + row.case_key + "','" + row.start_time + '\')" name="edit" ></a>' +
                                    '<a href="javascript:void(0)" title="数据初始化" onclick="module.init_case(\'' + row.case_key + "','" + row.start_time + '\')" name="cx"></a>'
                                );
                            }
                        }
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
                $(this).parent(".datagrid-view").find("div.datagrid-view1").hide();
                $(this).parent(".datagrid-view").children(".datagrid-view2");
                $(this).parent(".datagrid-view").children(".datagrid-view2").css("left", 0)
                    .find("div.datagrid-body").html("没有相关记录，请重新搜索！")
                    .css({
                        color: "#F00",
                        "text-align": "center",
                        "font-size": "20px"
                    });
            }
            if (data.error) {
                $.messager.alert("操作提示", data.error, "info");
            }
            try { $('a[name="play"]').linkbutton({ iconCls: "icon icon-bofang" }); } catch (e) {}
            try { $('a[name="edit"]').linkbutton({ iconCls: "icon icon-pencil" }); } catch (e) {}
            try { $('a[name="cf"]').linkbutton({ iconCls: "icon icon-cf" }); } catch (e) {}
            try { $('a[name="cx"]').linkbutton({ iconCls: "icon icon-cx" }); } catch (e) {}
        },
        onSelect: function(index, data) {
            module.judge();
        },
        onUnselect: function(index, data) {
            module.judge();
        }
    });
});
//判断hand_status是否为2
module.judge = function() {
    var rows = $("#datagrid").datagrid("getSelections");
    if (rows.length == 0) {
        $("#hb").linkbutton("enable");
        return false;
    }
    var handStatus = [];
    var is_reads = [];
    $.each(rows, function(i, m) {
        handStatus.push(m.hand_status);
        is_reads.push(m.is_read);
    });
    if (jQuery.inArray("2", handStatus) > -1 || $.inArray('0',is_reads) > -1) {
        $("#hb").linkbutton("disable");
    } else {
        $("#hb").linkbutton("enable");
    }
};
module.timeCompare = function(target) {
    var rows = $(target).datagrid("getSelections");
    if (rows.length == 0) {
        $(".cf").linkbutton("enable");
        return false;
    }
    var handStatus = [];
    $.each(rows, function(i, m) {
        handStatus.push(m.start_time);
    });
    if (jQuery.inArray(startTime, handStatus) > -1) {
        $(".cf").linkbutton("disable");
    } else {
        $(".cf").linkbutton("enable");
    }
};
module.titleInfo = function(v,r,i){
    return '<span title="'+v+'">'+v+'</span>';
}