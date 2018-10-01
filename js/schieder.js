function scrollEffectMenu() {
    jQuery(window).scroll(function(){
        if(jQuery(this).scrollTop() < 50) {
            jQuery( ".menu-container" ).css( "background-color", "rgba(255,255,255,.1)" );
            jQuery(".header-contact-section").removeClass("contact-scrolled");
        }
        if(jQuery(this).scrollTop() >= 50) {
            jQuery( ".menu-container" ).css( "background-color", "rgba(255,255,255,1)" );
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

function responsiveNav() {
    jQuery("#menu-hauptmenue > .menu-item").toggleClass("show-menu");
    jQuery("#menu-hauptmenue > .menu-item").toggleClass("hide-menu");
    jQuery(".menu-item:first-child").toggleClass("menu-shown");
}

function setYoutubePrivacy() {
    window.localStorage.setItem('youtube-privacy', 'accepted');
    jQuery.ajax({
        url: ReminderAjax.ajaxurl,
        type: 'post',
        data: {
            action: 'youtube_privacy',
            youtube: 'accepted',
        },
        success: function (response) {
        }
    });
    location.reload();
}

function setMapsPrivacy() {
    window.localStorage.setItem('maps-privacy', 'accepted');
    jQuery.ajax({
        url: ReminderAjax.ajaxurl,
        type: 'post',
        data: {
            action: 'maps_privacy',
            maps: 'accepted'
        },
        success: function (response) {
        }
    });
    location.reload();
}