var userMarker = new google.maps.Marker( {
        position : new google.maps.LatLng(30,120),
        map : map,
        title : "鼠标悬浮时提示的信息",
        icon : "图片位置字符串"
    });
var yourInfoWindow;

(function(userMarker) {
    google.maps.event.addListener(userMarker, 'click', function() {
        if (!yourInfoWindow) {
            yourInfoWindow = new google.maps.InfoWindow( {});
        }
        yourInfoWindow.setContent(userMarker.title);
        yourInfoWindow.open(map, userMarker);
    });
})(userMarker);