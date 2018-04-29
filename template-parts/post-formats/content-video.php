<div class="row video-entry">
    <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
        <div class="row">
            <div class="col-lg-12">
                <h3><?php the_title(); ?></h3>
            </div>
            <div class="custom-hr">
                <span class="hr-left"></span>
            </div>
        </div>

        <div class="row">

            <div class="col-lg-12">
                <?php
                if(is_single()) {
                    the_content();
                } else {
                    the_content('(mehr lesen...)');
                }
                ?>
            </div>

        </div>

    </article>
</div>