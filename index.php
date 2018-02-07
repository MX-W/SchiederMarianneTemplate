<?php

if(is_front_page()):
	get_header('front');
else:
	get_header();
endif;


if(wp_is_mobile()):
	echo("Du bist am Handy!");
endif;
?>


<div class="row">

	<div class="col-lg-2"></div>
	<div class="col-lg-8 col-xs-12">
		<?php get_template_part('content'); ?>
	</div>
	<div class="col-lg-2"></div>

</div>


<?php get_footer(); ?>
