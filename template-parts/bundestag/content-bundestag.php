<div class="row">
    <div class="col-lg-12">
        <?php
        $args = array(
           'cat' => 15,
        );

        $results = new WP_Query($args);

        if($results->have_posts()) {
            while($results->have_posts()) {
                $results->the_post();
                get_template_part('content', get_post_format());
            }
        }
        wp_reset_query();
        ?>
    </div>

</div>