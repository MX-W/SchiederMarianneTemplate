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

        <?php
        $url = get_post_meta($post->ID, '_video_link_value_key', true);
        preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url, $matches);
        $id = $matches[1];
        ?>
        <div class="row">
            <div class="col-lg-10">
                <?php if(!is_archive()) { ?>
                <iframe width="1024" height="768" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                <?php } else { ?>
                <iframe width="800" height="601" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                <?php } ?>
            </div>
        </div>

        <?php
        if(!is_single() && !is_page(63) && !is_front_page()) {
        ?>
            <hr class="custom-post-divide">
        <?php
        }
        ?>


    </article>
</div>