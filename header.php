<!doctype html>

<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <title>Schieder Marianne, MdB</title>

        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <?php wp_head(); ?>
    </head>

    <?php

$css_classes = 'container-fluid';

    ?>
    <body <?php body_class($css_classes) ?>>
    <div class="header-container">

        <div class="row header-contact-section">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <p class="pull-left header-contact-text">
                    <b>Fragen? Büro Berlin: 030 / 227 - 72270 - Büro Wernberg: 09604 / 931 - 211</b>
                </p>
            </div>
            <div class="col-lg-1"></div>
        </div>

        <?php wp_nav_menu(array('theme_location' => 'header-menu', 'container_class' => 'menu-header')); ?>

    </div>
        <div class="row">
            <div class="placeholder"></div>
        </div>