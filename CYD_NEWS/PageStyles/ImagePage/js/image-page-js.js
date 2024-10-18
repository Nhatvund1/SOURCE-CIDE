$(document).ready(function () {
    load_news();
});

var pageIndex = -1;

function load_news() {
    var catID = document.location.href.split('-').pop();
    pageIndex++;
    jQuery('.loading-img').show();
    jQuery.ajax({
        type: 'POST',
        url: '/Ajax.aspx/load_images',
        data: '{"cat_id":"' + catID + '","page_index":"' + pageIndex + '"}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (data) {
            jQuery('#img-list').append(data.d);
            jQuery('.loading-img').fadeOut();
        }
    });
}