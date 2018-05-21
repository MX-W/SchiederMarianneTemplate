<div class="row">
    <div class="separator"></div>
</div>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <div class="row">
        <div class="col-lg-12">
            <h3><?php the_title(); ?></h3>
        </div>
    </div>

    <div class="row">
        <div class="time">
            <?php the_time('d. F Y'); ?>
        </div>
    </div>

    <div class="row">
        <div class="custom-hr">
            <span class="hr-left"></span>
        </div>
    </div>



    <div class="row">
        <div class="separator-small"></div>
    </div>

    <div class="row">
        <div class="col-lg-12 post-image-thumbnail">
            <?php the_post_thumbnail(); ?>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <p class="post-thumbnail-caption">
                <?php the_post_thumbnail_caption(); ?>
            </p>
        </div>
    </div>

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
        if(!in_category('reden', $post)) {
    ?>

            <div class="row">
                <div class="col-lg-12" style="margin-top: 25px;">
                    <button class="btn"><a href="/wordpress/aktuelles">Zurück</a></button>
                </div>
            </div>

    <?php
        } else {
            ?>

            <div class="row">
                <div class="col-lg-12" style="margin-top: 25px;">
                    <button class="btn"><a href="/wordpress/bundestag">Zurück</a></button>
                </div>
            </div>

    <?php
        }
    }
    ?>

</article>

<hr class="custom-post-divide">