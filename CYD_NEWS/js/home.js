jQuery(document).ready(function () {
    jQuery("#owl-connect").owlCarousel({
        autoPlay: 3000,
        items: 5,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 3],
        pagination: false,
        stopOnHover: true,
        autoWidth: true
    });

    scroll_top();
})

function scroll_top() {
    var offset = $('#header').height() + 40,
    offset_opacity = 500,
    scroll_top_duration = 700,
    $back_to_top = $('.cd-top');
    $(window).scroll(function () {
        ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
        if ($(this).scrollTop() > offset_opacity) {
            $back_to_top.addClass('cd-fade-out');
        }
    });

    $back_to_top.on('click', function (event) {
        event.preventDefault();
        $('body,html').animate({
            scrollTop: 0,
        }, scroll_top_duration
        );
    });
}

var element = $('table');
$(table_res(element));

(function () {
    var cx = '017131449110437045140:rtzkmudy-ro';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
})();

$('#btn-search').click(function () {
    var search_text = $('#txt-search').val();
    sec_search(search_text)
});

$('#txt-search').keypress(function (e) {
    if (e.keyCode == 13) {
        sec_search($(this).val());
    }
});

$('#btn-search_mm').click(function () {
    var search_text = $('#txt-search_mm').val();
    sec_search(search_text);
});

$('#txt-search_mm').keypress(function (e) {
    if (e.keyCode == 13) {
        sec_search($(this).val());
    }
})

function sec_search(text) {
    $('#gsc-i-id1').val(text);
    $('.gsc-search-button').click();
};

$(".carousel-inner").swipe( {
    //Generic swipe handler for all directions
    swipeLeft:function(event, direction, distance, duration, fingerCount) {
        $(this).parent().carousel('next'); 
    },
    swipeRight: function() {
        $(this).parent().carousel('prev'); 
    },
    //Default is 75px, set to 0 for demo so any distance triggers swipe
    threshold:0
});