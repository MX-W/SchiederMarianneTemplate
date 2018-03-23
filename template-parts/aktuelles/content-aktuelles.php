<div class="row">
	<div class="col-lg-8">

		<?php

		$args['cat'] = 4;

		global $results;
		 $results = new WP_Query($args);


		while($results->have_posts()) {
			if($results->have_posts()) {
				$results->the_post();
				get_template_part('content', get_post_format());
			}
		}
		wp_reset_query();
		?>
	</div>

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

    <div class="col-lg-1"></div>
</div>

