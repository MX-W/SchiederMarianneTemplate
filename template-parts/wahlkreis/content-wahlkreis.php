<div class="row">
    <div class="separator"></div>
</div>

<h1 class="section-heading">Wahlkreis Schwandorf-Cham</h1>

<div class="custom-hr">
    <span class="hr-left"></span>
</div>

<div class="row">
    <div class="col-lg-12">
        <p>
            Meine Heimat ist der Wahlkreis 234 Schwandorf, der die Landkreise Schwandorf und Cham mit ihren etwa 280.000 Einwohnerinnen und Einwohnern umfasst. Er erstreckt sich von Wernberg-Köblitz, wo ich geboren wurde und noch heute wohne, im Norden bis zum Städtedreieck im Süden hinüber zum Lamer Winkel im Bayerischen Wald und an der tschechischen Grenze entlang bis nach Stadlern. Insgesamt sind das fast 3.000 km² und damit mehr als das ganze Saarland mit knapp über 2.500 km²!
            <br style="line-height: 0.5;"><br style="line-height: 0.5;">
            Von hier stamme ich, hier bin ich daheim und hier lebe ich gerne. Seit 2005 kämpfe ich in Berlin mit aller Kraft und Leidenschaft für die Anliegen und Interessen unserer Heimat.
            <br style="line-height: 0.5;"><br style="line-height: 0.5;">
            Ich bin viel unterwegs in den 33 Kommunen im Landkreis Schwandorf und den 39 Kommunen im Landkreis Cham. So bin ich gerne im Kontakt mit Bürgerinnen und Bürgern, mit Vereinen und Organisationen, Rathäusern und Behörden, Betrieben und Unternehmen. Wollte ich allein jeden Tag eine andere Freiwillige Feuerwehr im Wahlkreis besuchen, wäre das problemlos möglich. Ein ganzes Jahr wäre ich dann mit den Besuchen beschäftigt!
        </p>
    </div>
</div>

<div class="row">
    <div class="separator-small"></div>
</div>


<?php
if(isset($_COOKIE["privacy_accepted"]) && $_COOKIE["privacy_accepted"] === "true") {?>
    <div id="map" style="width: 100%; height: 400px;"></div>
    <?php
} else {
    ?>
    <div style="width: 100%; height: 400px; background: linear-gradient(to bottom, #000000, #afafaf); display: flex; justify-content: center; align-items: center"; ">
    <p style="color: white; max-width: 30%;">
        <b>Google Maps anzeigen?</b>
        <br>
        <br>
        Um diese Karte anzuzeigen, werden auch personenbezogene Daten an Google Maps weitergeleitet.
        <br>
        <a class="youtube-privacy-link" href="https://policies.google.com/privacy" target="_blank">Google Datenschutzerklärung</a>
        <br>
        <br>
        Soll die Karte dargestellt werden?
        <br>
        <br>
        Dann akzeptieren Sie bitte die <a target="_blank" href="<?php echo home_url(); ?>/datenschutz">Datenschutzerklärung</a>, indem Sie folgenden Button drücken.
        <br>
        <br>
        <button onclick="setMapsPrivacy()" style="border: none; cursor: pointer; border-radius: 5px; background-color: #E3000F; color: #fff;">Karte anzeigen?</button>
    </p>
    </div>
    <?php
}

global $locations;
global $titles;
global $dates;

wp_register_script('maps_plugin', get_template_directory_uri().'/js/wahlkreis_maps_plugin.js');
$translation_array = array(
        'templateUrl' => get_template_directory_uri());

if(!is_null($locations)) {
    $translation_array['geoLocations'] = $locations;
    $translation_array['startDates'] = $dates;
    $translation_array['titles'] = $titles;
}

wp_localize_script('maps_plugin', 'object_name', $translation_array);
wp_print_scripts('maps_plugin');

?>

<div class="row">
    <div class="separator"></div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1pHMVNqhgjGCAIoAhcIbDcQq5I2B1xsk&callback=myMap"></script>
