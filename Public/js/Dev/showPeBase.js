var module = {};
module.broadcast = function() {
    app.datagrid('#datagrid', {
        url: 'Dev/pe_base_list',
        columns: [
            [
                { field: 'areaname', title: '所属部门', width: 200, align: 'center' },
                 { field: 'jyxm', title: '警员姓名', width: 200, align: 'center' },
                { field: 'jybh', title: '警员编号', width: 200, align: 'center' },
                { field: 'cpxh', title: '产品型号', width: 200, align: 'center' },
                {
                    field: 'status',
                    title: '状态',
                    width: 100,
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (v == 0) {
                            return '<span style="color:#a00">停用</span>';
                        } else if(v == 1){
                            return '<span style="color:orange">低频</span>';
                        } else if(v == 2){
                            return '<span style="color:#0a0">在用</span>';
                        }
                    }
                }
            ]
        ],
        queryParams: {
            status: 0
        },
        onLoadSuccess: function(r) {
            if (r.total == 0) {
                $(this).parent('.datagrid-view').children('.datagrid-view2').css('left', 0).find('div.datagrid-body').html('暂无执法仪数据').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '14px' });
            }
        }
    });

}
$(function() {
    module.broadcast();
});