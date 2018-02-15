<?php

$args = array(
	'post_type' => 'post',
	'posts_per_page' => 10
);

if(is_page(55)):
	$cat = 1;
elseif(is_page(57)):
	$cat = 4;
elseif(is_page(63)):
	$cat = 6;
elseif(is_page(59)):
	get_template_part('template-parts/service/content-zur-person');
elseif(is_page(61)):
	$cat = 5;
elseif(is_page(65)):
	$cat = 7;
elseif(is_page(67)):
	get_template_part('template-parts/service/content-service');
elseif(is_front_page()):
	$cat = 1;

endif;

if(!is_page(67) && !is_page(59)){

	$args['cat'] = $cat;


	$results = new WP_Query($args);


	while($results->have_posts()):
		if($results->have_posts()): $results->the_post();

			get_template_part('content', get_post_format());



		endif;
	endwhile;
}



?>