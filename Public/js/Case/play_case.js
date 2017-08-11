var bfwz;
var ccwz;
var wjbh;
function init_file(params){
    $('.list_content>p').css('background','#ededed').css('color','#000');
    $(params).css('background','#fff').css('color','#0064b7');

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
        var string = '<div class="vlc" style="width:60%;height:100%;margin-left:20%;"><embed pluginspage="http://www.videolan.org" type="application/x-vlc-plugin"  width="100%" height="100%" mrl="'+bfwz+'" text="Waiting for video"/></div>';
    }
    $('#mediaBox').html(string);
}  
var file_type = '';
$(function(){   
    $("#mediaBox").height($(window).height()-282); 
    //初始化视屏
    // init_file(app.tp.wjlx,app.tp.bfwz);
    //现在文件
    $('#download').click(function(){
        var params = {action:1,wjbh:wjbh};
        params.tpUrl = 'Media/video_action';
        $.ajax({
            url:app.tp.ajax,
            type:'post',
            dataType:'json',
            data:params,
            success:function(data){
                
            }
        });
        var httpUrls = bfwz.split('/');
        var down_url = httpUrls[0]+'/'+httpUrls[1]+'/'+httpUrls[2];
        if(file_type == 1 || file_type == 2 || file_type == 3){
            window.open(down_url+'/pe_file/down.php'+'?filePath='+bfwz);
        }
        if(file_type == 0 || file_type == ''){
            $.messager.alert('未知文件无法下载');
        }
    });
    $('#vedio_list').height($(window).height()-82);
    $('.right').width($(window).width()-310);
    var w = $('#mediaBox').width();
    var h = $('#mediaBox').height();
    $('#mediaBox').html('<img src="'+ app.public +'image/video_error.jpg" alt="" style="height:100%;">');
    $(window).resize(function(){
        $("#mediaBox").height($(window).height()-282); 
        $('#vedio_list').height($(window).height()-80);
        $('.right').width($(window).width()-310);
        // console.log(($(window).width()-310)*0.2)
        // $('input').width(($(window).width()-310)*0.2);
    });

    //打印
    $('#print').click(function(){
        $('.right').printArea();
        var params = {action:3,wjbh:wjbh};
        params.tpUrl = 'Media/video_action';
        $.ajax({
            url:app.tp.ajax,
            type:'post',
            dataType:'json',
            data:params,
            success:function(data){
                
            }
        });
    });

});
