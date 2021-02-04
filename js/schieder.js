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
    setCookie('privacy_accepted', true, 90);
    location.reload();
}

function setMapsPrivacy() {
    setCookie('privacy_accepted', true, 90);
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

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + "";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return null;
}

var isFirefox = typeof InstallTrigger !== 'undefined';

