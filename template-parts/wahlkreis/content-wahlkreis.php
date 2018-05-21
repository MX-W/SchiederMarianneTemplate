

<h1 class="section-heading">Wahlkreis Schwandorf-Cham</h1>
<div class="custom-hr">
    <span class="hr-left"></span>
</div>


<div id="map"></div>


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

<script type="text/javascript" src="../../js/read_more_reminder.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1pHMVNqhgjGCAIoAhcIbDcQq5I2B1xsk&callback=myMap"></script>
