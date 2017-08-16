var column = [
    [
        { field: 'areaname', title: '所属部门', rowspan: 2, align: 'center' },
        { field: 'empnum', title: '警员总数', rowspan: 2, width: 80, align: 'center' },
        { field: 'recorder', title: '执法记录仪数', rowspan: 2, width: 80, align: 'center' },
        { field: 'upload', title: '民警上传情况', colspan: 3, align: 'center' },
        { field: 'warning', title: '警情数', colspan: 9, align: 'center' },
        { field: 'case', title: '案件数', colspan: 3, align: 'center' },
        { field: 'collect', title: '采集站情况', colspan: 3, align: 'center' }
    ],
    [
        { field: 'uploadnum', title: '上传警员数', width: 80, align: 'center' },
        { field: 'unuploadnum', title: '未上传民警数', width: 80, align: 'center' },
        { field: 'uploadper', title: '警员上传率', width: 80, align: 'center' },
        { field: 'common', title: '一般警情', width: 80, align: 'center' },
        { field: 'major', title: '重大警情', width: 80, align: 'center' },
        { field: 'spot', title: '当场盘问检查', width: 80, align: 'center' },
        { field: 'force', title: '行政强制执行', width: 80, align: 'center' },
        { field: 'impede', title: '阻碍民警执法妨碍公务', width: 80, align: 'center' },
        { field: 'otherdata', title: '其他数据', width: 80, align: 'center' },
        { field: 'unmark', title: '未编辑数据', width: 80, align: 'center' },
        { field: 'disuse', title: '无效数据', width: 80, align: 'center' },
        { field: 'num', title: '合计', width: 80, align: 'center' },
        { field: 'administration', title: '行政案件', width: 80, align: 'center' },
        { field: 'criminal', title: '刑侦案件', width: 80, align: 'center' },
        { field: 'case_num', title: '合计', width: 80, align: 'center' },
        { field: 'wsbase_num', title: '采集站数', width: 80, align: 'center' },
        { field: 'wsbase_online', title: '连接数', width: 80, align: 'center' },
        { field: 'wsbase_per', title: '连接率', width: 80, align: 'center' }
    ]
];



//树的实例化
var tree = new Tree('#area_list');
// 创建时间对象
var judgeTime = new Time(new Date(), 0);
var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
module.link = 'link';
module.search = function(data){
    var data = app.serializeJson('#searchForm');
    if (!judgeTime.judge(data.btime, data.etime)) {
        return false;
    }
    data.areacode = module.areacode;
    data.link = module.link;
    $('#treegrid').treegrid('load', data);
}
module.clickTree = function(node) {
    module.areacode = node.areacode;
    module.areaname = node.text;
    $('#mu_ser').html(module.areaname);
    module.search();
}
var column_link = {
    upload:['uploadnum','unuploadnum','uploadper'],
    collect:['wsbase_num','wsbase_online','wsbase_per'],
    'case':['administration','criminal','case_num'],
    warning:['common','major','spot','force','impede','otherdata','unmark','disuse','num']
};
$(function() {
    //初始化时间
    var time = new Date();
    $('#etime').datebox({ value: new Time(time, 0).init() });
    $('#btime').datebox({ value: new Time(time, 6).init() });
    //树的初始化
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick: module.clickTree
    });
    $('#mu_ser').html(module.areaname);
    app.treegrid('#treegrid', {
        url: 'Case/case_sat',
        queryParams: {
            areacode: module.areacode,
            link: module.link,
            rand: Math.random()
        },
        idField: 'areaid',
        treeField: 'areaname',
        title: '统计信息',
        columns: column
    });
    // 联级按钮切换
    $('#link').add('#unlink').bind('click', function() {
        $('.btns>a.activeLK').removeClass('activeLK');
        $(this).addClass('activeLK');
        if ($(this).find('.l-btn-text').html() == '精确搜索') {
            module.link = '';
        } else {
            module.link = 'link';
        }
        module.search();
    });
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