$(function(){
    var enforceMap = new EnforceMap(app.tp.map.lng,app.tp.map.lat);

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