<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <div class="row">
        <div class="col-lg-12">
            <h3><?php the_title(); ?></h3>
        </div>
    </div>
    <!--<div class="row">
        <div class="col-lg-12 time">
            <?php /*the_category(); */?>
        </div>
    </div>-->

    <div class="row">
        <div class="separator-small"></div>
    </div>

    <div class="row">

        <div class="col-lg-12 post post-image-content justified">
            <?php
            if(is_single()) {
                the_content();
            } else {
                the_content('(mehr lesen...)');
            }
            ?>
        </div>

    </div>

    <?php
        if(is_single()) {
            ?>

            <div class="row">
                <div class="col-lg-12" style="margin-top: 25px;">
                    <button class="btn"><a href="/wordpress/bundestag">Zurück</a></button>
                </div>
            </div>

            <?php
        }
        ?>
    <div class="row">
        <div class="time">
            <?php the_time('d. F Y'); ?>
        </div>
    </div>

</article>

<?php
 if(!is_single() && !is_page(63) && !is_front_page()) {
     ?>
     <hr class="custom-post-divide">
     <?php
 }
 ?>