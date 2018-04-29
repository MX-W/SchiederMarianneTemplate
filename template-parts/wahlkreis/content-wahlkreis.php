

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

$results = new WP_Query($argsReminder);

global $locations;
global $titles;
global $dates;

if($results->have_posts()) {
    $locations = array();
    while ($results->have_posts()) {
        $results->the_post();
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



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1pHMVNqhgjGCAIoAhcIbDcQq5I2B1xsk&callback=myMap"></script>
