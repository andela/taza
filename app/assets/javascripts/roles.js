var check_all = function(){
    $('#check-all').on('click', function () {
        var checkboxes;
        $('.ra-error').html('');
        checkboxes = $('.check-box');
        return checkboxes.prop('checked', !checkboxes.prop('checked'));
    });
    return
};

$(document).ready(check_all);
$(document).on('page:load', check_all);