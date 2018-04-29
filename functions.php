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

add_theme_support('post-formats', array('image',));



/* Thumbnails */
add_theme_support('post-thumbnails');
set_post_thumbnail_size(1024, 681);


function add_search_nav_item($items, $args) {
	if($args->theme_location == 'header-menu') {
		$items .= '<li class="menu-item"><a target="_blank" class="facebook-wrapper" href="https://www.facebook.com/MarianneSchieder/"><div class="fa fa-facebook fa-no-float menu-facebook"></div></a></li>';
		$items .= '<li id="search-item" class="menu-item">'. file_get_contents(__DIR__ . '/template-parts/searchform-header.php', true);
		return $items .= '</li>';

	} else {
		return $items;
	}

}
add_filter('wp_nav_menu_items','add_search_nav_item', 10, 2);





/* Custom Post Type VIDEO       slug= ' video ' */





/*
 * Register the post type.
 */
function mx_w_video_format_add_custom_post_type() {

    $labels = array(
        'name' => 'Video',
        'singular_name' => 'Video',
        'add_new' => 'Erstellen',
        'add_new_item' => 'Neues Video erstellen',
        'edit_item' => 'Bearbeiten',
        'new_item' => 'Neues Video',
        'view_item' => 'Anzeigen',
        'search_item' => 'Durchsuchen',
        'not_found' => 'Keine Videos gefunden.',
        'not_found_in_trash' => 'Keine Videos im Papierkorb gefunden.',
        'parent_item_colon' => 'Übergeordnetes Video'
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'has_archive' => true,
        'publicly_queryable' => true,
        'query_var' => true,
        'rewrite' => array( 'slug', 'video'),
        'capability_type' => 'post',
        'hierarchical' => false,
        'supports' => array(
            'title',
            'editor',
        ),
        'menu_position' => 4,
        'menu_icon' => 'dashicons-video-alt3',
        'exclude_from_search' => false,

    );

    register_post_type( 'video', $args);
    /*unregister_post_type('video');*/
}

/*
 * action to add the custom post type
 */
add_action('init', 'mx_w_video_format_add_custom_post_type');


add_action( 'admin_enqueue_scripts', 'my_admin_enqueue_scripts' );
function my_admin_enqueue_scripts() {
    if ( 'video' == get_post_type() )
        wp_dequeue_script( 'autosave' );
}



/*
 * register a meta box over add_meta_box().
 */
function mx_w_video_format_add_meta_box() {
    add_meta_box('video_link', 'Link des Videos', 'mw_w_video_format_link_callback', 'video', 'side');
}

/*
 * Callback for creating the meta box. echo the input fields and all stuff.
 */
function mw_w_video_format_link_callback( $post ) {
    wp_nonce_field('mx_w_save_link_data' , 'mx_w_link_meta_box_nonce');

    $value = get_post_meta($post->ID, '_video_link_value_key', true);

    echo '<label for="mx_w_video_link">Youtube-Link: </label>';
    echo '<input type="text" name="mx_w_video_link" id="mx_w_video_link" value="'. $value .'" size="55"/>';
}

//add action for adding meta boxes
add_action('add_meta_boxes', 'mx_w_video_format_add_meta_box' );

/*
 * Saving the field of a meta box into the database.
 */
function mx_w_save_link_data( $post_id ) {
    if(!isset( $_POST['mx_w_link_meta_box_nonce'] )) {
        return;
    }

    if(!wp_verify_nonce($_POST['mx_w_link_meta_box_nonce'], 'mx_w_save_link_data')) {
        return;
    }

    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) {
        return;
    }

    if(!current_user_can('edit_post', $post_id)) {
        return;
    }

    if( !isset($_POST['mx_w_video_link'])) {
        return;
    }

    $data = sanitize_text_field($_POST['mx_w_video_link']);

    print_r($_POST['mx_w_video_link']);

    update_post_meta($post_id, '_video_link_value_key', $data);
}

//add action for saving post
add_action('save_post', 'mx_w_save_link_data');





/* Custom Post Type SPEECHES.       slug= ' reden ' */





/*
 * Register the post type.
 */
function mx_w_speeches_format_add_custom_post_type() {

    $labels = array(
        'name' => 'Reden',
        'singular_name' => 'Rede',
        'add_new' => 'Erstellen',
        'add_new_item' => 'Neue Rede erstellen',
        'edit_item' => 'Bearbeiten',
        'new_item' => 'Neue Rede',
        'view_item' => 'Anzeigen',
        'search_item' => 'Durchsuchen',
        'not_found' => 'Keine Reden gefunden.',
        'not_found_in_trash' => 'Keine Reden im Papierkorb gefunden.',
        'parent_item_colon' => 'Übergeordnete Rede'
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'has_archive' => true,
        'publicly_queryable' => true,
        'query_var' => true,
        'rewrite' => array( 'slug', 'reden'),
        'capability_type' => 'post',
        'hierarchical' => false,
        'supports' => array(
            'title',
            'editor',
            'categories',
        ),
        'menu_position' => 4,
        'menu_icon' => 'dashicons-format-status',
        'exclude_from_search' => false,

    );

    register_post_type( 'reden', $args);
}

/*
 * action to add the custom post type
 */
add_action('init', 'mx_w_speeches_format_add_custom_post_type');