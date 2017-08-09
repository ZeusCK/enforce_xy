function login() {

    var username = $.trim($("#username").val());
    var password = $.trim($("#password").val());
    if (username == '') {
        $('#info').html('用户名不能为空!');
        return false;
    }
    if (password == '') {
        $('#info').html('密码不能为空!');
        return false;
    }
    $('#info').html('正在验证登陆...');
    $.ajax({
        url: app.url('Index/check_login'),
        type: 'post',
        dataType: 'json',
        data: {
            username: username,
            password: password
        },
        success: function(data) {
            if (data.status) {
                $('#info').html('验证成功，正在跳转...');
                window.location.href = app.url('Index/index');
            } else {
                $('#info').html(data.message);
            }
        },
        error: function() {
            $('#info').html('抱歉网络发生错误,无法登录！');
        }
    });
}
$(function() {
    $('#loginButton').click(function() {
        login();
    });
    $('#resetButton').click(function() {
        $('#loginBox').form('clear');
        $('#info').html('');
    });
    $('#username').focus();
    $('#info').html(info);
    $(document).keydown(function(event) { keyDownSearch(event) });
    $('#username').next('span').find('input').focus();

    function keyDownSearch(event) {
        // 兼容FF和IE和Opera
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) {
            login();
        }
    }
});