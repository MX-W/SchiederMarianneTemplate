
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
            if(response !== "") {
                document.getElementById('reminder-content').innerHTML = response;
                if(open.localeCompare("open") === -1) {
                    document.getElementById(clicked_id).classList.remove("read-more");
                    document.getElementById(clicked_id).classList.add("read-more-open", "open");
                } else {
                    document.getElementById(clicked_id).classList.remove("read-more-open", "open");
                    document.getElementById(clicked_id).classList.add("read-more");
                }
            }
        }
    });

}
