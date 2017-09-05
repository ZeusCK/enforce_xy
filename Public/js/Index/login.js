function login() {

    var username = $.trim($("#username").val());
    var password = $.trim($("#password").val());
    if (username == '') {
        $('.info').text('用户名不能为空!');
        return false;
    }
    if (password == '') {
        $('.info').text('密码不能为空!');
        return false;
    }
    $('.info').text('正在验证登陆...');
    // $('form').submit();
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
                $('.info').text('验证成功，正在跳转...');
                window.location.replace(app.url('Index/index'));
                // window.location.href = app.url('Index/index');
            } else {
                $('.info').text(data.message);
            }
        },
        error: function() {
            $('.info').html('抱歉网络发生错误,无法登录！');
        }
    });
}
$(function() {
    $('#loginButton').click(function() {
        login();
    });
    $('#resetButton').click(function() {
        $('#loginBox').form('clear');
        $('.info').html('');
    });
    $('#username').focus();
    $(document).keydown(function(event) { keyDownSearch(event) });
    $('#username').next('span').find('input').focus();
    window.open(app.url('Index/home'),'执法视音频平台','height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
    function keyDownSearch(event) {
        // 兼容FF和IE和Opera
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) {
            login();
        }
    }
});