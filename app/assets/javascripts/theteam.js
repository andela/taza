var toggle_bio = function(){
    $(".clickablephoto").click(function(){
        // Using http://api.jquery.com/attribute-starts-with-selector/
        var to_show_id = $(this).attr('id');
        var to_show = $('#bio' + to_show_id);
        var to_hide = $("p[id^='bio']:visible");
        if(to_hide.length > 0) {
            if ('bio'+to_show_id == to_hide.attr('id')) {
                to_hide.hide();
            } else {
                to_hide.hide({
                    duration: 0.1,
                    complete: function () {
                        to_show.show();
                    }
                });
            }
        } else {
            to_show.show();
        }
    });
};

$(document).ready(toggle_bio);
$(document).on('page:load', toggle_bio);
