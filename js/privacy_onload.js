document.addEventListener('DOMContentLoaded', function() {

    function init()
    {
        var privacyAccepted = getCookie('privacy_accepted');

        if(privacyAccepted && privacyAccepted === 'true') {

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
        }
    }

    init();

});