<?php

require_once get_template_directory() . '/func/admin.php';
/*
 * ===========================
 *
 * Includes styles and scripts
 *
 * ===========================
 */
function template_script_enqueue() {


    wp_enqueue_script( 'jquery' );
    wp_enqueue_script( 'bootstrapjs', get_template_directory_uri() . '/js/bootstrap/bootstrap.min.js', array(), '', true );
    wp_enqueue_script( 'customjs', get_template_directory_uri() . '/js/schieder.js', array(), '', true );

    wp_enqueue_style( 'bootstrapcss', get_template_directory_uri() . '/css/bootstrap/bootstrap.min.css', array(), '', 'all' );
    wp_enqueue_style( 'header', get_template_directory_uri() . '/css/header.css', array(), '', 'all' );
    wp_enqueue_style( 'schieder', get_template_directory_uri() . '/css/schieder.css', array(), '', 'all' );
    wp_enqueue_style( 'footer', get_template_directory_uri() . '/css/footer.css', array(), '', 'all' );
    wp_enqueue_style('searchform', get_template_directory_uri() . '/css/search.css', array(), '', 'all');



	if(is_front_page()) {
        wp_enqueue_style( 'schieder-startseite', get_template_directory_uri() . '/css/subpages/schieder-startseite.css', array(), '', 'all' );
    } elseif(is_page(59)) { //Zur Person
        wp_enqueue_style( 'schieder-person', get_template_directory_uri() . '/css/subpages/schieder-zur-person.css', array(), '', 'all' );
    } elseif(is_page(67)) { //Service
        wp_enqueue_style( 'schieder-service', get_template_directory_uri() . '/css/subpages/schieder-service.css', array(), '', 'all' );
    } elseif(is_page(57)) { //Aktuelles
		wp_enqueue_style( 'schieder-aktuelles', get_template_directory_uri() . '/css/subpages/schieder-aktuelles.css', array(), '', 'all');
    } elseif(is_page(63)) { //Bundestag
        wp_enqueue_style('schieder-bundestag', get_template_directory_uri() . '/css/subpages/schieder-bundestag.css', array(), '', 'all');
    } elseif(is_page(61)) { //Wahlkreis
        wp_enqueue_style('schieder-wahlkreis', get_template_directory_uri() . '/css/subpages/schieder-wahlkreis.css', array(), '', 'all');
    } elseif(is_page(55)) {

    }
}

add_action('wp_enqueue_scripts', 'template_script_enqueue');


/*
 * ===========================
 *
 * Activate menus
 *
 * ===========================
 */
function navs_setup() {
    add_theme_support('menus');

    register_nav_menus(array(
		    'header-menu' => 'Hauptmenü, zur Hauptnavigation der Seite.',
			'footer-menu' => 'Footer menu. Am Ende der Seite lokalisiert für Nebeninformationen (Impressum...)'
		));
    /*register_nav_menu('secondary', 'Footer menu');*/
}

add_action('init', 'navs_setup');


/*
 * ===========================
 *
 * Add backend theme support
 *
 * ===========================
 */
//add_theme_support('custom-background');

add_theme_support( 'custom-header');
add_theme_support('post-thumbnails');

add_theme_support('post-formats', array('image','video'));



/* Thumbnails */
add_theme_support('post-thumbnails');
set_post_thumbnail_size(1024, 681);


function add_search_nav_item($items, $args) {
	if($args->theme_location == 'header-menu') {
		$items .= '<li class="menu-item"><a target="_blank" class="facebook-wrapper" href="https://www.facebook.com/MarianneSchieder/"><div class="fa fa-facebook fa-no-float menu-facebook"></div></a></li>';
		$items .= '<li id="search-item" class="menu-item">'. file_get_contents(__DIR__ . '/template-parts/searchform.php', true);
		return $items .= '</li>';

	} else {
		return $items;
	}

}
add_filter('wp_nav_menu_items','add_search_nav_item', 10, 2);
