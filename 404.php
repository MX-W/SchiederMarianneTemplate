<?php get_header(); ?>

<?php

global $query_string;
$search_query = array();
wp_parse_str( $query_string, $search_query );
$search = new WP_Query( $search_query );

?>

<link href=" <?php echo get_template_directory_uri() ?>/css/subpages/schieder-aktuelles.css" rel="stylesheet" type="text/css" />

<div class="row">
	<div class="col-lg-2"></div>
		<div class="col-lg-8">
		<div class="row">
			<div class="separator"></div>
		</div>

		<h1>Hoppla, Sie haben eine Seite aufgerufen, die nicht existiert.</h1>
		<h3>Suchen Sie doch nach den Inhalten, welche Sie gerne sehen möchten.</h3>

		<div class="row">
			<div class="col-lg-12">
                <?php require_once 'template-parts/searchform.php'?>
			</div>
		</div>
	</div>
	<div class="col-lg-2"></div>

</div>

<div class="row">
    <div class="separator"></div>
</div>

<?php get_footer(); ?>