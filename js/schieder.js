function scrollEffectMenu() {
    jQuery(window).scroll(function(){
        console.log(jQuery(this).scrollTop())
        if(jQuery(this).scrollTop() < 100) {
            jQuery( ".menu-header > .menu" ).css( "background-color", "rgba(255,255,255,.1)" );
        }
        if(jQuery(this).scrollTop() >= 100) {
            jQuery( ".menu-header > .menu" ).css( "background-color", "rgba(255,255,255,1)" );
        }
    });
}

scrollEffectMenu();

function setHeaderImageHeight()
{
    var wh = jQuery(window).height();
    jQuery('#header-image').attr('style', 'height:' + wh + 'px;');
}

setHeaderImageHeight();