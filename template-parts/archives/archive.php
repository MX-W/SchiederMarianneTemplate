<?php get_header(); ?>
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">

            <div class="row">
                <div class="col-lg-8">

                    <?php
                    if(have_posts()) {
                        while(have_posts()) {
                            the_post();
                            get_template_part( 'template-parts/post-formats/content', get_post_type() );
                        }
                    }
                    ?>
                </div>

                <div class="col-lg-1"></div>

	            <?php
	            get_template_part("template-parts/sidebar/sidebar");
	            ?>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>

<?php
get_footer();