<!doctype html>

<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <title>Schieder Marianne, MdB</title>

        <?php wp_head(); ?>
    </head>

    <?php

$css_classes = 'container-fluid';

    ?>
    <body <?php body_class($css_classes) ?>>
        <div class="row">
            <?php wp_nav_menu( array( 'theme_location' => 'header-menu', 'container_class' => 'menu-header' ) ); ?>
        </div>
        <div class="row">
            <div class="placeholder"></div>
        </div>