var module = {};
module.broadcast = function() {
    app.datagrid('#listAnnounce', {
        url: 'Announce/announce_broadcast',
        fit: true,
        columns: [
            [
                { field: 'title', title: '公告标题', width: 200, align: 'center' },
                { field: 'content', title: '公告内容', width: 400, align: 'center' },
            ]
        ],
        onLoadSuccess: function(r) {
            if (r.total == 0) {
                $('#listAnnounce').parent('.datagrid-view').children('.datagrid-view2').find('div.datagrid-body').html('暂无公告').css({ 'color': '#F00', 'text-align': 'center', 'font-size': '14px' });
            } else {
                var rows = $('#listAnnounce').datagrid('getRows');
                $('#title').html(rows[0].title);
                $('#content').html(rows[0].content);
            }
        },
        onSelect: function(index, data) {
            $('#title').html(data.title);
            $('#content').html(data.content);
        }
    });
}
$(function() {
    module.broadcast();
});