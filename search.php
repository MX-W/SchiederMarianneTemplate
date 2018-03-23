<?php

get_header();

global $wp_query;
$total_results = $wp_query->found_posts;
?>
<div class="row">
    <div class="separator"></div>
</div>

<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">

        <div class="row">
            <div class="col-lg-12">
                <h4>Sie sind nicht zufrieden mit dem Suchergebnis?</h4>
                <p>Starten Sie doch eine neue Suche mit einem ähnlichen Suchbegriff!</p>
                <?php include(__DIR__ . '/template-parts/searchform.php'); ?>
            </div>
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>

        <h3>Suchergebnisse für <?php echo get_search_query();?>:</h3>

        <?php if(have_posts()) {
	        while ( have_posts() ) {
		        the_post(); ?>
                <div class="row">
                    <!--<div class="col-lg-2"></div>-->
                    <div class="col-lg-8">
                        <span class="search-post-title"><a
                                    href="<?php the_permalink(); ?>"><h3><?php the_title(); ?></h3></a></span>
				        <?php if ( is_single() ) { ?>
                            <div class="row">
                                <div class="time">
							        <?php the_time( 'd. F Y' ); ?>
                                </div>
                            </div>
				        <?php } ?>
                        <span class="search-post-excerpt"><?php the_excerpt(); ?></span>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
                <?php if($found_posts > 1) { ?>
                    <hr class="custom-hr">
                <?php } ?>

	        <?php }
        }else { ?>
            <br>
            <h5>Leider konnten keine Ergebnisse für Ihre Suche gefunden werden.</h5>

    <?php } ?>

    </div>
    <div class="col-lg-2"></div>
</div>
<?php get_footer(); ?>