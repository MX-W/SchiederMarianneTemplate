<div class="col-lg-3">

	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<?php include (__DIR__ . '/../searchform.php');?>
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

	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<p class="categories">Reden</p>
	</div>

	<div class="row">
		<a href="<?php echo get_post_type_archive_link( 'reden' ); ?>">Klicken Sie hier um alle Reden zu sehen.</a>
	</div>

	<div class="row">
		<div class="separator"></div>
	</div>

	<div class="row">
		<p class="categories">Videos</p>
	</div>

	<div class="row">
        <a href="<?php echo get_post_type_archive_link( 'video' ); ?>">Klicken Sie hier um alle Videos zu sehen.</a>
	</div>
</div>
