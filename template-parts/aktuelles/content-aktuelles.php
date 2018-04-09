<div class="row">
	<div class="col-lg-8">

		<?php

		$paged = ( get_query_var( 'paged' ) ) ? get_query_var( 'paged' ) : 1;

		$args = array(
		        'cat' => 4,
                'type' => 'post',
                'posts_per_page' => 1,
                'paged' => $paged,
        );

		global $results;
		 $results = new WP_Query($args);


		while($results->have_posts()) {
			if($results->have_posts()) {
				$results->the_post();
				get_template_part('content', get_post_format());
			}
		}?>
        <div class="row">
            <div class="nav-previous alignright"><?php next_posts_link( 'Ältere Beiträge', $results->max_num_pages ); ?></div>

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

	<div class="col-lg-3">

        <div class="row">
            <div class="separator"></div>
        </div>

		<div class="row">
            <?php include (__DIR__ . '/../searchform.php');?>
		</div>

        <div class="row">
            <div class="separator"></div>
        </div>

		<div class="row">
			<?php wp_list_categories( array(
			        "exclude" => "4, 15"
            )); ?>
		</div>

        <div class="row">
            <div class="separator"></div>
        </div>

        <div class="row">
            <p class="categories">Archiv</p>
        </div>

        <div class="row">
            <select id="archive-select" onchange="document.location.href=this.options[this.selectedIndex].value;">
                <option value="" hidden>Bitte Auswählen</option>
                <?php wp_get_archives( array(
                        'type' => 'monthly',
                        'format' => 'option'
                )); ?>
            </select>
        </div>
	</div>
</div>

