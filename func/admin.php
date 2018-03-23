<?php
/**
 *  ================
 *    Admin Page
 *  ================
 *
 *
 * Created by PhpStorm.
 * User: Max
 * Date: 03.02.2018
 * Time: 21:42
 */


function template_add_admin_page() {

    //Generate general settings page
    add_menu_page('Allgemeine Template Optionen', 'Template Optionen', 'manage_options', 'options_template', 'template_create_page', 'dashicons-admin-generic', '110');

    //Generate gerneral settings sub pages
    add_submenu_page('options_template', 'Allgemeine Template Optionen', 'Youtube', 'manage_options', 'options_template', 'template_create_youtube_subpage');
    add_submenu_page('options_template', 'Template CSS Optionen', 'Custom CSS', 'manage_options', 'options_css', 'template_create_css_subpage');

    add_action('admin_init', 'template_custom_settings');
}

add_action('admin_menu', 'template_add_admin_page');


function template_create_page() {

}

function template_custom_settings() {
    register_setting('youtube-group', 'youtube-link');
    register_setting('youtube-group', 'youtube-text');
    register_setting('speech-group', 'speech-information');

    add_settings_section('youtube-video-options', 'Youtube-Video', 'youtube_video_options', 'options_template');
    add_settings_section('speech-information-options', 'Aktuellste Rede', 'speech_information_options', 'options_template');

    add_settings_field('video-link', 'Link zum Video', 'youtube_video_link', 'options_template', 'youtube-video-options');
    add_settings_field('video-text', 'Text über dem Video', 'youtube_video_text', 'options_template', 'youtube-video-options');
    add_settings_field('speech-information', 'Informationen zur aktuellsten Rede von Marianne', 'speech_information', 'options_template', 'speech-information-options');
}

function speech_information() {
	$speechInformation = get_option('speech-information');
	echo '<input name="speech-information" type="text" value="'. $speechInformation .'"/>';
}

function youtube_video_link() {
    $youtubeLink = get_option('youtube-link');
    echo '<input type="text" name="youtube-link" value="'. $youtubeLink .'"/>';
}

function youtube_video_text() {
    $youtubeText = get_option('youtube-text');
    echo '<input type="text" name="youtube-text"  value="'. $youtubeText .'"/>';
}

function youtube_video_options() {
    echo 'Ändern Sie den Video-Link, sowie den zugehörigen Informationstext zu dem Video auf der Startseite.';
}

function speech_information_options() {
	echo 'Tragen Sie hier Zusatzinformationen über die auf der Startseite angezeigte Rede an. Z. B. Thema oder ähnliches';
}


function template_create_youtube_subpage() {
    require_once 'templates/admin-frontpage.php';
}

function template_create_css_subpage() {
    echo('<h1>Custom CSS</h1>');
}
?>