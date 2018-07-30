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
                <?php
                if(!is_archive()) {
                    if(isset($_SESSION['youtube-privacy'])) {?>
                        <iframe width="1024" height="768" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                <?php
                    } else {
                        ?>
                <div style="width: 800px; height: 601px; background: linear-gradient(to bottom, #980267, #E3000F); display: flex; justify-content: center; align-items: center"; ">
                <p style="color: white; max-width: 30%;">
                    <b>Youtube Video anzeigen?</b>
                    <br>
                    <br>
                    Um dieses Video von YouTube wiederzugeben, werden auch personenbezogene Daten an YouTube weitergeleitet.
                    <br>
                    <a class="youtube-privacy-link" href="https://support.google.com/youtube/answer/7671399?p=privacy_guidelines&hl=de&visit_id=0-636627590850052277-536323753&rd=1" target="_blank">YouTube Datenschutzerklärung</a>
                    <br>
                    <br>
                    Soll das Video von YouTube dargestellt werden?
                    <br>
                    <br>
                    <button onclick="setYoutubePrivacy()">Video anzeigen</button>
                </p>
            </div>
                <?php
                    }
                } else {
                    if(isset($_SESSION['youtube-privacy'])) {
                    ?>
                    <iframe width="800" height="601" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                    <?php
                } else {
                ?>
                <div style="width: 800px; height: 601px; background: linear-gradient(to bottom, #980267, #E3000F); display: flex; justify-content: center; align-items: center"; ">
                <p style="color: white; max-width: 30%;">
                    <b>Youtube Video anzeigen?</b>
                    <br>
                    <br>
                    Um dieses Video von YouTube wiederzugeben, werden auch personenbezogene Daten an YouTube weitergeleitet.
                    <br>
                    <a class="youtube-privacy-link" href="https://support.google.com/youtube/answer/7671399?p=privacy_guidelines&hl=de&visit_id=0-636627590850052277-536323753&rd=1" target="_blank">YouTube Datenschutzerklärung</a>
                    <br>
                    <br>
                    Soll das Video von YouTube dargestellt werden?
                    <br>
                    <br>
                    <button onclick="setYoutubePrivacy()">Video anzeigen</button>
                </p>
            </div>
            <?php

            }
            } ?>
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