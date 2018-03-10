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

	if(is_page(55)) {

    } elseif(is_page(59)) { //Zur Person
        wp_enqueue_style( 'schieder-person', get_template_directory_uri() . '/css/subpages/schieder-zur-person.css', array(), '', 'all' );
    } elseif(is_page(67)) { //Service
        wp_enqueue_style( 'schieder-service', get_template_directory_uri() . '/css/subpages/schieder-service.css', array(), '', 'all' );
    } elseif(is_page(57)) { //Aktuelles

    } elseif(is_page(63)) { //Bundestag

    } elseif(is_page(61)) { //Wahlkreis
        wp_enqueue_style('schieder-wahlkreis', get_template_directory_uri() . '/css/subpages/schieder-wahlkreis.css', array(), '', 'all');
    }

    wp_enqueue_script( 'jquery' );
    wp_enqueue_script( 'bootstrapjs', get_template_directory_uri() . '/js/bootstrap/bootstrap.min.js', array(), '', true );
    wp_enqueue_script( 'customjs', get_template_directory_uri() . '/js/schieder.js', array(), '', true );

    wp_enqueue_style( 'bootstrapcss', get_template_directory_uri() . '/css/bootstrap/bootstrap.min.css', array(), '', 'all' );
    wp_enqueue_style( 'header', get_template_directory_uri() . '/css/header.css', array(), '', 'all' );
    wp_enqueue_style( 'schieder', get_template_directory_uri() . '/css/schieder.css', array(), '', 'all' );
    wp_enqueue_style( 'footer', get_template_directory_uri() . '/css/footer.css', array(), '', 'all' );

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
add_theme_support('custom-background');

add_theme_support( 'custom-header');
add_theme_support('post-thumbnails');

add_theme_support('post-formats', array('aside', 'image', 'gallery', 'status'));


/* Modify the read more link on the_excerpt() */

function et_excerpt_length($length) {
    return 220;
}
add_filter('excerpt_length', 'et_excerpt_length');

/* Add a link  to the end of our excerpt contained in a div for styling purposes and to break to a new line on the page.*/

function et_excerpt_more($more) {
    global $post;
    return '<div class="view-full-post"><a href="'. get_permalink($post->ID) . '" class="view-full-post-btn">(mehr lesen)</a></div>;';
}
add_filter('excerpt_more', 'et_excerpt_more');
