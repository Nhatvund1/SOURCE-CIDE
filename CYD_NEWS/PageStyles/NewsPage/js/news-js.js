﻿$(document).ready(function () {
    load_news();
});

var pageIndex = -1;

function load_news() {
    var catID = document.location.href.split('-').pop();
    pageIndex++;
    jQuery('#loading').show();
    jQuery.ajax({
        type: 'POST',
        url: '/Ajax.aspx/load_news',
        data: '{"cat_id":"' + catID + '","page_index":"' + pageIndex + '"}',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (data) {
            jQuery('#home-category').append(data.d);
            jQuery('#loading').fadeOut();
        }
    });
}