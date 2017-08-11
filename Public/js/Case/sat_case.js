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
module.params = {};
module.unchecked = [];
module.link = 'link';
module.clickTree = function(node) {
        module.areacode = node.areacode;
        module.areaname = node.text;
        $('#mu_ser').html(module.areaname);
        module.search();
    }
    //导出
module.exports = function() {
        var exportInfo = {};
        exportInfo.treegrid = '#treegrid';
        exportInfo.params = module.params;
        app.exportExcel(exportInfo);
    }
    //搜索事件 ----
module.search = function() {
    var data = app.serializeJson('#searchForm');
    if (!judgeTime.judge(data.btime, data.etime)) {
        return false;
    }
    data.areacode = module.areacode;
    data.link = module.link;
    module.params = data;
    $('#treegrid').treegrid('load', data);
    $.ajax({
        url: app.tp.ajax + '?tpUrl=' + 'Case/case_sat',
        type: 'POST',
        data: data,
        success: function(data) {
            module.data = data;
            app.treegrid('#treegrid', {
                url: null,
                idField: 'areaid',
                treeField: 'areaname',
                title: '统计信息',
                columns: column,
                data: module.data
            });
        }
    });
}
module.doColumn = function() {
        var cls = [];
        var colspan = 0;
        var children = [];
        $.each(column[0], function(i, m) {
            children = [];
            if (m.colspan) {
                for (var ii = colspan; ii < colspan + m.colspan; ii++) {
                    children.push({ 'field': column[1][ii]['field'] });
                }
                cls.push({ 'field': m.field, 'children': children })
                colspan += m.colspan;
            }
        });
        return cls;
    }
    // 选项
module.checking = function(checked) {
    console.log(checked);
    var count = [null, 9, 3, null];
    var cl = module.doColumn();
    var cls = $.extend(true, {}, cl);
    $.each(cls, function(i, m) {
        if (count[i]) {
            $.each(m.children, function(ii, mm) {
                if (checked.indexOf(mm.field) != -1) {
                    count[i]--;
                }
            });
        }

        // 合计项
        if (count[i] == 1) {
            count[i] = 0;
        }
    });
    console.log(count);

    function fn(ckd) {
        return checked.indexOf(ckd) > -1 ? true : false;
    }
    var columns = [
        [
            { field: 'areaname', title: '所属部门', rowspan: 2, align: 'center' },
            { field: 'empnum', title: '警员总数', rowspan: 2, width: 80, align: 'center' },
            { field: 'recorder', title: '执法记录仪数', rowspan: 2, width: 80, align: 'center' },
            { field: 'upload', title: '民警上传情况', colspan: 3, align: 'center', hidden: fn('upload') },
            { field: 'warning', title: '警情数', colspan: count[1], align: 'center', hidden: fn('warning') },
            { field: 'case', title: '案件数', colspan: count[2], align: 'center', hidden: fn('case') },
            { field: 'collect', title: '采集站情况', colspan: 3, align: 'center', hidden: fn('collect') }
        ],
        [
            { field: 'uploadnum', title: '上传警员数', width: 80, align: 'center', hidden: fn('upload') },
            { field: 'unuploadnum', title: '未上传民警数', width: 80, align: 'center', hidden: fn('upload') },
            { field: 'uploadper', title: '警员上传率', width: 80, align: 'center', hidden: fn('upload') },
            { field: 'common', title: '一般警情', width: 80, align: 'center', hidden: fn('common') },
            { field: 'major', title: '重大警情', width: 80, align: 'center', hidden: fn('major') },
            { field: 'spot', title: '当场盘问检查', align: 'center', hidden: fn('spot') },
            { field: 'force', title: '行政强制执行', width: 80, align: 'center', hidden: fn('force') },
            { field: 'impede', title: '阻碍民警执法妨碍公务', width: 80, align: 'center', hidden: fn('impede') },
            { field: 'otherdata', title: '其他数据', width: 80, align: 'center', hidden: fn('otherdata') },
            { field: 'unmark', title: '未编辑数据', width: 80, align: 'center', hidden: fn('unmark') },
            { field: 'disuse', title: '无效数据', width: 80, align: 'center', hidden: fn('disuse') },
            { field: 'num', title: '合计', width: 80, align: 'center', hidden: fn('warning') },
            { field: 'administration', title: '行政案件', width: 80, align: 'center', hidden: fn('administration') },
            { field: 'criminal', title: '刑侦案件', width: 80, align: 'center', hidden: fn('criminal') },
            { field: 'case_num', title: '合计', width: 80, align: 'center', hidden: fn('case') },
            { field: 'wsbase_num', title: '采集站数', width: 80, align: 'center', hidden: fn('collect') },
            { field: 'wsbase_online', title: '连接数', width: 80, align: 'center', hidden: fn('collect') },
            { field: 'wsbase_per', title: '连接率', width: 80, align: 'center', hidden: fn('collect') }
        ]
    ];

    $('#treegrid').treegrid({
        url: null,
        idField: 'areaid',
        treeField: 'areaname',
        columns: columns,
        data: module.data,
        onLoadSuccess: function() {
            var dc = $(this).data('datagrid').dc;
            console.log(dc);
        }
    });
}


$(function() {
    //初始化时间
    var time = new Date();
    $('#etime').datetimebox({ value: new Time(time, 0).init() });
    $('#btime').datetimebox({ value: new Time(time, 7).init() });
    //树的初始化
    tree.loadData();
    //树的额外参数
    $(tree.dom).tree({
        onClick: module.clickTree
    });
    $('#mu_ser').html(module.areaname);
    // app.treegrid('#treegrid', {
    //     url: 'Case/case_sat',
    //     queryParams: {
    //         areacode: module.areacode,
    //         link: module.link,
    //         rand: Math.random()
    //     },
    //     idField: 'areaid',
    //     treeField: 'areaname',
    //     title: '统计信息',
    //     columns: column
    // });
    $.ajax({
        url: app.tp.ajax + '?tpUrl=' + 'Case/case_sat',
        type: 'POST',
        data: {
            areacode: module.areacode,
            link: module.link,
            rand: Math.random()
        },
        // beforeLoad: '',
        success: function(data) {
            module.data = data;
            app.treegrid('#treegrid', {
                url: null,
                idField: 'areaid',
                treeField: 'areaname',
                title: '统计信息',
                columns: column,
                data: module.data
            });
        }
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

    // CheckBox的勾选
    $('#common').add('#major').add('#spot').add('#force').add('#impede')
        .add('#otherdata').add('#unmark').add('#disuse')
        .add('#administration').add('#criminal').bind('click', function() {
            module.unchecked = [];
            var inputs = $(this).parents('.count').find('input');
            var status = $(this).prop("checked");
            var colspan = $(this).parents('.count').find('input:checked').length;
            if (status) {
                $(this).parents('.count').find('input').first().prop('checked', status);
            } else {
                if (colspan == 1) {
                    $(this).parents('.count').find('input').first().prop('checked', status);
                }
            }
            $('input:checkbox').not('input:checked').each(function(i, m) {
                module.unchecked.push($(this).val());
            });
            module.checking(module.unchecked);
            // 解决input会消失的bug
            $('input:checkbox').each(function(i, m) {
                $(m).css('display', 'inline-block');
            });
        });

    $('#upload').add('#collect').bind('click', function() {
        module.unchecked = [];
        $('input:checkbox').not('input:checked').each(function(i, m) {
            module.unchecked.push($(this).val());
        });
        module.checking(module.unchecked);
    });

    $('#warning').add('#case').bind('click', function() {
        module.unchecked = [];
        var inputs = $(this).parents('.count').find('input');
        var status = $(this).prop("checked");
        $.each(inputs, function(i, m) {
            $(m).prop('checked', status);
        });

        $('input:checkbox').not('input:checked').each(function(i, m) {
            module.unchecked.push($(this).val());
        });
        module.checking(module.unchecked);
    });
});