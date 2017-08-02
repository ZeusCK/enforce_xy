var module = {};
module.broadcast = function() {
    app.datagrid('#listWorker', {
        url: 'WorkStation/ws_base_list',
        columns: [
            [
                { field: 'areaname', title: '所属部门', align: 'center' },
                { field: 'gzz_ip', title: '工作站IP', align: 'center' },
                { field: 'fzr', title: '负责人', width: 200, align: 'center' },
                { field: 'dh', title: '负责人电话', width: 200, align: 'center' },
                {
                    field: 'zxztname',
                    title: '在线状态',
                    width: 100,
                    align: 'center',
                    formatter: function(v, d, i) {
                        if (v == '离线') {
                            return '<span style="color:#a00">离线</span>';
                        } else {
                            return '<span style="color:#0a0">在线</span>';
                        }
                    }
                }

            ]
        ],
        queryParams: {
            zxzt: 0,
            areaid: 52
        },
        onLoadSuccess: function(r) {
            if (r.total == 0) {
                $('#listWorker').parent('.datagrid-view').children('.datagrid-view2').css('left', 0).find('div.datagrid-body').html('暂无工作站数据').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '14px' });
            }
        }


    });
}
$(function() {
    module.broadcast();
});