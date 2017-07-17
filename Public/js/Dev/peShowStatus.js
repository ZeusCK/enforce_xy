//左侧tree的加载
var tree=new Tree('#tree');
var areaid = app.tp.areaid;
var areaname = app.tp.areaname;
var obj = {pagesize:15,areaid:areaid};
var module = {};
module.params = {};
$(function(){
    tree.init();
    tree.loadData();
    $('#datagrid').datagrid({
        title:'执法仪状态',
        pageSize:15,
        pagination:true,
        pageNumber:1,
        pageList:[15,20,25,30],
        pagePosition:'bottom',
        toolbar:'#toolbar'
    });
    ajaxStatus({areaid:areaid,rows:obj.pagesize,page:1});
    $('#tree').tree({
        onSelect:function(node){
            areaid = node.id;
            areaname = node.text;
            var params = app.serializeJson('#toolForm');
            params.areaid = areaid;
            params.page = module.params.page;
            params.rows = module.params.rows;
            params.rand = Math.random();
            ajaxStatus(params);
        }
    });

    $('#datagrid').datagrid('getPager').pagination({
        onSelectPage:function(pageNumber,pageSize){
            module.params.page = pageNumber;
            module.params.rows = pageSize;
            var params = app.serializeJson('#toolForm');
            params.areaid = areaid;
            params.page = module.params.page;
            params.rows = module.params.rows;
            params.rand = Math.random();
            ajaxStatus(params);
        }
   });
    $(window).resize(function(){
        divMargin(obj.totla);
    });
    $('#lay').layout('panel','center').panel({
        onResize:function(){
            divMargin(obj.totla);
        }
    });
    //搜索按钮
    $('#searching').click(function(){
        params = app.serializeJson('#toolForm');
        var params = app.serializeJson('#toolForm');
        params.areaid = areaid;
        params.page = module.params.page;
        params.rows = module.params.rows;
        params.rand = Math.random();
        ajaxStatus(params);
    });
});

function ajaxStatus(params){
    /*params.status = true;*/
    $.ajax({
        url:app.url('Dev/pe_base_list'),
        type:'GET',
        data:params,
        success:function(data){
            obj.total=Math.min(data.total);
            var str='';
            if(obj.total > 0){
                for(var i=0;i<obj.total;i++){
                    data.rows[i].statusCN=data.rows[i].status==0?'停用':data.rows[i].status== 1 ? '维修':'活跃';
                    str+='<div class="d2">' +
                        '<div class="p">执法产品序号：'+data.rows[i].cpxh+'</div>' +
                        '<div class="d3">' +
                            '<div class="d41"><img src="'+app.public+'image/status_'+data.rows[i].status+'.png"/><span>'+data.rows[i].statusCN+'</span></div>'+
                            '<div class="d42">' +
                                '<div>姓名：'+data.rows[i].jyxm+'</div>' +
                                '<div>警号：'+data.rows[i].jybh+'</div>' +
                                '<div>使用频次：'+data.rows[i].times+'/7</div>' +
                            '</div>'+
                        '</div>'+
                    '</div>';
                }
                $('#d1').html(str);
                divMargin(obj.total);
            }else{
                str = '<div class="no-photo">'+areaname+'及其子部门没有执法记录仪</div>';
                $('#d1').html(str);
            }
            
        }
});
}
//设置div间距
function divMargin(n){
    $('#top').width($('#center').width());
    var divRec=$('#d1')[0].getBoundingClientRect();
    var w=divRec.width%160+160;//width:150 pading:5
    var c=Math.floor(divRec.width/160)-1;
    if(c<n){
        var d2border=parseInt(w/(2*c));
        var d1borderL=(divRec.width-(160+2*d2border)*c)/2;
        $('.d2').css('margin','10px '+d2border+'px');
        $('#d1').css({'margin-left':d1borderL+'px','margin-right':d1borderL+'px'});
    }else{
        $('.d2').css('margin','10px');
        $('#d1').css('margin-left','10px');
    }
}



