var data;
var bfwz;
var ccwz;
var wjbh;
function init_file(params){
    $.each(data.rows,function(ii,mm){
        if(mm.wjbh==$(params).attr('tiggle')){
            file_type=mm.wjlx;
            bfwz=mm.bfwz;
            ccwz=mm.ccwz;
            wjbh=mm.wjbh;
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
var file_type = '';
$(function(){   
    $("#mediaBox").height($(window).height()-282); 
    //初始化视屏
    // init_file(app.tp.wjlx,app.tp.bfwz);
    //现在文件
    $('#download').click(function(){
        $.ajax({
          url:app.url('Media/video_action'),
          data:{
            action:1,
            wjbh:wjbh
          }
        });
        var httpUrls = bfwz.split('/');
        console.log(httpUrls)
        var down_url = httpUrls[0]+'/'+httpUrls[1]+'/'+httpUrls[2];
        if(file_type == 1 || file_type == 2 || file_type == 3){
            window.open(down_url+'/pe_file/down.php'+'?filePath='+bfwz);
        }
        if(file_type == 0 || file_type == ''){
            $.messager.alert('未知文件无法下载');
        }
    });
    $('#vedio_list').height($(window).height()-82);
    // $('#mediaBox').width($(window).width()-310);
    // $('#case_info').width($(window).width()-310);
    $('.right').width($(window).width()-310);
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
    var r=window.location.href;
    r = r.substring(r.indexOf("=")+1,r.length);
    $.ajax({
        url: app.url('Case/play_case_info'),
        data:{uniqid:r} ,
        type: 'GET',
        success:function(result){
            data=result;
            var str='';
            $.each(result.rows,function(ii,mm){
                var type;
                switch(mm.wjlx){
                    case '0':
                        type='未知文件';
                        break;
                    case '1':
                        type="视频文件";
                        break;
                    case '2':
                        type="音频文件";
                        break;
                    case '3':
                        type="图片文件";
                        break;
                }
                str+='<p tiggle="'+mm.wjbh+'" onclick="init_file(this)">'+type+mm.wjbh+'</p>';
                
            });
            $('.list_content').html(str);
            $('#infoForm').form('load',result.info);
        }
    });
    $(window).resize(function(){
        $("#mediaBox").height($(window).height()-282); 
        $('#vedio_list').height($(window).height()-80);
        $('#mediaBox').width($(window).width()-310);
        $('#case_info').width($(window).width()-310);
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
    });

    //打印
    $('#print').click(function(){
        $('.right').printArea();
        $.ajax({
          url:app.url('Media/video_action'),
          data:{
            action:3,
            wjbh:wjbh
          }
        });
    });
});


