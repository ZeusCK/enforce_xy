function init_file(file_type,bfwz){
    $.ajax({
      url:app.url('Media/video_action'),
      data:{
        action:2,
        wjbh:app.tp.wjbh
      }
    });
    var w = $('#mediaBox').width();
    var h = $('#mediaBox').height();
    if(file_type == '' || file_type == 0){
        var string = '<img src="'+ app.public +'image/video_error.jpg" alt="" style="height:'+h+'px;">';
    }
    if(file_type == 2){
        var string = '<img src="'+ app.public +'image/video_error.jpg" style="height:'+ (h-55)+'px;">';
        string += '<div><audio src="'+ bfwz +'" autoplay controls="controls" style="height:50px;"></div>';
    }
    if(file_type == 3){
        var string = '<img src="'+ bfwz +'" alt="" style="height:'+h+'px;">';
    }
    if(file_type == 1){
        var string = '<video id="play_video" src="'+ bfwz +'" autoplay controls="controls" style="height:'+h+'px;">';
    }
    $('#mediaBox').html(string);
    //播放视频
    /*var myPlayer = videojs('play_video');
    videojs("play_video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });*/
}
function updateInfo(params) {
    params.wjbh = app.tp.wjbh;
    $.ajax({
        dataType:'json',
        type:'POST',
        url:app.url('Media/media_update'),
        data: params,
        success:function(data){
            $.messager.show({
                title:'操作提示',
                msg:data.message,
                timeout:2000,
                showType:'slide'
            });
        }
    });

}
var file_type = app.tp.wjlx;
var file = app.tp.bfwz;
$(function(){
    $("#wjlx,#bzlx,#video_type").combobox({
        onChange: function (n,o) {
            if(app.tp.wibh == ''){
                return false;
            }
            var params = {};
            params.wjbh = app.tp.wibh;
            var type = $(this).attr('id');
            params[type] = n;
            updateInfo(params);
        }
    });
    $('#mark').blur(function(){
        var info = $.trim($('#mark').val());
        if(info != '' || info != app.tp.mark){
            var params = {};
            params.mark = info;
            updateInfo(params);
        }
    });
    var hi = $(window).height()-$(".boxbottom").height()-$("#logo_video").height()-$("#footer").height();
    $("#mediaBox").height(hi-24);
    //初始化视屏
    init_file(app.tp.wjlx,app.tp.bfwz);
    //现在文件
    $('#download').click(function(){
        $.ajax({
          url:app.url('Media/video_action'),
          data:{
            action:1,
            wjbh:app.tp.wjbh
          }
        });
        var httpUrls = file.split('/');
        var down_url = httpUrls[0]+'/'+httpUrls[1]+'/'+httpUrls[2];
        if(file_type == 1 || file_type == 2 || file_type == 3){
            window.open(down_url+'/pe_file/down.php'+'?filePath='+file);
        }
        if(file_type == 0 || file_type == ''){
            $.messager.alert('未知文件无法下载');
        }
    });
});


