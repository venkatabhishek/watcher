
$(document).ready(function() {

    // scroll wheel move horizontal
    $.fn.hScroll = function(amount) {
        amount = amount || 120;
        $(this).bind('DOMMouseScroll mousewheel', function(event) {
            var direction, oEvent, position;
            oEvent = event.originalEvent;
            direction = oEvent.detail ? oEvent.detail * -amount : oEvent.wheelDelta;
            position = $(this).scrollLeft();
            position += direction > 0 ? -amount : amount;
            $(this).scrollLeft(position);
            event.preventDefault();
        });
    };

    $(".large-wrapper").hScroll(60);
})



