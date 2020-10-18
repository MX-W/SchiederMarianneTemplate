<link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/sidebar.css">
<div class="col-lg-3">

    <div class="row">
        <div class="separator"></div>
    </div>

    <div class="row">
		<?php include( __DIR__ . '/../searchform.php' ); ?>
    </div>

    <div class="row">
        <div class="separator"></div>
    </div>

    <div class="row">
        <p class="categories">Kategorien</p>
    </div>

    <div class="row">
		<?php wp_dropdown_categories( array(
			'orderby'          => 'name',
			'order'            => 'ASC',
			'class'            => 'archive-select',
			'show_option_none' => 'Bitte auswählen',

		) ); ?>
        <script type="text/javascript">

            var dropdown = document.getElementById("cat");

            function onCatChange() {
                if (dropdown.options[dropdown.selectedIndex].value > 0) {
                    location.href = "<?php echo esc_url( home_url( '/' ) ); ?>?cat=" + dropdown.options[dropdown.selectedIndex].value;
                }
            }

            dropdown.onchange = onCatChange;

        </script>
    </div>

    <div class="row">
        <div class="separator"></div>
    </div>

    <div class="row">
        <p class="categories">Archiv</p>
    </div>

    <div class="row">
        <select class="archive-select" onchange="document.location.href=this.options[this.selectedIndex].value;">
            <option value="" hidden>Bitte Auswählen</option>
			<?php wp_get_archives( array(
				'type'   => 'monthly',
				'format' => 'option',
			) ); ?>
        </select>
    </div>
    <div class="row">
        <br>
        <a class="download-link" title="Version 1.0.0" href="https://marianne-schieder.de/download/293/" rel="nofollow">
            Pressemitteilungen von 2006-2018 (Sofortiger Download bei Klick!)
        </a>
        <!-- <a onclick="downloadNews()" target="_blank">Pressemitteilungen der alten Website von 2006-2018 (automatischer Download)</a> -->
    </div>

    <!--	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<p class="categories">Reden</p>
	</div>

	<div class="row">

        <div class="col-lg-10">
            <div class="row">
            <?php
	/*            $argsReden = array(
					'post_type' => 'reden',
					'posts_per_page' => 4,
					'orderby' => 'date',

				);

				$resultsReden = new WP_Query($argsReden);

				if($resultsReden->have_posts()) {
					while($resultsReden->have_posts()) {
						$resultsReden->the_post();
				*/ ?>
                <a class="link-archive link-small" href="<?php /*the_permalink(); */ ?>"><h5 class="heading-small"><?php /*the_title(); */ ?></h5></a>
                <span class="hr-black"></span>
            <?php
	/*                }
				} else {
					*/ ?>
                <div class="row">
                    <p>Zur Zeit sind leider noch keine Reden vorhanden.</p>
                </div>
                <?php
	/*            }
				wp_reset_query();
				*/ ?>
            </div>

            <div class="row">
                <div class="separator-small"></div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <a class="link-small link-purple" href="<?php /*echo get_post_type_archive_link( 'reden' ); */ ?>">Klicken Sie hier um alle Reden zu sehen.</a>
                </div>
            </div>

        </div>

	</div> !-->

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
				'orderby'   => 'date'
			);

			$resultsVideo = new WP_Query( $argsVideo );

			if ( $resultsVideo->have_posts() ) {
			$resultsVideo->the_post();

			$url = get_post_meta( $post->ID, '_video_link_value_key', true );
			preg_match( '/[\\?\\&]v=([^\\?\\&]+)/', $url, $matches );
			$id = $matches[1];
			?>
            <div class="row">
                <div class="col-lg-10">
                    <p><?php the_content(); ?></p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10">
					<?php


					/**
					 * Render the iframe with the video
					 */
					if ( isset( $_SESSION['youtube-privacy'] ) ) { ?>
                        <iframe width="100%" height="auto"
                                src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1"
                                frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
						<?php
					} /**
					 * Render the youtube privacy information
					 */
					else
					{
					?>
                    <div style="width: 100%; height: auto; background: linear-gradient(to bottom, #000000, #afafaf); display: flex; justify-content: center; align-items: center">
                    <p style="color: white; max-width: 90%; text-align: center;">
                        <br>
                        Um dieses Video von YouTube wiederzugeben, werden auch personenbezogene Daten an YouTube
                        weitergeleitet.
                        <br>
                        <a class="youtube-privacy-link"
                           href="https://support.google.com/youtube/answer/7671399?p=privacy_guidelines&hl=de&visit_id=0-636627590850052277-536323753&rd=1"
                           target="_blank">YouTube Datenschutzerklärung</a>
                        <br>
                        <br>
                        <button onclick="setYoutubePrivacy()"
                                style="border: none; cursor: pointer; border-radius: 5px; background-color: #E3000F; color: #fff;">
                            Video anzeigen?
                        </button>
                    </p>
                </div>
				<?php
				}
				?>
            </div>
        </div>
		<?php
		} else {
			?>
            <div class="row">
                <p>Zur Zeit sind leider noch keine Videos vorhanden.</p>
            </div>
			<?php
		}


		if ( $resultsVideo->post_count > 1 ) {
			?>
            <div class="row">
                <div class="col-lg-12">
                    <a class="link-small link-purple" href="<?php echo get_post_type_archive_link( 'video' ); ?>">Klicken
                        Sie hier um alle Videos zu sehen.</a>
                </div>
            </div>
			<?php
		}
		wp_reset_query();
		?>
    </div>
</div>
