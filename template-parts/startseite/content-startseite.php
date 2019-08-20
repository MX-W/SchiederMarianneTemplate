
<div class="row">
    <div class="separator"></div>
</div>

<!--<div class="row">
    <div class="slideshow-container">
        <img class="slide fade" src="/img/slideshow/1.jpg"/>
    </div>
</div>-->

<div class="row">
    <div class="col-lg-12">
        <div class="row">
            <h1  class="section-heading">Nachrichten</h1>
            <div class="custom-hr">
                <span class="hr-left"></span>
            </div>
        </div>
    </div>
</div>


<?php
$argsNews = array(
    'post-type' => 'post',
    'posts_per_page' => 3,
    'orderby' => 'date'
);

$resultsNews = new WP_Query($argsNews);

if($resultsNews->have_posts()) {
    if(!wp_is_mobile()) {
        ?>
        <div class="row">
            <?php

            while ($resultsNews->have_posts()) {
                $resultsNews->the_post();

                $secondaryImage = null;
                if (class_exists('MultiPostThumbnails')) {

                    $secondaryImage = MultiPostThumbnails::get_the_post_thumbnail(get_post_type(), 'secondary-image');
                }
                if ($secondaryImage != null) {
                    ?>
                    <div class="col-lg-4 col-padding">
                        <?php echo $secondaryImage ?>
                    </div>

                    <?php
                } else {
                    ?>
                    <div class="col-lg-4 col-padding">
                        <?php the_post_thumbnail(); ?>
                    </div>
                    <?php
                }
            }
            ?>
        </div>
        <div class="row">
            <?php
            while ($resultsNews->have_posts()) {
                $resultsNews->the_post();
                ?>
                <div class="col-lg-4 col-padding">
                    <h6 class="news-heading"><a class="post-title-link"
                                                href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h6>
                </div>
                <?php
            } ?>
        </div>
        <div class="row">
            <?php
            while ($resultsNews->have_posts()) {
                $resultsNews->the_post();
                ?>
                <div class="col-lg-4 col-padding">
                    <?php echo get_the_content('weiterlesen >'); ?>
                </div>
                <?php
            } ?>
        </div>
        <?php
    } else {

        while($resultsNews->have_posts()) {
            $resultsNews->the_post();
            ?>
            <div class="row">
                <div class="col-s-12">
                    <div class="row">
                        <div class="col-s-12">
                            <?php
                            $secondaryImage = null;
                            if (class_exists('MultiPostThumbnails')) {

                                $secondaryImage = MultiPostThumbnails::get_the_post_thumbnail(get_post_type(), 'secondary-image');
                            }
                            if ($secondaryImage != null) {
                                ?>
                                <div class="col-lg-4 col-padding">
                                    <?php echo $secondaryImage ?>
                                </div>

                                <?php
                            } else {
                                ?>
                                <div class="col-lg-4 col-padding">
                                    <?php the_post_thumbnail(); ?>
                                </div>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-s-12">
                            <h6 class="news-heading"><a class="post-title-link"
                                                        href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-s-12">
                            <?php echo get_the_content('weiterlesen >'); ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
    }
}
?>

<div class="row">
    <div class="separator"></div>
</div>


<div class="row">
    <div class="col-lg-12">
        <div class="row">
            <h1  class="section-heading">Termine</h1>
            <div class="custom-hr">
                <span class="hr-left"></span>
            </div>
        </div>
        <?php $argsReminder = array(
            'post_type' => 'reminder',
            'meta_query' => array (
                    'relation' => 'OR',
                    array(
                        'key' => 'termine-start-date',
                        'value' => date("Y-m-d"),
                        'compare' => '>='
                    ),
                    array(
                        'key' => 'termine-end-date',
                        'value' => date("Y-m-d"),
                        'compare' => '>='
                    )
            ),
            'orderby' => 'meta_value',
            'order' => 'ASC',
            'meta_key' => 'termine-start-date',
        );

        $resultsReminder = new WP_Query($argsReminder);

        if ( $resultsReminder->have_posts() ) {
            ?>

            <div class="row">
                <div class="separator"></div>
            </div>
            <?php
            if(!wp_is_mobile()) {
                ?>
                <div class="row reminder-entry">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <p class="center-vertical">Datum/Uhrzeit</p>
                    </div>
                    <div class="col-lg-5">
                        <p class="center-vertical">Ort</p>
                    </div>
                    <div class="col-lg-4">
                        <p class="center-vertical">Info</p>
                    </div>
                </div>
                <?php
            } else {
                ?>
                <div class="row reminder-entry">
                    <div class="col-lg-12">
                        <p class="center-vertical">Aktuelle Termine</p>
                    </div>
                </div>
                <?php
            }
            ?>
            <div class="row">
                <div class="col-lg-12">
                    <div class="hr-line-purple"></div>
                </div>
            </div>
            <?php
            $counter = 3;
            if($resultsReminder->post_count < 3) {
                $counter = $resultsReminder->post_count;
            }

            for($i = $counter; $i>=0; $i--) {
                $resultsReminder->the_post();
                get_template_part('template-parts/post-formats/content', get_post_type());
            }

            if($resultsReminder->post_count > 3) {
                ?>

                <div class="row">
                    <div class="col-lg-12">
                        <a href="<?php echo get_site_url(); ?>/wahlkreis" class="all-reminder-link">Alle Termine
                            anzeigen</a>
                    </div>
                </div>

                <?php
            }
        } else {
            ?>
            <div class="row">
                <p>Zur Zeit stehen keine Termine an!</p>
            </div>

            <?php
        }
        wp_reset_query();
        ?>
    </div>
</div>

<div class="row">
    <div class="separator"></div>
</div>


<?php
$argsReden = array(
    'post_type' => 'reden',
    'posts_per_page' => 1,
    'orderby' => 'date',

);


$resultsReden = new WP_Query($argsReden);


while($resultsReden->have_posts()) {
    if($resultsReden->have_posts()) {
        $resultsReden->the_post();
        if(date_diff(new DateTime(get_the_date('d.m.Y')), new DateTime())->days <= 30) {?>
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <h1  class="section-heading">Die aktuellste Rede im Bundestag</h1>
                        <div class="custom-hr">
                            <span class="hr-left"></span>
                        </div>
                    </div>

                    <div class="row">
                        <p> <?php echo get_option('speech-information') ?></p>
                    </div>

                </div>
            </div>
            <?php
            get_template_part('template-parts/post-formats/content', get_post_type());
        }
    }
}
wp_reset_query();
?>

<div class="row">
    <div class="separator"></div>
</div>


<div class="row">
    <div class="col-lg-12">

        <?php
        $argsVideo = array(
            'post_type' => 'video',
            'posts_per_page' => 1,
            'orderby' => 'date'
        );

        $resultsVideo = new WP_Query($argsVideo);

        if( $resultsVideo->have_posts()) {
        $resultsVideo->the_post();

        $url = get_post_meta($post->ID, '_video_link_value_key', true);
        preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url, $matches);
        $id = $matches[1];
        ?>
        <div class="row">
            <p><?php the_content(); ?></p>
        </div>
        <div class="row">
            <?php
            if(isset($_SESSION['youtube-privacy'])) {
                ?>

                <h2 class="section-heading">Videos</h2>

                <div class="custom-hr">
                    <span class="hr-left"></span>
                </div>

                <div class="row">
                    <div class="separator"></div>
                </div>



                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8" style="text-align: center; margin-bottom: 5px;">
                        <h3><?php the_title(); ?></h3>
                    </div>
                    <div class="col-lg-2"></div>
                </div>



                <iframe width="1024" height="768" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                <?php
            } else {
            ?>
            <div style="width: 1024px; height: 768px; background: linear-gradient(to bottom, #000000, #afafaf); display: flex; justify-content: center; align-items: center"; ">
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
                <button onclick="setYoutubePrivacy()" style="border: none; cursor: pointer; border-radius: 5px; background-color: #E3000F; color: #fff;">Video anzeigen?</button>
            </p>
        </div>
    <?php
    }
    ?>
    </div>
    <?php
    } /*else {
        */?><!--
        <div class="row">
            <p>Zur Zeit sind leider keine Videos vorhanden.</p>
        </div>
        --><?php
/*    }*/
    wp_reset_query();
    ?>
</div>
</div>

<div class="row">
    <div class="separator"></div>
</div>