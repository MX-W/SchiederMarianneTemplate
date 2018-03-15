<div class="row">
    <div class="separator"></div>
</div>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <div class="row">
        <div class="col-lg-12">
            <h2><?php the_title(); ?></h2>
        </div>

        <div class="col-lg-4"></div>

    </div>
    <div class="custom-hr">
        <span class="hr-left"></span>
    </div>

    <div class="row">
        <div class="col-lg-12 post-image-thumbnail">
            <?php the_post_thumbnail(); ?>
        </div>
    </div>

    <div class="row">

        <div class="col-lg-12 post post-image-content justified">
            <?php
            if(is_single()) {
                the_content();
            } else {
                the_excerpt();
            }
            ?>
        </div>

    </div>

    <?php
    if(is_single()) {
    ?>

    <div class="row">
        <div class="col-lg-12">
            <button class="btn"><a href="/wordpress/aktuelles">Zurück</a></button>
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

<hr>