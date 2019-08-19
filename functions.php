<?php
session_start();
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


if (!function_exists('write_log')) {

	function write_log($log) {
		if (true === WP_DEBUG) {
			if (is_array($log) || is_object($log)) {
				error_log(print_r($log, true));
			} else {
				error_log($log);
			}
		}
	}

}

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
    wp_enqueue_script( 'privacyonload', get_template_directory_uri() . '/js/privacy_onload.js', array(), '', false );

    wp_localize_script('readmore', 'ReminderAjax', array( 'ajaxurl' => admin_url('admin-ajax.php'), 'ajaxsecurity' => REMINDER_SECURITY_STRING));
    wp_localize_script('privacyonload', 'ReminderAjax', array( 'ajaxurl' => admin_url('admin-ajax.php')));
    wp_localize_script('customjs', 'params', array( 'baseUrl' => home_url()));

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
 * Adding a second thumbnail option
 *
 * ===========================
 */
if (class_exists('MultiPostThumbnails')) {

    new MultiPostThumbnails(array(
        'label' => 'Bild Startseite',
        'id' => 'secondary-image',
        'post_type' => 'post'
    ) );

}


/*
 * ===========================
 *
 * Add posts to search query
 *
 * ===========================
 */
add_filter( 'pre_get_posts', 'add_post_types_to_search_query' );
/**
 * This function modifies the main WordPress query to include an array of
 * post types instead of the default 'post' post type.
 *
 * @param object $query  The original query.
 * @return object $query The amended query.
 */
function add_post_types_to_search_query( $query ) {

    if ( $query->is_search ) {
        $query->set( 'post_type', array( 'post', 'reden', 'reminder', 'video' ) );
    }

    return $query;

}


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
		$items .= '<li class="menu-item hide-menu"><a target="_blank" class="facebook-wrapper" href="https://www.spd.de"><img src="/img/spd-logo-75x75.png" class="menu-spd"></div></a></li>';
		$items .= '<li id="search-item" class="menu-item hide-menu">'. file_get_contents(__DIR__ . '/template-parts/searchform-header.php', true);
		$items .= '</li>';
		/*$items .= '';*/

		return $items;

	} else if($args->theme_location == 'footer-menu') {
        $oldItems = $items;
        $items = '<li class="menu-item"><p>CC-BY-SA Marianne Schieder, MdB</p></li>';
        $items .= $oldItems;
        $items .= '<li class="menu-item"><a class="footer-link" target="_blank" href="https://www.spdfraktion.de/"><span class="menu-image-title">SPD-Bundestagsfraktion</span></a></li>';
        $items .= '<li class="menu-item"><a class="footer-link" target="_blank" href="https://spd-landesgruppe-bayern.de/"><span class="menu-image-title">SPD-Landesgruppe Bayern</span></a></li>';
        $items .= '<li class="menu-item"><a class="footer-link" target="_blank" href="https://www.kuppelkucker.de/start/"><span class="menu-image-title">Der Bundestag für Kinder</span></a></li>';
        $items .= '<li class="menu-item"><a class="footer-link" target="_blank" href="https://www.vorwaerts.de/"><span class="menu-image-title">vorwärts-Verlag</span></a></li>';
        $items .= '<li class="menu-item"><a class="footer-link" target="_blank" href="https://www.bdkj-kinderzeltlager.de/"><span class="menu-image-title">BDKJ-Kinderzeltlager</span></a></li>';
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
	add_action('wp_ajax_youtube_privacy', 'privacy_youtube_callback');
	add_action('wp_ajax_nopriv_youtube_privacy', 'privacy_youtube_callback');
	add_action('wp_ajax_maps_privacy', 'privacy_maps_callback');
	add_action('wp_ajax_nopriv_maps_privacy', 'privacy_maps_callback');
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

    if (strcmp($open, 'close')) {
        //echo $content. '<p id="' .  $_POST["id"] . '" class="read-more-open open" onclick="onReadMore(this.id)"></p>';
        echo wp_trim_words($content, 15);
    } else {
        //echo wp_trim_words($content, 15) . '<p id="' .  $_POST["id"] . '" class="read-more" onclick="onReadMore(this.id)"></p>';;
        echo $content;
    }

    exit;
}

function privacy_youtube_callback() {
    $_SESSION['youtube-privacy'] = $_POST['youtube'];
}

function privacy_maps_callback() {
    $_SESSION['maps-privacy'] = $_POST['maps'];
}

function pagination($pages = '', $range = 1)
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



/*
 *
 * Contact form post action
 *
 *
 * */

/*add_action('admin_post_nopriv_contact_form', 'contact_form_callback');
add_action('admin_post_contact_form', 'contact_form_callback');

function contact_form_callback() {
    global $response;
    $response = "";

//response messages
    $not_human       = "Bitte füllen Sie das reCaptcha aus.";
    $missing_content = "Bitte füllen Sie alle Felder mit * aus";
    $email_invalid   = "Sie haben keine korrekte E-Mail Adresse eingegeben";
    $message_unsent  = "Nachricht konnte nicht versendet werden, bitte versuchen Sie es erneut.";
    $message_sent    = "Vielen Dank! Ihre Nachricht wurde gesendet.";

//user posted variables
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['text'];
    $subject = $_POST['subject'];

//php mailer variables
    $to = "wendl.max@gmail.com";
    $headers = 'From: '. $email . "\r\n" .
        'Reply-To: ' . $email . "\r\n";


    if(empty($name) || empty($message) || empty($subject) || empty($email)){
        my_contact_form_generate_response("error", $missing_content);
    } elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        my_contact_form_generate_response("error", $email_invalid);
    } else {
        $sent = wp_mail($to, $subject, strip_tags($message), $headers);
        if($sent) my_contact_form_generate_response("success", $message_sent); //message sent!
        else my_contact_form_generate_response("error", $message_unsent); //message wasn't sent
    }

    wp_redirect('https://localhost/wordpress/service');
}

function my_contact_form_generate_response($type, $message){

    global $response;

    if($type == "success") $response = "<div class='success'>{$message}</div>";
    else $response = "<div class='error'>{$message}</div>";

}*/