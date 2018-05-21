<div class="row">
	<div class="col-lg-8">

		<?php

		$paged = ( get_query_var( 'paged' ) ) ? get_query_var( 'paged' ) : 1;

		$args = array(
                'type' => 'post',
                'posts_per_page' => 1,
                'paged' => $paged,
        );

		global $resultsReminder;
		 $resultsReminder = new WP_Query($args);


		while($resultsReminder->have_posts()) {
			if($resultsReminder->have_posts()) {
				$resultsReminder->the_post();
				get_template_part('template-parts/post-formats/content', get_post_type());
			}
		}?>
        <div class="row">
            <div class="nav-previous alignright"><?php next_posts_link( 'Ältere Beiträge', $resultsReminder->max_num_pages ); ?></div>

            <div class="nav-next alignleft"><?php previous_posts_link( 'Neuere Beiträge' ); ?></div>
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>

        <?php
        wp_reset_query();
		?>
	</div>

    <div class="col-lg-1"></div>

    <?php
    get_template_part("template-parts/sidebar/sidebar");
    ?>
</div>

