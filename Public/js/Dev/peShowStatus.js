var module = {};
module.areacode = app.tp.areacode;
module.areaname = app.tp.areaname;
var tree = new Tree('#tree');
module.search = function() {
    app.extra('search', {
        form: '#toolForm',
        datagrid: '#datagrid',
        showDatagrid:false,
        parsedata:function(data){
            data.areacode = module.areacode;
        }
    });
}
module.clickTree = function(node) {
    module.areacode = node.areacode;
    module.areaname = node.text;
    module.search();
}
$(function() {
    tree.loadData();
    app.datagrid('#datagrid',{
        url:'Dev/pe_base_list',
        showDatagrid:false,
        otherView:function(data){
            var obj = {};
            obj.total=Math.min(data.total);
            var str='';
            if(obj.total > 0){
                for(var i=0;i<obj.total;i++){
                    data.rows[i].statusCN=data.rows[i].status==0?'停用':data.rows[i].status== 1 ? '维修':'活跃';
                    str += '<span class="d2" style="margin:auto 0;">' +
                        '<span class="p">执法产品序号：'+data.rows[i].cpxh+'</span><br>' +
                        '<span class="d3">' +
                            '<span class="d41"><img src="'+app.public+'image/status_'+data.rows[i].status+'.png"/><span>'+data.rows[i].statusCN+'</span></span>'+
                            '<span class="d42">' +
                                '<span>姓名：'+data.rows[i].jyxm+'</span><br>' +
                                '<span>警号：'+data.rows[i].jybh+'</span><br>' +
                                '<span>使用频次：'+data.rows[i].times+'/7</span>' +
                            '</span>'+
                        '</span>'+
                    '</span>';
                }
                str = '<div style="text-align:center;width:100%;height:100%">'+str+'</div>';
                return str;
            }else{
                return '<div style="text-align:center;width:100%;height:100%"><span class="no-photo" style="text-align:center;">'+module.areaname+'及其子部门没有执法记录仪</span></div>';
            }
        }
    });
    $(tree.dom).tree({
        onClick: module.clickTree
    });
});
