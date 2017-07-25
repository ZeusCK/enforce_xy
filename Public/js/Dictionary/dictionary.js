var module = {};
module.addBar = function(target){
    $(target).dialog('open');
}
$(function(){
    app.datagrid('#typeDatagrid',{
        url:app.url('Dictionary/type_list'),
        columns:[[
            {field:'id',title: '', checkbox: true },
            {field:'name',title: '字典名称', width: 100, align: 'center'},
            {field:'type',title: '字典标识', width: 100, align: 'center'}
        ]]
    });
    app.datagrid('#dataDatagrid',{
        url:app.url('Dictionary/data_list'),
        columns:[[
            {field:'id',title: '', checkbox: true },
            {field:'value',title: '字典名目', width: 100, align: 'center'},
            {field:'item',title: '字典值', width: 100, align: 'center'},
            {field:'order',title: '排序', width: 100, align: 'center'}
        ]]
    });
});