<div class="row">
    <div class="separator"></div>
</div>


<h1 class="section-heading">Wahlkreis Schwandorf-Cham</h1>
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

        var markerWernberg = new google.maps.Marker({
            position: {
                lat: 49.543463,
                lng: 12.161269
            },
            map: map,
            title: 'Büro Wernberg-Köblitz'
        });

        var markerCham = new google.maps.Marker({
            position: {
                lat: 49.225169,
                lng: 12.669247
            },
            map: map,
            title: 'Büro Cham'
        });

        map.data.loadGeoJson(templateUrl + '/img/maps/Schwandorf-GeoJSON.json');

        var contentWernberg = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Büro Wernberg-Köblitz</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Adresse:</b><br>'+
            'Am Kalvarienberg 6<br>'+
            '92533 Wernberg-Köblitz<br>'+
            '<br><b>Tel.:</b> 09604 / 931211<br>'+
            '<b>Fax:</b> 09604 / 931355<br>'+
            '<b>Mail:</b> marianne.schieder@wk.bundestag.de<br>'+
            '<br><b>Öffnungszeiten:</b><br>'+
            'Mo. - Fr. 9.00 - 16.00 Uhr<br></p>'+
            '</div>'+
            '</div>';

        var infoSchwandorf = new google.maps.InfoWindow({
            content: contentWernberg
        });

        markerWernberg.addListener('click', function() {
            open = true;
            infoSchwandorf.open(map, markerWernberg);
        });

        var contentCham = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Büro Cham</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Adresse:</b><br>'+
            'Parkstraße 33<br>'+
            '93413 Cham<br>'+
            '<br><b>Tel.:</b> 09971 / 843626<br>'+
            '<b>Fax:</b> 09971 / 801598<br>'+
            '<b>Mail:</b> marianne.schieder@wk2.bundestag.de<br>'+
            '<br><b>Öffnungszeiten:</b><br>'+
            'Mo. - Fr. 9.00 - 14.00 Uhr<br>' +
            'und nach Vereinbarung<br><br></p>'+
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
