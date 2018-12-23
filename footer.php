

</div>
<div class="col-lg-2"></div>
</div>
<?php
if(!wp_is_mobile()) {
?>
<div class="row footer-container">
    <?php
    } else {
    ?>
    <div class="row footer-container" style="margin-right: -20px; margin-left: -20px;">
        <?php
        }
        ?>
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <?php wp_nav_menu( array( 'theme_location' => 'footer-menu', 'container_class' => 'menu-footer' ) ); ?>
        </div>
        <div class="col-lg-2"></div>
    </div>



    <?php wp_footer(); ?>

    </body>
    </html>