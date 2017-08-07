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
            iconCls: icon,
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
        url: app.url('Apply/index_show'),
        dataType: 'json',
        success: function(data) {
            if (data.request > 0) {
                $.messager.show({
                    title: '申请提示',
                    msg: '你有新的申请单已经<span style="color:red;">被审批</span>,可在 <span style="color:red;">调阅管理</span> 中查看',
                    timeout: 10000,
                    showType: 'slide'
                });
            }
            if (data.allow > 0) {
                $.messager.show({
                    title: '审批提示',
                    msg: '有新的申请单需要<span style="color:red;">审批</span>,可在 <span style="color:red;">调阅管理</span> 中查看',
                    timeout: 10000,
                    showType: 'slide'
                });
            }
        }
    })
}

function showMsgDialog() {
    $('#msgDialog').dialog({
        title: '消息',
        width: 500,
        height: 400,
        shadow: false
    }).dialog('open');
    $('#msgTabs').tabs({
        fit: true,
        width: '100%',
        height: '100%',
        border: false
    });

}
$(function() {
    showMsgDialog();
    $('#showMsgDialog').click(function() {
        showMsgDialog();
    });
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
    $('#msgTabs').tabs('add', {
        title: '公告',
        content: createFrame(app.url('Announce/showAnnounce'), 'dialog')
    }).tabs('add', {
        title: '服务器'
    }).tabs('add', {
        title: '工作站'
    }).tabs('add', {
        title: '未编辑'
    });
    $('#msgTabs').tabs({
        onSelect: function(title, index) {
            $(this).tabs('update', {
                tab: $('#msgTabs').tabs('getSelected'),
                options: {
                    content: createFrame(tabs[title], 'dialog')
                }
            });
        }
    });
    /*var date = new Date();
    var year = date.getFullYear();
    $("#year").html(year);*/


});