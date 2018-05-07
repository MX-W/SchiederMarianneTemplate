function scrollEffectMenu() {
    jQuery(window).scroll(function(){
        if(jQuery(this).scrollTop() < 50) {
            jQuery( ".menu-header > .menu" ).css( "background-color", "rgba(255,255,255,.1)" );
            jQuery(".header-contact-section").removeClass("contact-scrolled");
        }
        if(jQuery(this).scrollTop() >= 50) {
            jQuery( ".menu-header > .menu" ).css( "background-color", "rgba(255,255,255,1)" );
            jQuery(".header-contact-section").addClass("contact-scrolled");
        }
    });
}

scrollEffectMenu();

/*
function setHeaderImageHeight()
{
    var wh = jQuery(window).height();
    jQuery('#header-image').attr('style', 'height:' + wh + 'px;');
}

setHeaderImageHeight();*/

