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
            if(is_page(57)) {
                the_excerpt();
            } elseif (substr_compare($_SERVER['REQUEST_URI'], "/wordpress/post/category/", 0, 25) == 0) {
                the_excerpt();
            } else {
                the_content();
            }
            ?>
        </div>

    </div>

    <?php
    if(!is_page(57) && substr_compare($_SERVER['REQUEST_URI'], "/wordpress/post/category/", 0, 25) != 0) {
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

    <?php// echo $_SERVER['REQUEST_URI'] ?>
</article>

<hr>