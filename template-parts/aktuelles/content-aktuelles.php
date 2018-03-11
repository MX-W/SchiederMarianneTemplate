<div class="row">
	<div class="separator"></div>
</div>

<div class="row">
	<div class="col-lg-8">

		<?php

		$args['cat'] = 4;


		$results = new WP_Query($args);


		while($results->have_posts()){
			if($results->have_posts()){

				$results->the_post();
				get_template_part('content', get_post_format());



			}
		}
		wp_reset_query();
		?>
	</div>

	<div class="col-lg-4">
		<div class="row">
			<input type="text" placeholder="Suche"/>
			<a href="" class="fas fa-search">S</a>

		</div>

		<div class="row">
			<?php wp_list_categories(); ?>
		</div>
	</div>
</div>

