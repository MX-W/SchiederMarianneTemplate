<div class="row">
    <div class="separator"></div>
</div>


<h1>Wahlkreis Schwandorf-Cham</h1>
<div class="custom-hr">
    <span class="hr-left"></span>
</div>


<div id="map"></div>


<div class="row">
    <div class="separator"></div>
</div>


<script type="text/javascript">

    var templateUrl = '<?= get_bloginfo("template_url"); ?>';

    function myMap() {
        var open = false;
        var mapCanvas = document.getElementById("map");
        var mapOptions = {
            center: new google.maps.LatLng(49.3, 12.423), zoom: 9
        };
        var map = new google.maps.Map(mapCanvas, mapOptions);

        var markerSchwandorf = new google.maps.Marker({
            position: {
                lat: 49.3261854,
                lng: 12.1092708
            },
            map: map,
            title: 'Schwandorf'
        });

        var markerCham = new google.maps.Marker({
            position: {
                lat: 49.2178194,
                lng: 12.6663832
            },
            map: map,
            title: 'Cham'
        });

        map.data.loadGeoJson(templateUrl + '/img/maps/Schwandorf-GeoJSON.json');

        var contentSchwandorf = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Schwandorf</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Schwandorf</b>, Informationstext über Schwandorf </p>'+
            '<p>Website: <a href="http://www.landkreis-schwandorf.de" target="_blank">www.landkreis-schwandorf.de</a> </p>'+
            '</div>'+
            '</div>';

        var infoSchwandorf = new google.maps.InfoWindow({
            content: contentSchwandorf
        });

        markerSchwandorf.addListener('click', function() {
            open = true;
            infoSchwandorf.open(map, markerSchwandorf);
        });

        var contentCham = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Cham</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Cham</b>, Informationstext über Cham </p>'+
            '<p>Website: <a href="https://www.landkreis-cham.de" target="_blank">www.landkreis-cham.de</a> </p>'+
            '</div>'+
            '</div>';

        var infoCham = new google.maps.InfoWindow({
            content: contentCham
        });

        markerCham.addListener('click', function() {
            open = true;
            infoCham.open(map, markerCham);
        });
    }
</script>









<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1pHMVNqhgjGCAIoAhcIbDcQq5I2B1xsk&callback=myMap"></script>
