var caseInfo = app.tp.data;
var source = 2;
$(function() {
    //案件类型下拉框
    var caseTypeUrl = app.tp.ajax + "?tpUrl=Function/dic_val_item&type=case_type";
    $("#case_type").combobox({
        method: "GET",
        url: caseTypeUrl,
        valueField: "value",
        textField: "item"
    });

    //警情类型下拉框
    var alarmTypeUrl = app.tp.ajax + "?tpUrl=Function/dic_val_item&type=alarm_type";
    $("#alarm_type").combobox({
        method: "GET",
        url: alarmTypeUrl,
        valueField: "value",
        textField: "item"
    });
    $('#cjsj').datetimebox('setValue',caseInfo.info.start_time);
    var $list = $('#thelist'),
        $btn = $('#ctlBtn'),
        state = 'pending',
        uploader;
    /*setTimeout(function(){
        $('#caseInfo').form('load',caseInfo.info);
    }, 1000);*/
    uploader = WebUploader.create({

        // swf文件路径
        swf: app.public+'plugins/webuploader/Uploader.swf',

        // 文件接收服务端。
        server: app.url('Media/break_point_upload'),
        // 开起分片上传。
        chunked: true,
        chunkSize:2000000,
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#picker',
        threads:1,
        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false,
        formData:{
            case_key:caseInfo.info.case_key,
            start_time:caseInfo.info.start_time
        }
    });


    // 当有文件被添加进队列的时候
    uploader.on('fileQueued', function(file) {
        $list.append('<div id="' + file.id + '" class="item">' +
            '<h4 class="info">' + file.name + '</h4>' +
            '<p class="state">等待上传...</p>' +
            '</div>');
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on('uploadProgress', function(file, percentage) {
        var $li = $('#' + file.id),
            $percent = $li.find('.progress .progress-bar');
        // 避免重复创建
        if (!$percent.length) {
            $percent = $('<div class="progress progress-striped active" style="width: 100%;height:15px;border:1px solid #000;">' +
                '<div class="progress-bar" role="progressbar" style="width: 0%;height:15px;background:#ccc;"><span class="percent"></span>' +
                '</div>' +
                '</div>').appendTo($li).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');
        $percent.css('width', percentage * 100 + '%');
        var percent = Math.round(percentage * 100) == 100 ? 99 : Math.round(percentage * 100);
        $('.percent').html(percent + '%');
    });

    uploader.on('uploadSuccess', function(file) {
        $('#' + file.id).find('p.state').text('已上传');
    });

    uploader.on('uploadError', function(file,reason) {
        $('#' + file.id).find('p.state').text('上传出错');
    });

    uploader.on('uploadComplete', function(file) {
        $('#' + file.id).find('.progress').fadeOut();
    });

    uploader.on('all', function(type) {
        // console.log(type);
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }
        if (state === 'uploading') {
            if(source == 2){
                $('#plice_upload').text('上传中');
            }else{
                $('#no_plice_upload').text('上传中');
            }
        } else {
            if(source ==2){
                $('#plice_upload').text('公安类上传');
            }else{
                $('#no_plice_upload').text('非公安类上传');
            }
        }
    });

    $('#plice_upload').click(function() {
        source = 2;
        uploader.options.formData.source = 2;
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
    $('#no_plice_upload').click(function() {
        source = 3;
        uploader.options.formData.source = 3;
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
});