<?php get_header(); ?>
<?php
$postType = get_post_type();

?>

<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">

        <div class="row">
<?php

if( strcmp($postType, 'post') === 0) {                    //  If the post type is not speeches, do this

    ?>

    <link href=" <?php echo get_template_directory_uri() ?>/css/subpages/schieder-aktuelles.css" rel="stylesheet" type="text/css" />

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
} else {
    ?>
                <div class="col-lg-12">

                    <?php
                    if(have_posts()) {
                        while(have_posts()) {
                            the_post();
                            get_template_part( 'template-parts/post-formats/content', get_post_type());
                        }
                    }
                    ?>
                </div>
    <?php }?>
    </div>
    </div>
    <div class="col-lg-2"></div>
</div>

<?php
get_footer();