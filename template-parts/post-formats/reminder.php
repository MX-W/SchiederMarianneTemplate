<?php
/*
 * The template for displaying reminder
 */
?>
<div class="row">
    <article id="reminder-<?php the_ID(); ?>" itemscope itemtype="http://schema.org/Event">

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <?php
                the_simdiaw_meta_date();
                the_simdiaw_date();
                if (has_simdiaw_start_time()) the_simdiaw_time();
                ?>
            </div>

            <div class="col-lg-5">
                <div class="row">
                    <div class="col-lg-12">
                        <?php

                        if ( is_single() ) :
                            the_title( '<h3 class="entry-title" itemprop="name">', '</h3>' );
                        else :
                            the_title( '<h3 class="entry-title"><a class="post-title-link" href="' . esc_url( get_permalink() ) . '" rel="bookmark" itemprop="name">', '</a></h3>' );
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
            <div class="col-lg-4"></div>
        </div>
    </article><!-- reminder-<?php the_ID(); ?> -->
</div>
