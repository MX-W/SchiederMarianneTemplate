<!doctype html>

<html>
<head>
	<meta charset="utf-8">
	<title>Schieder Marianne, MdB</title>

	<?php wp_head(); ?>
</head>

<?php

$css_classes = 'container-fluid';

?>
<body <?php body_class($css_classes) ?>>
<div id="header-image-container">
    <img id="header-image" src="<?php echo(get_template_directory_uri()); ?>/" alt="">
</div>


	<?php wp_nav_menu(array('theme_location' => 'header-menu', 'container_class' => 'menu-header')); ?>