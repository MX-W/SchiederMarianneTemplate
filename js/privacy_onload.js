document.ready = function() {
    if(window.localStorage.getItem('youtube-privacy')) {
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
    }
    if(window.localStorage.getItem('maps-privacy')) {
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
};