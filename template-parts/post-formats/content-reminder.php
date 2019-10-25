<?php
/*
 * The template for displaying reminder
 */
if ( wp_is_mobile() ) {
?>
<div class="row reminder-entry" style="padding: 5px;">
	<?php
	} else {
	?>
    <div class="row reminder-entry">
		<?php
		}
		?>
        <div class="col-lg-1"></div>
        <div class="col-lg-2">
			<?php
			echo get_termine_start_date( 'd. F Y' ) . '<br>';
			if ( has_termine_start_time() ) {
				echo( get_termine_start_time( 'H:i' ) . " Uhr" );
			}
			if ( has_termine_end_date() ) {
				echo ' bis <br>';
				echo get_termine_end_date( 'd. F Y' ) . '<br>';
				if ( has_termine_end_time() ) {
					echo( get_termine_end_time( 'H:i' ) . ' Uhr' );
				}
			}
			?>
        </div>

        <div class="col-lg-8">
            <div class="row">
                <div class="col-lg-12">
					<?php

					if ( is_single() ) :
						the_title( '<h3 class="entry-title" itemprop="name">', '</h3>' );
					else :
						the_title( '<h3 class="entry-title">', '</h3>' );
					endif;
					?>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
					<?php the_termine_location(); ?>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>