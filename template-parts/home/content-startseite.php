

<div class="row">
    <div class="placeholder"></div>
</div>

<?php
    $args = array(
        'post_type' => 'post',
        'posts_per_page' => 1,
        'category_name' => 'reden',
        'orderby' => 'date',

    );


    $results = new WP_Query($args);


    while($results->have_posts()) {
        if($results->have_posts()) {
            $results->the_post();
            if(date_diff(new DateTime(get_the_date('d.m.Y')), new DateTime())->days <= 30) {
                get_template_part('content', get_post_format());
            }
        }
    }
    wp_reset_query();
?>


<div class="row">
    <div class="col-lg-12">
        <h3><?php get_option('youtube-text'); ?></h3>
        <?php
        $url = get_option('youtube-link');
        preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url, $matches);
        $id = $matches[1];
        ?>
        <iframe width="1024" height="768" src="https://www.youtube-nocookie.com/embed/<?php echo $id; ?>?rel=0&amp;showinfo=1" frameborder="0" allow="encrypted-media" allowfullscreen></iframe>
    </div>
</div>

<div class="row">
    <div class="placeholder"></div>
</div>