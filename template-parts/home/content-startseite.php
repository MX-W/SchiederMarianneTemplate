

<div class="row">
    <div class="placeholder"></div>
</div>

<!--<div class="row">
    <div class="slideshow-container">
        <img class="slide fade" src="/img/slideshow/1.jpg"/>
    </div>
</div>-->

<?php
    $args = array(
        'post_type' => 'reden',
        'posts_per_page' => 1,
        'orderby' => 'date',

    );


    $results = new WP_Query($args);


    while($results->have_posts()) {
        if($results->have_posts()) {
            $results->the_post();
            if(date_diff(new DateTime(get_the_date('d.m.Y')), new DateTime())->days <= 30) {?>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <h1  class="section-heading">Die letzte Rede im Bundestag</h1>
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
                get_template_part('template-parts/post-formats/reden');
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
        <div class="row">
            <h1  class="section-heading">Termine</h1>
            <div class="custom-hr">
                <span class="hr-left"></span>
            </div>
        </div>
        <?php $args = array(
	        'post_type' => 'reminder',
	        'posts_per_page' => 3,
            'meta_query' => array (
                array(
                    'key' => 'simdiaw-start-date',
                    'value' => date("Y-m-d"),
                    'compare' => '>='
                )
            ),
            'orderby' => 'meta_value',
            'order' => 'ASC',
            'meta_key' => 'simdiaw-start-date',
        );

        $results = new WP_Query($args);

        if ( $results->have_posts() ) {
            ?>
            <div class="row">
                <p>Hier sehen Sie demnächst anstehende Termine.</p>
            </div>
        <?php
            while($results->have_posts()) {
		        $results->the_post();
                get_template_part('template-parts/post-formats/reminder');
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

<div class="separator"></div>


<div class="row">
    <div class="col-lg-12">

        <h2 class="section-heading">Videos</h2>

        <div class="custom-hr">
            <span class="hr-left"></span>
        </div>

        <?php
            $argsVideo = array(
                'post_type' => 'video',
                'posts_per_page' => 1,
                'orderby' => 'date'
            );

            $resultsVideo = new WP_Query($argsVideo);

            if( $resultsVideo->have_posts()) {
                while($resultsVideo->have_posts()) {
                    $resultsVideo->the_post();

                    $url = get_post_meta($post->ID, '_video_link_value_key', true);
                    preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url, $matches);
                    $id = $matches[1];
                    ?>
                    <div class="row">
                        <p><?php the_content(); ?></p>
                    </div>
                    <div class="row">
                        <iframe width="1024" height="768" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
                    </div>
                    <?php
                }
            } else {
              ?>
                <div class="row">
                    <p>Zur Zeit sind leider keine Videos vorhanden.</p>
                </div>
        <?php
            }
        ?>
        <!--<div width="1024" height="768">Hier könnte Ihr Video stehen!</div>-->
    </div>
</div>

<div class="row">
    <div class="placeholder"></div>
</div>