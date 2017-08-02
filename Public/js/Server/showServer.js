var module = {};
module.broadcast = function() {
    app.datagrid('#listServer', {
        url: 'Server/server_list',
        columns: [
            [
                { field: 'server_ip', title: '服务器IP', width: 200, align: 'center' },
                { field: 'areaname', title: '所属部门', width: 200, align: 'center' },
                { field: 'phone', title: '联系电话', width: 200, align: 'center' },
                {
                    field: 'status_name',
                    title: '状态',
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
            status: 0
        },
        onLoadSuccess: function(r) {
            if (r.total == 0) {
                $('#listServer').parent('.datagrid-view').children('.datagrid-view2').css('left', 0).find('div.datagrid-body').html('暂无服务器数据').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '14px' });
            }
        }
    });

}
$(function() {
    module.broadcast();

});