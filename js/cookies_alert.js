document.addEventListener('DOMContentLoaded', function() {
    var _cookieNotice = document.querySelector('#cookies');
    var _cookieAccept = _cookieNotice.querySelector('.cookies-accept');
    var _cookieDecline = _cookieNotice.querySelector('.cookies-decline');
    var privacyCookie = getCookie('privacy_accepted');

    function init()
    {
        if(!privacyCookie)
        {
            _cookieNotice.style.display = 'block';
        }

        if(_cookieDecline)
        {
            _cookieDecline.addEventListener('click', cookieDeclinePressed);
            _cookieDecline.addEventListener('touch', cookieDeclinePressed);
        }

        if(_cookieAccept)
        {
            _cookieAccept.addEventListener('click', cookieAcceptPressed);
            _cookieAccept.addEventListener('touch', cookieAcceptPressed);
        }
    }

    function cookieDeclinePressed(e)
    {
        setCookie('privacy_accepted', false, 90);
        jQuery('#cookies').toggleClass('fade-on-click');
        setTimeout(function(){ document.getElementById('cookies').style.display = "none"; }, 600);
    }

    function cookieAcceptPressed(e)
    {
        setCookie('privacy_accepted', true, 90);
        jQuery('#cookies').toggleClass('fade-on-click');
        setTimeout(function(){ document.getElementById('cookies').style.display = "none"; }, 600);
        location.reload();
    }

    init();
});