<div class="row">
	<div class="col-lg-8">

		<?php

		$paged = ( get_query_var( 'paged' ) ) ? get_query_var( 'paged' ) : 1;

		$args = array(
                'type' => 'post',
                'posts_per_page' => 5,
                'paged' => $paged,
        );

		global $resultsPosts;
        $resultsPosts = new WP_Query($args);


		while($resultsPosts->have_posts()) {
			if($resultsPosts->have_posts()) {
                $resultsPosts->the_post();
				get_template_part('template-parts/post-formats/content', get_post_type());
			}
		}?>
        <div class="row">
                <?php pagination($resultsPosts->max_num_pages)?>
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

<div class="row">
    <div class="separator"></div>
</div>

