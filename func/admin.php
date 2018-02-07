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
    add_submenu_page('options_template', 'Allgemeine Template Optionen', 'Design', 'manage_options', 'options_template', 'template_create_design_subpage');
    add_submenu_page('options_template', 'Template CSS Optionen', 'Custom CSS', 'manage_options', 'options_css', 'template_create_css_subpage');
}

add_action('admin_menu', 'template_add_admin_page');


function template_create_page() {

}


function template_create_design_subpage() {
    echo('<h1>Design</h1>');
}

function template_create_css_subpage() {
    echo('<h1>Custom CSS</h1>');
}
?>