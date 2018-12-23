<?php
/*
 * The template for displaying reminder
 */
if(wp_is_mobile()) {
?>
<div class="row reminder-entry" style="padding: 5px;">
    <?php
    } else {
    ?>
    <div class="row reminder-entry">
        <?php
        }
        ?>
        <div class="col-lg-1"></div>
        <div class="col-lg-2">
            <?php
            the_simdiaw_meta_date();
            echo get_simdiaw_start_date() . '<br>';
            if (has_simdiaw_start_time()) echo get_simdiaw_start_time();
            if(has_simdiaw_end_date()) {
                echo 'bis <br>';
                echo get_simdiaw_end_date() . '<br>';
                echo get_simdiaw_end_time();
            }
            ?>
        </div>

        <div class="col-lg-5">
            <div class="row">
                <div class="col-lg-12">
                    <?php

                    if ( is_single() ) :
                        the_title( '<h3 class="entry-title" itemprop="name">', '</h3>' );
                    else :
                        the_title( '<h3 class="entry-title"><a class="post-title-link heading-normal" href="'. get_site_url().'/wahlkreis' .'" rel="bookmark" itemprop="name">', '</a></h3>' );
                    endif;
                    ?>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <?php the_simdiaw_location();?>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-s-4">
            <div class="row">
                <div class="col-lg-11 col-s-11" id="reminder-content-<?php the_ID(); ?>">
                    <?php
                    $content = get_the_content();
                    if(is_page('wahlkreis') && wp_is_mobile()) {
                        echo $content;
                    } else {
                        echo wp_trim_words($content, 15);
                    }
                    ?>
                </div>
                <?php
                if(!wp_is_mobile()) {
                    if(str_word_count($content) > 15) {
                        ?>
                        <div class="col-lg-1">
                            <p id="<?php the_ID(); ?>" class="read-more" onclick="onReadMore(this.id)"></p>
                        </div>
                        <?php
                    }
                }
                ?>
            </div>
        </div>
    </div>