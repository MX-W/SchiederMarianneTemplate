<?php
if (!session_id()) {
    session_start();
}

if(is_front_page()):
	get_header('front');
else:
	get_header();
endif;

?>

<div id="cookies" class="cookies-alert" style="display:none">
    <p class="cookies-text">
        Um die Funktionalität der Website zu gewährleisten, verwendet diese Website Cookies. Wenn Sie diese Website in vollem Umfang nutzen wollen, stimmen Sie bitte der <a target="_blank" href="<?php echo home_url(); ?>/datenschutz">Datenschutzerklärung</a> zu. Welche Cookies gesetzt werden, können Sie dort entnehmen.
    </p>
    <div class="buttons">
        <button class="cookies-accept">Annehmen</button>
        <button class="cookies-decline">Ablehnen</button>
    </div>

</div>

<div class="row">

	<div class="col-lg-2"></div>
	<div class="col-lg-8 col-xs-12">
		<?php get_template_part('content'); ?>


<?php get_footer(); ?>
