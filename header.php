<?php
/**
 * Created by PhpStorm.
 * User: Max
 * Date: 04.01.2018
 * Time: 19:50
 */
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Marianne Schieder, MdB</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Work+Sans:800" rel="stylesheet">

        <link rel="icon" type="image/vnd.microsoft.icon" href="<?php echo get_bloginfo('template_directory'); ?>/favicon.ico">

        <link rel="stylesheet" href="<?php echo get_bloginfo('template_directory'); ?>/css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="<?php echo get_bloginfo('template_directory'); ?>/style.css">
        <?php wp_head(); ?>
    </head>
    <body>
        <header>
            <img class="background-home" src="<?php echo get_bloginfo('template_directory'); ?>/images/kuppel_bundestag-g.png"/>
                <ul class="nav mynav">
                     <li class="nav-item first-item" >
                        <img id="menu-logo" src="<?php echo get_bloginfo('template_directory'); ?>/images/spd-logo-75x75.png"/>
                        <a class="nav-link" href="<?php echo get_bloginfo( 'wpurl' );?>">
                            Marianne Schieder MdB
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link active">
                            Aktuelles
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link">
                            Zur Person
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link">
                            Wahlkreis
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link">
                            Bundestag
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link">
                            Fotos
                        </a>
                     </li>
                     <li class="nav-item">
                         <a class="nav-link">
                             Kontakt
                         </a>
                     </li>
                 </ul>
        </header>
        <div class="clearfix"></div>