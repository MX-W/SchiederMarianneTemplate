
<div class="row">
    <div class="separator"></div>
</div>

<div class="row">
    <div class="col-lg-8">
        <h2><?php the_title(); ?></h2>
    </div>

    <div class="col-lg-4"></div>

</div>
<div class="custom-hr">
    <span class="hr-left"></span>
</div>

<div class="row post-image-thumbnail">
		<?php the_post_thumbnail(); ?>
</div>

<div class="row">

	<div class="col-lg-12 post post-image-content justified">
		<?php //the_content('(mehr lesen)');
        the_excerpt();?>
	</div>

</div>

<div class="row">
    <div class="time">
        <?php the_time('d. F Y') ?>
    </div>
</div>

<hr>