<?php get_header(); ?>

    <div class="row">
        <div class="col-lg-3"></div>

        <div class="col-lg-6">
            <?php
            if(have_posts()) {
                while(have_posts()) {
                    the_post();
                    get_template_part( 'template-parts/post-formats/content', get_post_type());
                }
            }
            ?>
        </div>

        <div class="col-lg-3"></div>
    </div>

<?php get_footer(); ?>