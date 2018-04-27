<?php get_header(); ?>
<?php
$postType = get_post_type();

?>

<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">

        <div class="row">
<?php

if( strcmp($postType, 'post') === 0) {                    //  If the post type is not speeches, do this

    ?>

    <link href=" <?php echo get_template_directory_uri() ?>/css/subpages/schieder-aktuelles.css" rel="stylesheet" type="text/css" />

                <div class="col-lg-8">

                    <?php
                    if(have_posts()) {
                        while(have_posts()) {
                            the_post();
                            get_template_part( 'content', get_post_format() );
                        }
                    }
                    ?>
                </div>


                <div class="col-lg-1"></div>
                <div class="col-lg-3">

                    <div class="row">
                        <div class="separator"></div>
                    </div>

                    <div class="row">
		                <?php include (__DIR__ . '/template-parts/searchform.php');?>
                    </div>

                    <div class="row">
                        <div class="separator"></div>
                    </div>

                    <div class="row">
                        <?php wp_list_categories(); ?>
                    </div>

                    <div class="row">
                        <div class="separator"></div>
                    </div>

                    <div class="row">
                        <p class="categories">Archiv</p>
                    </div>

                    <div class="row">
                        <select id="archive-select" onchange="document.location.href=this.options[this.selectedIndex].value;">
                            <option value="" hidden>Bitte Auswählen</option>
                            <?php wp_get_archives( array(
                                'type' => 'monthly',
                                'format' => 'option'
                            )); ?>
                        </select>
                    </div>
                </div>

<?php
} elseif( strcmp($postType,'reminder') === 0) {
?>

    <div class="col-lg-12">
        <?php
        if(have_posts()) {
            while(have_posts()) {
                the_post();
                get_template_part( 'template-parts/post-formats/reminder');
            }
        }
        ?>
    </div>

<?php
} elseif( strcmp($postType, 'reden') === 0) {                                 //  This gets executed if the post type is speeches



?>
                <div class="col-lg-12">

                    <?php
                    if(have_posts()) {
                        while(have_posts()) {
                            the_post();
                            get_template_part( 'template-parts/post-formats/reden');
                        }
                    }
                    ?>
                </div>

<?php
} else {
?>

    <div class="col-lg-12">
        <p>Falscher Post-Typ!</p>
    </div>

<?php
}
?>
    </div>
    </div>
    <div class="col-lg-2"></div>
</div>

<?php
get_footer();