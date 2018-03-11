<?php

$args = array(
	'post_type' => 'post',
	'posts_per_page' => 7
);

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
}

if(!is_page(57) && !is_page(63) && !is_page(59) && !is_page(61) && !is_page(67) &&!is_front_page()) {
	$args['cat'] = $cat;


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