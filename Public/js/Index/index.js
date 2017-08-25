function createFrame(url, dialog) {
    if (dialog) {
        return '<div style="width:100%;height:100%;overflow:hidden;"><iframe src="' + url + '" width="100%" height="100%" frameborder="0" scrolling="yes"></iframe></div>';
    } else {
        return '<iframe scrolling="auto" frameborder="0"  style="width:100%;height:100%;" src="' + url + '" ></iframe>';
    }
}

function showTab(url, title, icon) {
    if ($('#tabs').tabs('exists', title)) {
        $('#tabs').tabs('select', title);
    } else {
        var tabNum = $('#tabs').tabs('tabs').length;
        //console.log($('#SystemTabs').tabs('tabs'));
        if (tabNum > 9) {
            $.messager.alert('信息提示', '目前的打开窗口太多了！关闭一些在打开吧。', 'info');
            return false;
        }
        $('#tabs').tabs('add', {
            title: title,
            content: createFrame(url),
            closable: true,
            border: false,
            // iconCls: icon,
            onLoadError: function(data) {
                var info = eval('(' + data.responseText + ')');
                $.messager.confirm('错误提示', info.message, function(r) {
                    $('#tabs').tabs('close', title);
                });
                return false;
            }
        });
    }
}

function closeTab() {
    var alltabs = $('#tabs').tabs('tabs');
    var allTitle = new Array();
    $.each(alltabs, function(n, m) {
        allTitle.push($(m).panel('options').title);
    });
    $.each(allTitle, function(i, j) {
        if (j != '首页') {
            $('#tabs').tabs('close', j);
            return true;
        }
    });
}

function menuHandler(item) {
    var url = $(item).attr('data-url');
    var text = $(item).html();
    var icon = $(item).attr('iconCls');
    if (url != '') {
        showTab(url, text, icon);
    }
}

function change_password() {
    var newpassword = $('#newpassword').textbox('getValue');
    var surepassword = $('#surepassword').textbox('getValue');
    if ((newpassword == '') || (surepassword == '') || (newpassword != surepassword)) {
        $.messager.alert('信息提示', '密码不能为空或两次输入的密码不一致', 'error');
        return false;
    }
    $.ajax({
        url: app.url('Index/change_password'),
        dataType: 'json',
        data: {
            newpassword: newpassword
        },
        success: function(data) {
            if (data.status) {
                $.messager.alert('结果提示', '修改密码成功，下次登陆时生效', 'info');
            } else {
                $.messager.alert('结果提示', data.message, 'info');
            }
            $('#dialog').dialog('close');
        }
    });
}
function show_apply() {
    $.ajax({
        url: app.tp.ajax+'?tpUrl=Case/case_list',
        dataType: 'json',
        data:{
            hand_status:1,
            type:1,
            show_messager:true
        },
        success: function(data) {
            if (data.total > 0) {
                $.messager.show({
                    title: '审批提示',
                    msg: '有新的申请单需要<span style="color:red;">审批</span>,可在 <span style="color:red;">警情移交/申请审核</span> 中查看',
                    timeout: 10000,
                    showType: 'slide',
                    style:{
                        top:document.body.scrollTop+document.documentElement.scrollTop,
                    }
                });
            }
        }
    });
}
function menuInit(data){
    // console.log(data);
    $.each(data,function(i,item){
        // 添加自定义图标
        if(!item.children) {
            //console.log(item) 
            return;
        }
        $.each(item.children, function(i,icon){
            if (icon.children) {
                $.each(icon.children,function(i,m){
                    m.iconCls = 'icon-my-shu';
                    m.state = 'open';
                })
            }else{
                icon.iconCls = 'icon-hidden';
            }  
        })
        
        $.each(item.children, function(i,m){
            m.state = 'open';
        })
        /*iconCls='"+item.iconCls+"'*/
        $('#menuTree').append("<div title='"+item.text+"'  style=\"padding:10px 0;\"> <ul id=nt" + i + ">"+item.text+"</ul></div>");
        $('#nt'+i).tree({
            lines: false,
            animate: true,
            data:item.children,
            onClick:function(node){
                $(node.target).children().each(function(i,m){
                    if ($(m).hasClass('tree-hit')) {
                        $(m).click();
                    };
                })
                if(typeof(node.attributes)!='undefined'){
                    showTab(node.attributes.url,node.text,node.iconCls);
                }
            }
        }); 
    });
    $('#menuTree').accordion({
        border: false,
        // fit:true,
        animate:true
    });
}
function update_online(){
    $.ajax({
        url:app.tp.ajax+'?tpUrl=Index/update_emp_time',
        success:function(data){
            $('#online').text(data.online+'/'+data.total);
        }
    });
}
//公告显示
function show_announce(){
    $.ajax({
        url:app.tp.ajax+'?tpUrl=Announce/announce_broadcast',
        success:function(data){
            if(data.total > 0){
                var str = '';
                $.each(data.rows,function(n,m){
                    var anStr = '<div class="announce">';
                    anStr += '<p class="title">'+m.title+'</p>';
                    anStr += '<p class="content">' +m.content + '</p>';
                    anStr += '<p class="date">' + m.create_time.split(' ')[0] + '</p>';
                    anStr += '<p class="areaname">' + m.areaname + '</p>';
                    anStr += '</div>';
                    str += anStr;
                });
                $('#win').html(str);
                $('#win').window('open');
            } 
        }
    });
}
$(function() {
    update_online();
    setInterval(function(){
        update_online();
    }, 1000*60^3);
    //公告显示
    show_announce();
    menuInit(app.tp.menuData);
    $('#tabs').tabs({
        tools: [{
                iconCls: 'icon-reload',
                handler: function() {
                    var tab = $('#tabs').tabs('getSelected');
                    var iframe = $(tab.panel('options').content);
                    var src = iframe.attr('src');
                    $('#tabs').tabs('update', {
                        tab: tab,
                        options: {
                            content: createFrame(src)
                        }
                    });
                    return false;
                }
            },
            {
                iconCls: 'icon-cancel',
                handler: function() {
                    $.messager.confirm('操作提示', '亲，确认要关闭所有窗口吗？', function(n) {
                        if (n) {
                            closeTab();
                        }
                    });
                }
            }
        ],
        onBeforeClose: function(title) {
            if (title == '首页') {
                $.messager.show({
                    title: '系统提示',
                    msg: '首页面不能关闭',
                    showType: 'slide',
                    timeout: '2000',
                    style: {
                        right: '',
                        top: document.body.scrollTop + document.documentElement.scrollTop,
                        bottom: ''
                    }
                });
                return false;
            }
        }
    });
    showTab(app.url('Index/home'), '首页', 'icon-house');
    $('#changePassword').click(function() {
        $('#dialog').dialog('open');
    });
    show_apply();

    var tabs = {
        '公告': app.url('Announce/showAnnounce'),
        '服务器': app.url('Server/showServer'),
        '工作站': app.url('WorkStation/showWork'),
        '未编辑': app.url('Announce/showAnnounce')
    }
    /*var date = new Date();
    var year = date.getFullYear();
    $("#year").html(year);*/
});