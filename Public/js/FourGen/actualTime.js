$(function(){
    var enforceMap = new EnforceMap(app.tp.map.lng,app.tp.map.lat);
    setInterval(function() {
        $.ajax({
            url:app.url('FourGen/get_gpsInfo'),
            type:'post',
            dataType:'json',
            success:function(data){
                if(data.total > 0){
                    for (var i = 0; i < data.rows.length; i++) {
                        if(enforceMap.markers[data.rows[i].jybh]){
                            enforceMap.moveScene(data.rows[i].jybh,data.rows[i].lng,data.rows[i].lat);
                        }else{
                            enforceMap.addScene(data.rows[i].lng,data.rows[i].lat,'',data.rows[i].jyxm+'('+data.rows[i].jybh+')',data.rows[i].jybh);
                        }

                    }
                }
                enforceMap.marker_clusterer();
            }
        });

    }, 5000);

    /*var marker = enforceMap.addScene(app.tp.map.lng,app.tp.map.lat,'','测试');
    google.maps.event.addListener(enforceMap.map, 'click', function(e) {
        console.log('{lng:',e.latLng.d,',lat:',e.latLng.e,'}');
    });
    console.log(marker);
    setTimeout(function(){
        marker.position.d = 32.05;
        marker.position.e = 118.7997;
        //移动位置
        marker.setMap(enforceMap.map);
    }, 3000);*/
});