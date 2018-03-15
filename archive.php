<?php get_header(); ?>
<link href=" <?php echo get_template_directory_uri() ?>/css/subpages/schieder-aktuelles.css" rel="stylesheet" type="text/css" />
<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">

        <div class="row">
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



            <div class="col-lg-3">

                <div class="row">
                    <div class="separator"></div>
                </div>

                <div class="row">
                    <input id="search" type="text" placeholder="Suche"/>
                    <a href="" class="fa fa-search"></a>
                </div>

                <div class="row">
                    <div class="separator"></div>
                </div>

                <div class="row">
                    <?php wp_list_categories( array(
                        "exclude" => "4, 15"
                    )); ?>
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

            <div class="col-lg-1"></div>
        </div>
    </div>
    <div class="col-lg-2"></div>
</div>

<?php
get_footer();