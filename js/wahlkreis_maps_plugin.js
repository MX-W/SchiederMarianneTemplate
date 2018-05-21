var templateUrl = object_name.templateUrl;

var geoLocations = object_name.geoLocations;

var dates = object_name.startDates;

var titles = object_name.titles;

/*console.log(dates);
console.log(titles);*/

var info = null;

function myMap() {

    var markerPositionsLat = [];
    var markerPositionsLng = [];

    var counter = 0;

    info = new google.maps.InfoWindow({
        content: 'holding..'
    });

    /*console.log(geoLocations);*/

    if(geoLocations !== undefined) {
        Object.keys(geoLocations).forEach(function (key) {

            key = key.replace(',', '');
            key = key.replace(' ', '+');

            var mapsGeocodeApiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=' +
                geoLocations[key] + '&region=de&bounds=49.635436, 11.763190|49.004473, 13.336531&key=AIzaSyA1pHMVNqhgjGCAIoAhcIbDcQq5I2B1xsk';

            $.ajax({
                url: mapsGeocodeApiUrl,
                dataType: 'json',
                async: false,
                success: function (data) {
                    markerPositionsLat[counter] = data.results[0].geometry.location.lat;
                    markerPositionsLng[counter] = data.results[0].geometry.location.lng;
                }
            });

            /*console.log('Positions: ' + markerPositionsLat, markerPositionsLng);*/

            counter++;
        });

    }


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
        animation: google.maps.Animation.DROP,
        title: 'Büro Wernberg-Köblitz'
    });

    var markerCham = new google.maps.Marker({
        position: {
            lat: 49.225169,
            lng: 12.669247
        },
        map: map,
        animation: google.maps.Animation.DROP,
        title: 'Büro Cham'
    });

    var markerArray = [];

    if(markerPositionsLat !== {}) {
        for (var i = 0; i < markerPositionsLat.length; i++) {
            markerArray.push(new google.maps.Marker({
                position: {
                    lat: markerPositionsLat[i],
                    lng: markerPositionsLng[i]
                },
                icon: {
                    path: "M113.8,22.905h-13.514v-5.406c0-3.215-2.631-5.845-5.846-5.845s-5.844,2.63-5.844,5.845v5.406H50.406v-5.406" +
                    "  c0-3.215-2.63-5.845-5.845-5.845s-5.845,2.63-5.845,5.845v5.406H25.202c-5.533,0-10.035,4.501-10.035,10.034v74.122" +
                    "  c0,5.533,4.501,10.034,10.035,10.034h79.632c10.478,0,19-8.522,19-19V32.939C123.834,27.406,119.333,22.905,113.8,22.905z" +
                    "   M25.202,30.905h13.521c0.077,3.149,2.671,5.702,5.838,5.702c3.166,0,5.759-2.553,5.837-5.702h38.205" +
                    "  c0.078,3.149,2.67,5.702,5.837,5.702s5.761-2.553,5.839-5.702H113.8c1.104,0,2.034,0.932,2.034,2.034v15.624H23.167V32.939" +
                    "  C23.167,31.836,24.099,30.905,25.202,30.905z M23.167,107.061V56.438h92.667V91.5H99.487l-0.12,17.595H25.202" +
                    "  C24.099,109.095,23.167,108.163,23.167,107.061z M107.37,108.788l0.064-9.288h8.299C115.148,104.058,111.77," +
                    "107.744,107.37,108.788z M46.491,75.32c0.04-3.665,1.347-6.345,3.445-8.132c2.099-1.743,4.951-2.592,8.039-2.592c7.999,0,10.652,5.363,10.652,7.998" +
                    "  c0,6.524-3.644,6.524-3.644,6.658v0.089c0,0.358,4.514,0.358,4.514,7.284c0,3.798-2.534,9.785-11.563,9.785  " +
                    "c-12.396,0-12.434-9.831-12.236-12.153h7.523c-0.04,1.654,0.317,2.903,1.069,3.708c0.752,1.027,1.901,1.386,3.287,1.386" +
                    "  c2.257,0,3.683-0.938,3.683-3.485c0-2.727-1.861-3.218-3.683-3.218c-1.149,0-1.703,0.135-2.297,0.225v-6.078" +
                    "  c0.594,0.045,1.228,0.179,2.297,0.179c1.664,0,3.762-0.401,3.762-2.813c0-1.967-1.98-2.727-3.603-2.727" +
                    "  c-2.139,0-3.881,1.295-3.802,3.887H46.491z M81.264,78.135h-6.455v-6.434c3.999,0.09,7.96-1.607,8.196-6.747H89.5v31.099h-8.236V78.135z",
                    scale: .3,
                    fillColor: 'black',
                    fillOpacity: .8
                },
                map: map,
                animation: google.maps.Animation.DROP,
                title: titles[i]
            }));
        }
    }

    /*for (var i = 0; i< markerArray.length; i++) {

        var marker = markerArray[i];

        var content = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">'+ titles[i]+'</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Adresse:</b><br>'+
            geoLocations[i] + '<br>'+
            '<b>Zeit:</b><br>'+
            dates[i] + '<br>'+
            '</div>'+
            '</div>';

        console.log(content);

        google.maps.event.addListener(marker, 'click', function() {
            info.setContent(content);
            info.open(map, this);
        });
    }*/


/*    console.log('Lat: ' + markerPositionsLat);
    console.log('Lng: ' + markerPositionsLng);
    console.log('Markers: ' + markerArray);
*/

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
        infoCham.open(map, markerCham);
    });
}