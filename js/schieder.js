function scrollEffectMenu() {
    jQuery(window).scroll(function(){
        if(jQuery(this).scrollTop() < 50) {
            jQuery(".header-contact-section").removeClass("contact-scrolled");
        }
        if(jQuery(this).scrollTop() >= 50) {
            jQuery(".header-contact-section").addClass("contact-scrolled");
        }
    });
}

jQuery().ready(function() {
    if(jQuery(window).scrollTop() < 50)
    {
        jQuery(".header-contact-section").removeClass("contact-scrolled");
    }
    else if(jQuery(window).scrollTop() >= 50)
    {
        jQuery(".header-contact-section").addClass("contact-scrolled");
    }
    scrollEffectMenu();

});

function downloadImage()
{
    let fileName = document.getElementById('modal-image').dataset.id;
    window.open(params.baseUrl + '/download/' + fileName, '_blank');
}

function galleryImageClick(event)
{
    console.log(event);
    let normal = document.getElementById('modal-image');
    //var modalImage = jQuery('#modal-image');
    normal.src = event.target.src; // here assign the image to the modal when the user click the enlarge link
    normal.dataset.id = event.target.dataset.id;
}

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
        async: false,
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
        async: false,
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

/*
function cropVerticalImages() {
    var postImages = document.getElementsByClassName("wp-post-image");
    for(var i = 0; i<= postImages.length; i++) {
        if(postImages[i].clientHeight > postImages[i].clientWidth) {
            postImages[i] = new Image(postImages[i]);
            postImages[i] = getImagePortion(postImages[i], )
        }
    }
}*/

var isFirefox = typeof InstallTrigger !== 'undefined';

