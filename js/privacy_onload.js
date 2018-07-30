document.ready = function() {
    var youtubePrivacy, mapsPrivacy = null;
    if(localStorage.getItem('youtube-privacy')) {
       youtubePrivacy = 'accepted';
    }
    if(localStorage.getItem('maps-privacy')) {
        mapsPrivacy = 'accepted';
    }

    jQuery.ajax({
        url: ReminderAjax.ajaxurl,
        type: 'post',
        data: {
            action: 'privacy',
            youtube: youtubePrivacy,
            maps: mapsPrivacy
        },
        success: function (response) {
        }
    });
};