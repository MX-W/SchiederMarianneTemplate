<?php

const REMINDER_SECURITY_STRING = 'reminder_Security';

/*require_once get_template_directory() . '/func/admin.php';*/

/*
 *
 *
 * Disable admin bar.
 *
 *
 */
add_filter( 'show_admin_bar', '__return_false' );




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
    wp_enqueue_script( 'readmore', get_template_directory_uri() . '/js/read_more_reminder.js', array('jquery'), '', true );
    wp_enqueue_script( 'cookiespopup', get_template_directory_uri() . '/js/cookies_alert.js', array(), '', true );

    wp_localize_script('readmore', 'ReminderAjax', array( 'ajaxurl' => admin_url('admin-ajax.php'), 'ajaxsecurity' => REMINDER_SECURITY_STRING));

    wp_enqueue_style( 'bootstrapcss', get_template_directory_uri() . '/css/bootstrap/bootstrap.min.css', array(), '', 'all' );
    wp_enqueue_style( 'header', get_template_directory_uri() . '/css/header.css', array(), '', 'all' );
    wp_enqueue_style( 'schieder', get_template_directory_uri() . '/css/schieder.css', array(), '', 'all' );
    wp_enqueue_style( 'footer', get_template_directory_uri() . '/css/footer.css', array(), '', 'all' );
    wp_enqueue_style('searchform', get_template_directory_uri() . '/css/search.css', array(), '', 'all');



	if(is_front_page()) {
        wp_enqueue_style( 'schieder-startseite', get_template_directory_uri() . '/css/subpages/schieder-startseite.css', array(), '', 'all' );
    } elseif(is_page('zur-person')) { //Zur Person
        wp_enqueue_style( 'schieder-person', get_template_directory_uri() . '/css/subpages/schieder-zur-person.css', array(), '', 'all' );
    } elseif(is_page('service')) { //Service
        wp_enqueue_style( 'schieder-service', get_template_directory_uri() . '/css/subpages/schieder-service.css', array(), '', 'all' );
    } elseif(is_page('aktuelles')) { //Aktuelles
		wp_enqueue_style( 'schieder-aktuelles', get_template_directory_uri() . '/css/subpages/schieder-aktuelles.css', array(), '', 'all');
    } elseif(is_page('bundestag')) { //Bundestag
        wp_enqueue_style('schieder-bundestag', get_template_directory_uri() . '/css/subpages/schieder-bundestag.css', array(), '', 'all');
    } elseif(is_page('wahlkreis')) { //Wahlkreis
        wp_enqueue_style('schieder-wahlkreis', get_template_directory_uri() . '/css/subpages/schieder-wahlkreis.css', array(), '', 'all');
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



/* Thumbnails */
add_theme_support('post-thumbnails');
set_post_thumbnail_size(1024, 681);


function add_search_nav_item($items, $args) {
	if($args->theme_location == 'header-menu') {
		$items .= '<li class="menu-item hide-menu"><a target="_blank" class="facebook-wrapper" href="https://www.facebook.com/MarianneSchieder/"><div class="fa fa-facebook fa-no-float menu-facebook"></div></a></li>';
		$items .= '<li id="search-item" class="menu-item hide-menu">'. file_get_contents(__DIR__ . '/template-parts/searchform-header.php', true);
		$items .= '</li>';
		/*$items .= '';*/

		return $items;

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
    echo '<input type="text" name="mx_w_video_link" id="mx_w_video_link" value="'. $value .'" size="20"/>';
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

if(is_admin()) {
	add_action('wp_ajax_reminder_more', 'reminder_more_callback');
	add_action('wp_ajax_nopriv_reminder_more', 'reminder_more_callback');
}

function reminder_more_callback() {
	//check_ajax_referer(REMINDER_SECURITY_STRING, 'security');

	$open = $_POST['open'];
	$content = '';

	$argsReminder = array(
		'post_type' => 'reminder',
		'posts_per_page' => 1,
		'p' => intval($_POST['id']),
	);

	$result = new WP_Query($argsReminder);
	if($result->have_posts()) {
		$result->the_post();
		$content = get_the_content();
	}


	if(str_word_count($content) > 15) {
        if (strcmp($open, 'close')) {
            //echo $content. '<p id="' .  $_POST["id"] . '" class="read-more-open open" onclick="onReadMore(this.id)"></p>';
            echo wp_trim_words($content, 15) . '<p id="' . $_POST["id"] . '" class="read-more" onclick="onReadMore(this.id)"></p>';
        } else {
            //echo wp_trim_words($content, 15) . '<p id="' .  $_POST["id"] . '" class="read-more" onclick="onReadMore(this.id)"></p>';;
            echo $content . '<p id="' . $_POST["id"] . '" class="read-more-open open" onclick="onReadMore(this.id)"></p>';
        }
    }

    exit;
}



function pagination($pages = '', $range = 2)
{
    $showitems = ($range * 2)+1;

    global $paged;
    if(empty($paged)) $paged = 1;

    if($pages == '')
    {
        global $wp_query;
        $pages = $wp_query->max_num_pages;
        if(!$pages)
        {
            $pages = 1;
        }
    }

    if(1 != $pages)
    {
        echo "<div class=\"pagination\"><span>Seite ".$paged." von ".$pages."</span>";
        if($paged > 2 && $paged > $range+1 && $showitems < $pages) echo "<a href='".get_pagenum_link(1)."'>&laquo; Erste</a>";
        if($paged > 1 && $showitems < $pages) echo "<a href='".get_pagenum_link($paged - 1)."'>&lsaquo; Vorherige</a>";

        for ($i=1; $i <= $pages; $i++)
        {
            if (1 != $pages &&( !($i >= $paged+$range+1 || $i <= $paged-$range-1) || $pages <= $showitems ))
            {
                echo ($paged == $i)? "<span class=\"current\">".$i."</span>":"<a href='".get_pagenum_link($i)."' class=\"inactive\">".$i."</a>";
            }
        }

        if ($paged < $pages && $showitems < $pages) echo "<a href=\"".get_pagenum_link($paged + 1)."\">Nächste &rsaquo;</a>";
        if ($paged < $pages-1 &&  $paged+$range-1 < $pages && $showitems < $pages) echo "<a href='".get_pagenum_link($pages)."'>Letzte &raquo;</a>";
        echo "</div>\n";
    }
}