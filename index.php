<?php

if(is_front_page()):
	get_header('front');
else:
	get_header();
endif;

?>

<div id="cookies" class="cookies-alert" style="display:none">
    <p class="cookies-text">
        Um die Funktionalität der Website zu gewährleisten, verwendet diese Website Cookies.
    </p>
    <button onclick="popUp('hide')" class="cookies-ok">Ok</button>
    <a class="cookies-datenschutz" href="<?php echo home_url(); ?>/datenschutzerklaerung">Datenschutzerklärung</a>
</div>

<div class="row">

	<div class="col-lg-2"></div>
	<div class="col-lg-8 col-xs-12">
		<?php get_template_part('content'); ?>


<?php get_footer(); ?>
