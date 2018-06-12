
function onReadMore(clicked_id) {

    var id = clicked_id;
    var open = "close";
    if(jQuery('#'+clicked_id).hasClass("open")) {
        open = "open";
    }

    jQuery.ajax({
        url: ReminderAjax.ajaxurl,
        type: 'post',
        data: {
            action: 'reminder_more',
            id: id,
            open: open
        },
        success: function (response) {
            document.getElementById(id).parentElement.innerHTML = response;
        }
    });

    //jQuery(".read-more").toggleClass("open");


}
