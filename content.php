<?php

$cat = "";

if(is_page(57)) { //Aktuelles
	get_template_part('template-parts/aktuelles/content-aktuelles');
}elseif(is_page(63)) { //Bundestag
	$cat = 6;
}elseif(is_page(59)) { //Zur Person
	get_template_part('template-parts/zur-person/content-zur-person');
}elseif(is_page(61)) { //Wahlkreis
	get_template_part('template-parts/wahlkreis/content-wahlkreis');
}elseif(is_page(67)) { //Service
	get_template_part('template-parts/service/content-service');
}elseif(is_front_page()) {
	$cat = 1;
}elseif (substr_compare($_SERVER['REQUEST_URI'], "/wordpress/post/", 0, 16) == 0) {
    if(substr_compare($_SERVER['REQUEST_URI'], "/category", 15, 9) == 0) {
        $args = array();
    } else {
        $args = array(
            'post_type' => 'post',
            'p' => $_GET["id"]
        );
    }

    $results = new WP_Query($args);
    while ( $results->have_posts() ) {
        if ( $results->have_posts() ) {

            $results->the_post();

            get_template_part( 'content', get_post_format() );


       }
    }
}elseif(!is_page(57) && !is_page(63) && !is_page(59) && !is_page(61) && !is_page(67) &&!is_front_page()) {

    $args = array(
        'post_type' => 'post',
        'posts_per_page' => 7,
        'cat' => $cat
    );


	$results = new WP_Query( $args );


	while ( $results->have_posts() ) {
		if ( $results->have_posts() ) {

			$results->the_post();

			get_template_part( 'content', get_post_format() );


		}
	}

}
wp_reset_query();



?>