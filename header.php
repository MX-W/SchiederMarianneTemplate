<!doctype html>

<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <meta name="description" content="Auf dieser Webseite können Sie Informationen über die Bundestagsabgeordnete
        Marianne Schieder erfahren. Es werden aktuelle Termine und etwaige Bundestagsreden oder Videos präsentiert, sowie
        die Funktionen im Bundestag und die Möglichkeit der Kontaktaufnahme gewährleistet." />

        <title>Schieder Marianne, MdB</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="<?php echo get_stylesheet_directory_uri(); ?>/img/favicon.ico" />

        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>

        <?php wp_head(); ?>
    </head>

    <?php

$css_classes = 'container-fluid';

    ?>
    <body <?php body_class($css_classes) ?>>
    <div class="header-container">

        <?php
        if(!wp_is_mobile()) {
            ?>
            <div class="row header-contact-section">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <p class="pull-left header-contact-text">
                        <b>Sie haben Fragen? Rufen Sie gerne an! Büro Berlin: 030 / 227 - 72270 - Büro Wernberg: 09604 /
                            931 211</b>
                    </p>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <?php
        }
        ?>

        <div class="row menu-container">
            <div class="col-lg-2"></div>
            <div class="col-lg-10 col-sm-8 col-s-8">
                <a href="javascript:void(0);" class="icon" onclick="responsiveNav()">
                    <i class="fa fa-bars"></i>
                </a>
                <?php wp_nav_menu(array('theme_location' => 'header-menu', 'container_class' => 'menu-header')); ?>
            </div>
            <div class="col-sm-2 col-s-2"></div>
        </div>



    </div>
        <div class="row">
            <div class="placeholder"></div>
        </div>
    <div class="row">
        <div class="separator"></div>
    </div>