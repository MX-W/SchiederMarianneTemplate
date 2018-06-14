<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/sidebar.css">
<div class="col-lg-3">

	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<?php include (__DIR__ . '/../searchform.php');?>
	</div>

	<!--<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<?php /*wp_list_categories(); */?>
	</div>-->

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

	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<p class="categories">Reden</p>
	</div>

	<div class="row">

        <div class="col-lg-10">
            <div class="row">
            <?php
            $argsReden = array(
                'post_type' => 'reden',
                'posts_per_page' => 4,
                'orderby' => 'date',

            );

            $resultsReden = new WP_Query($argsReden);

            if($resultsReden->have_posts()) {
                while($resultsReden->have_posts()) {
                    $resultsReden->the_post();
            ?>
                <a class="link-archive link-small" href="<?php the_permalink(); ?>"><h5 class="heading-small"><?php the_title(); ?></h5></a>
                <span class="hr-black"></span>
            <?php
                }
            }
            wp_reset_query();
            ?>
            </div>

            <div class="row">
                <div class="separator-small"></div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <a class="link-small link-purple" href="<?php echo get_post_type_archive_link( 'reden' ); ?>">Klicken Sie hier um alle Reden zu sehen.</a>
                </div>
            </div>

        </div>

	</div>

	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<p class="categories">Videos</p>
	</div>

	<div class="row">
        <div class="col-lg-12">
            <?php
            $argsVideo = array(
                'post_type' => 'video',
                'posts_per_page' => 1,
                'orderby' => 'date'
            );

            $resultsVideo = new WP_Query($argsVideo);

            if( $resultsVideo->have_posts()) {
                while($resultsVideo->have_posts()) {
                    $resultsVideo->the_post();

                    $url = get_post_meta($post->ID, '_video_link_value_key', true);
                    preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url, $matches);
                    $id = $matches[1];
                    ?>
                    <div class="row">
                        <div class="col-lg-10">
                            <p><?php the_content(); ?></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-10">
                            <iframe width="100%" height="auto" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                        </div>
                    </div>
                    <?php
                }
            } else {
                ?>
                <div class="row">
                    <p>Zur Zeit sind leider keine Videos vorhanden.</p>
                </div>
                <?php
            }
            wp_reset_query();
            ?>

            <div class="row">
                <div class="col-lg-12">
                    <a class="link-small link-purple" href="<?php echo get_post_type_archive_link( 'video' ); ?>">Klicken Sie hier um alle Videos zu sehen.</a>
                </div>
            </div>
        </div>
	</div>
</div>
