function Tree(dom){
    this.dom = dom || '';
    this.data = null;
}
//加载管理的部门 noS使用缓存  true不使用 false使用
Tree.prototype.loadData = function (noS){
    this.init();
    var self = this;
    var dom = this.dom;
    var load = noS ? noS : false;
    var params = {'new':load};
    params.tpUrl = 'Area/data_tree_list';
    $.ajax({
        url:app.tp.ajax,
        type:'post',
        dataType:'json',
        data:params,
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
Tree.prototype.load_no_read_area = function (){
    this.init();
    var self = this;
    var dom = this.dom;
    var params = {};
    params.tpUrl = 'Area/load_no_read_area';
    $.ajax({
        url:app.tp.ajax,
        type:'post',
        dataType:'json',
        data:params,
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
Tree.prototype.load_all_tree = function(){
    this.init();
    var dom = this.dom;
    var self = this;
    $.ajax({
        url:app.tp.ajax+'?rand='+Math.random()+'&tpUrl=Area/show_all_area',
        type:'get',
        dataType:'json',
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
Tree.prototype.load_dept_role = function(dept_role_id){
    var dom = this.dom;
    var self = this;
    $.ajax({
        url:app.tp.ajax+'?rand='+Math.random()+'&tpUrl=DeptRole/roleDept&dept_role_id='+dept_role_id,
        type:'get',
        dataType:'json',
        success:function(data){
            self.data = data;
            $(dom).tree({
                checkbox:true,
                cascadeCheck:true,
                data:data
            });
        }
    });
}
//加载带有警员的树
Tree.prototype.load_emp_tree = function(){
    this.init();
    var dom = this.dom;
    var self = this;
    $.ajax({
        url:app.tp.ajax+'?rand='+Math.random()+'&tpUrl=Employee/show_employee',
        type:'get',
        dataType:'json',
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
//加载目标警员能管理的树 empid  目标警员
Tree.prototype.show_emp_manger_area = function(empid){
    this.init();
    var dom = this.dom;
    var self = this;
    $.ajax({
        url:app.tp.ajax+'?rand='+Math.random()+'&tpUrl=Employee/show_emp_manger_area',
        type:'get',
        dataType:'json',
        data:{
            empid:empid
        },
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
//加载调阅管理显示的树
Tree.prototype.show_apply_tree = function(){
    this.init();
    var dom = this.dom;
    var self = this;
    $.ajax({
        url:app.tp.ajax+'?rand='+Math.random()+'&tpUrl=Employee/show_apply_tree',
        type:'get',
        dataType:'json',
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
//加载能管理的交警部门树
Tree.prototype.show_tp_tree = function(){
    this.init();
    var dom = this.dom;
    var self = this;
    $.ajax({
        url:app.tp.ajax+'?rand='+Math.random()+'&tpUrl=Employee/show_tp_tree',
        type:'get',
        dataType:'json',
        success:function(data){
            self.data = data;
            $(dom).tree('loadData',data);
        }
    });
}
//ztree数据
Tree.prototype.zTree_area = function(target, params) {
    var options = $.extend({},Tree.prototype.zTree_area.defaluts,params);
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: function(e,j,n,f){
                options.onClick(n);
            }
        }
    }
    $.ajax({
        url: app.tp.ajax + '?rand=' + Math.random() + '&tpUrl='+options.url,
        type: 'get',
        dataType: 'json',
        success: function(data) {
            $.fn.zTree.init($(target), setting, data);
        }
    });
}
Tree.prototype.zTree_area.defaluts = {
    url:'',
    onClick:function(n){}
}
Tree.prototype.init = function(){
    $(this.dom).tree({
        animate:true,
        lines:true,
        cascadeCheck:false
    });
}
/**
 * 搜索树
 * @param  string info 搜索内容
 * @param  int type 搜索类型 1为部门 2为警员
 * @return json
 */
Tree.prototype.search_data = function(data,info,type){
    var searchData = [];
    for (var i = 0; i < data.length; i++) {
        //判断有没有子集
        if(typeof data[i].children == 'undefined'){
            if(type == 2){
                //判断有没有警号
                if(typeof data[i].code != 'undefined'){
                    //搜索警号,姓名
                    if(data[i].code.indexOf(info) > -1 || data[i].name.indexOf(info) > -1){
                        searchData.push(data[i]);
                    }
                }
            }
            if(type == 1){
                if(data[i].code) continue;      //如果有警号直接跳过
                //搜索部门
                if(data[i].text.indexOf(info) > -1){
                    searchData.push(data[i]);
                }
            }
        }else{
            //判断子集
            var children = this.search_data(data[i].children,info,type);
            //如果子集有满足条件的那么直接叠加
            if(children.length > 0){
                var text = {};
                text.children = children;
                for(var field in data[i]){
                    if(field != 'children'){
                        text[field] = data[i][field];
                    }
                }
                searchData.push(text);
            }else{
                //否则判断自身是否满足条件
                if(type == 1){      //如果是部门
                    if(data[i].text.indexOf(info) > -1){
                        var text = {};
                        for(var field in data[i]){
                            if(field != 'children'){
                                text[field] = data[i][field];
                            }
                        }
                        searchData.push(text);
                    }
                }
                //如果是警员 理论上是不会出现的这种情况  但是为了程序的健壮性还是加上比较好
                if(type == 2){
                    if(typeof data[i].code != 'undefined'){
                        if(data[i].code.indexOf(info) > -1 || data[i].name.indexOf(info) > -1){
                            var text = {};
                            for(var field in data[i]){
                                if(field != 'children'){
                                    text[field] = data[i][field];
                                }
                            }
                            searchData.push(text);
                        }
                    }
                }
            }
        }
    }
    return searchData;
}
Tree.prototype.search_tree = function(info,type){
    if($.trim(info) == ''){
        var data = this.data;
        $(this.dom).tree('loadData',data);
        /*$(this.dom).tree({
            multiple:false,
            checkbox:false,
            onlyLeafCheck:false
        });*/
        $('#info').remove();
        // $(this.dom).tree('collapseAll');
        return false;
    }else{
        var data = this.search_data(this.data,info,type);
        if(type == 2){
            //要想实现在子节点添加复选框 下面的条件是必须的一个都不能少
            $(this.dom).tree({
                multiple:true,
                checkbox:true,
                onlyLeafCheck:true
            });
        }
        if(type == 1){
            /*$(this.dom).tree({
                multiple:false,
                checkbox:false,
                onlyLeafCheck:false
            });*/
        }
    }
    $('#info').remove();
    if(data.length < 1 ){
        var temp = type == 1 ? '部门' : '警员';
        var html = '<p style="color:red;text-align: center;" id="info">经搜索未发现符合条件的'+temp+'</p>';
        $(this.dom).before(html);
        $(this.dom).tree('loadData',data);
    }else{
        $(this.dom).tree('loadData',data);
    }
    //展开所有节点
    //$(this.dom).tree('uncheck');
    // $(this.dom).tree('expandAll');
}