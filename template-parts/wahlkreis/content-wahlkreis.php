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
if(isset($_SESSION['maps-privacy'])) {?>
    <div id="map"></div>
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
        Soll das Karte dargestellt werden?
        <br>
        <br>
        <button onclick="setMapsPrivacy()" style="border: none; cursor: pointer; border-radius: 5px; background-color: #E3000F; color: #fff;">Karte anzeigen?</button>
    </p>
    </div>
    <?php
}
?>


<div class="row">
    <div class="separator"></div>
</div>

<?php

$argsReminder = array(
    'post_type' => 'reminder',
    'posts_per_page' => -1,
    'meta_query' => array (
        array(
            'key' => 'simdiaw-start-date',
            'value' => date("Y-m-d"),
            'compare' => '>='
        )
    ),
    'orderby' => 'meta_value',
    'order' => 'ASC',
    'meta_key' => 'simdiaw-start-date',
);

$resultsReminder = new WP_Query($argsReminder);

global $locations;
global $titles;
global $dates;

if($resultsReminder->have_posts()) {
    $locations = array();
    while ($resultsReminder->have_posts()) {
        $resultsReminder->the_post();
        $locations[] = get_simdiaw_location();
        $dates[] = get_simdiaw_start_date();
        $titles[] = get_the_title();

    }
}

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
    <div class="col-lg-12">
        <div class="row">
            <h1  class="section-heading">Termine</h1>
            <div class="custom-hr">
                <span class="hr-left"></span>
            </div>
        </div>
        <?php
		if ( $resultsReminder->have_posts() ) {
			?>
            <div class="row">
                <p>Hier sehen Sie alle demnächst anstehende Termine.</p>
            </div>

            <div class="row">
                <div class="separator"></div>
            </div>

            <div class="row reminder-entry">
                <div class="col-lg-1"></div>
                <div class="col-lg-2">
                    <p class="center-vertical">Datum/Uhrzeit</p>
                </div>
                <div class="col-lg-5">
                    <p class="center-vertical">Ort</p>
                </div>
                <div class="col-lg-4">
                    <p class="center-vertical">Info</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="hr-line-purple"></div>
                </div>
            </div>
			<?php
			while($resultsReminder->have_posts()) {
				$resultsReminder->the_post();
				get_template_part('template-parts/post-formats/content', get_post_type());
			}
		} else {
			?>
            <div class="row">
                <p>Zur Zeit stehen keine Termine an!</p>
            </div>

			<?php
		}
		wp_reset_query();
		?>
    </div>
</div>

<div class="row">
    <div class="separator"></div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1pHMVNqhgjGCAIoAhcIbDcQq5I2B1xsk&callback=myMap"></script>
