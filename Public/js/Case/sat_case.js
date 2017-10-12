//树的实例化
var tree = new Tree('#area_list');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
var searchData = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.link = 'link';
module.showCounts = false;
module.search = function(data){
    var data = app.serializeJson('#searchForm');
    if (!judgeTime.judge(data.btime, data.etime)) {
        return false;
    }
    data.areacode = module.areacode;
    data.link = module.link;
    var areaUncheckeds = $(tree.dom).tree('getChecked','unchecked');
    var areas = [];
    $.each(areaUncheckeds,function(n,m){
        areas.push(m.areacode);
    });
    data.areas = areas;
    searchData = data;
    $('#treegrid').treegrid('load', data);
}
module.clickTree = function(node) {
    module.areacode = node.areacode;
    module.areaname = node.text;
    $('#mu_ser').html(module.areaname);
    module.search();
}
module.exports = function(target) {
    app.extra('export',{
        treegrid:'#treegrid',
        params:searchData,
        linkbutton:target,
        parseFileds:function(field){
            delete field.upload;
            delete field.collect;
            delete field['case'];
            delete field['warning'];
        }
    });
}
module.search_tree = function(value){
    tree.search_tree(value,1);
}

var column_link = {
    upload:['uploadnum','unuploadnum','uploadper'],
    collect:['wsbase_num','wsbase_online','wsbase_per'],
    'case':['administration','criminal','case_num'],
    warning:['common','major','spot','force','impede','otherdata','unmark','disuse','num']
};
module.selectColum = function(field){
    if(field == 'uploadnum' || field == 'unuploadnum') return empColums;
    if(field == 'wsbase_num' || field == 'wsbase_online') return wsColums;
    return alarmColums;
}
module.titleInfo = function(v,r,i){
    if(v != '0' && v != '-'){
        return '<span title="'+v+'" style="cursor:pointer;">'+v+'</span>';
    }
    return v;
}
var column = [
    [
        { field: 'areaname', title: '单位', rowspan: 2, width: 200,align: 'center' },
        { field: 'empnum', title: '警员总数', rowspan: 2, width: 80, align: 'center' },
        { field: 'quaempnum', title: '执法警员总数', rowspan: 2, width: 80, align: 'center' },
        { field: 'recorder', title: '执法记录仪数', rowspan: 2, width: 80, align: 'center' },
        { field: 'upload', title: '民警上传情况', colspan: 3, align: 'center' },
        { field: 'warning', title: '警情数', colspan: 9, align: 'center' },
        { field: 'case', title: '案件数', colspan: 3, align: 'center' },
        { field: 'collect', title: '采集站情况', colspan: 3, align: 'center' }
    ],
    [
        { field: 'uploadnum', title: '上传警员数', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'unuploadnum', title: '未上传民警数', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'uploadper', title: '警员上传率', width: 80, align: 'center' },
        { field: 'common', title: '一般警情', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'major', title: '重大警情', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'spot', title: '当场盘问检查', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'force', title: '行政强制执行', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'impede', title: '阻碍民警执法妨碍公务', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'otherdata', title: '其他数据', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'unmark', title: '未编辑数据', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'disuse', title: '无效数据', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'num', title: '合计', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'administration', title: '行政案件', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'criminal', title: '刑侦案件', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'case_num', title: '合计', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'wsbase_num', title: '采集站数', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'wsbase_online', title: '连接数', width: 80, align: 'center',formatter:module.titleInfo },
        { field: 'wsbase_per', title: '连接率', width: 80, align: 'center' }
    ]
];
var pass_field = ['areaname','empnum','recorder','uploadper','wsbase_per','quaempnum'];
var wsColums = [[
                {field:'gzz_ip',title:'工作站IP',align:'center'},
                {field:'areaname',title:'单位', width: 200, align:'center'},
                {field:'ztsj', title: '最后在线时间', width: 200, align: 'center' },
                {field:'hzr', title: '负责人', width: 200, align: 'center' },
                {field:'dh', title: '负责人电话', width: 200, align: 'center' },
                {field:'qyztname', title: '启用状态', width: 200, align: 'center' },
                {field:'zxztname',title:'在线状态',width:200,align:'center'}
                ]];
var alarmColums = [[
                { field: "areaname", title: "单位", width: 200, align: "center" },
                { field: "title", title: "标题", width: 200, align: "center" },
                { field: "alarm_name", title: "案事件名称", width: 200, align: "center"},
                { field: "alarm_no", title: "警情编号", width: 200, align: "center" },
                { field: "start_time", title: "拍摄日期", width: 200, align: "center" },
                { field: "jyxm", title: "出警人", width: 200, align: "center" },
                { field: "alarm_type_name", title: "警情类型", width: 200, align: "center" },
                { field: "case_no", title: "案件编号", width: 200, align: "center" },
                { field: "case_type_name", title: "案件类型", width: 200, align: "center" },
                { field: "scsj", title: "上传日期", width: 200, align: "center" },
                {field: 'source_name',title: '来源',width: 200,align: 'center'}
                ]];
var empColums = [[
                // {field:'empid',title:'警员id',checkbox:true},
                {field:'code',title:'警员警号',align:'center'},
                {field:'name',title:'姓名',width:200,align:'center'},
                {field:'sex',title:'性别',width:200,align:'center'},
                {field:'empl_qualify_name',title:'执法资格',width:200,align:'center'},
                // {field:'rolename',title:'所属角色',width:200,align:'center'},
                // {field:'remark',title:'备注',width:200,align:'center'},
                {field:'areaname',title:'单位',width:200,align:'center'},
                {field:'phone',title:'电话',width:200,align:'center'}
                ]];
$(function() {
    $('#expend').click(function(){
        if(module.showCounts){
            $('#counts').hide();
            module.showCounts = false;
        }else{
            $('#counts').show();
            module.showCounts = true;
        }
    })
    //初始化时间
    var time = new Date();
    $('#etime').datebox({ value: new Time(time, 0).init() });
    $('#btime').datebox({ value: new Time(time, 6).init() });
    //树的初始化
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        checkbox:true,
        cascadeCheck:true,
        onClick: module.clickTree,
        onLoadSuccess:function(node,data){
            // console.log($(tree.dom).tree('getRoot'));
            $(tree.dom).tree('check',$(tree.dom).tree('getRoot').target);
        }
    });
    // console.log($(tree.dom).tree('getRoots'));
    // $(tree.dom).tree('check',);
    $('#mu_ser').html(module.areaname);
    app.treegrid('#treegrid', {
        url: 'Case/case_sat',
        queryParams: {
            areacode: module.areacode,
            link: module.link,
            rand: Math.random()
        },
        autoRowHeight:false,
        onClickCell:function(field,row){
            if(app.inArray(field,pass_field)) return false;
            if(row[field] == 0 || row[field] == '-') return false;
            $('#detailDialog').dialog('open');
            var query = searchData;
            if(row.areacode){
                query.areacode = row.areacode;
                delete query.jybh;
            }
            if(row.jybh){
                query.jybh = row.jybh;
                delete query.areacode;
            }
            query.field = field;

            app.datagrid('#detailDatagrid',{
                url:'SatDetail/data_list',
                queryParams:query,
                autoRowHeight:false,
                columns:module.selectColum(field)
            });
        },
        idField: 'areaid',
        treeField: 'areaname',
        title: '统计信息',
        columns: column
    });
    // 联级按钮切换
    /*$('#link').add('#unlink').bind('click', function() {
        $('.btns>a.activeLK').removeClass('activeLK');
        $(this).addClass('activeLK');
        if ($(this).find('.l-btn-text').html() == '精确搜索') {
            module.link = '';
        } else {
            module.link = 'link';
        }
        module.search();
    });*/
    $(".check").click(function(){
        var field = $(this).attr('name');
        if($(this)[0].checked){             //显示
            $('#treegrid').treegrid('showColumn',field);
            //点击的是总选项
            if(column_link[field]){
                $('td[field="'+field+'"]').attr('colspan',$('#treegrid').treegrid('getColumnOption',field).colspan);
                $.each(column_link[field],function(n,m){
                    $('#treegrid').treegrid('showColumn',m);
                    $("input[name='"+m+"']").prop('checked',true);
                });
            }else{
                //点击的是分选项
                $.each(column_link,function(n,m){
                    if(app.inArray(field,m)){
                        var nTd = $('td[field="'+n+'"]');
                        if($('#treegrid').treegrid('getColumnOption',n).hidden){
                            $('#treegrid').treegrid('showColumn',n);
                            nTd.attr('colspan',1);
                            $("input[name='"+n+"']").prop('checked',true);
                        }
                        if(nTd.attr('colspan') == 1){
                            $('#treegrid').treegrid('showColumn',m[m.length-1]);
                            $("input[name='"+n+"']").prop('checked',true);
                        }
                        nTd.attr('colspan',parseInt(nTd.attr('colspan'))+1);
                        return false;
                    }
                })

            }
        }else{
            $('#treegrid').treegrid('hideColumn',field);
            if(column_link[field]){
                $.each(column_link[field],function(n,m){
                    $('#treegrid').treegrid('hideColumn',m);
                    $("input[name='"+m+"']").attr('checked',false);
                });
            }else{
                $.each(column_link,function(n,m){
                    if(app.inArray(field,m)){
                        var nTd = $('td[field='+n+']');
                        if(nTd.attr('colspan') == 2){
                            $("input[name='"+n+"']").attr('checked',false);
                            $('#treegrid').treegrid('hideColumn',n);
                            $('#treegrid').treegrid('hideColumn',m[m.length-1]);
                        }else{
                            var nTd = $('td[field="'+n+'"]');
                            nTd.attr('colspan',parseInt(nTd.attr('colspan'))-1);
                        }
                        return false;
                    }
                })
            }
        }
    });
});