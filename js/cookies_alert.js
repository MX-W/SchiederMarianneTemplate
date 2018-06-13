function popUp(hideOrShow) {
    if(hideOrShow === 'hide') {
        jQuery('#cookies').toggleClass('fade-on-click');
        setTimeout(function(){ document.getElementById('cookies').style.display = "none"; }, 600);
    } else if(sessionStorage.getItem("popupWasShown") == null) {
        sessionStorage.setItem("popupWasShown",1);
        document.getElementById('cookies').removeAttribute('style');
    }
}

window.onload = function() {
    setTimeout(function() {
        popUp('show');
    }, 0);
};

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
    return "";
}