function table_res(element) {
    element.removeAttr('border cellpadding style cellspacing');
    element.addClass('table table-bordered');
    element.wrap('<div class="table-responsive"></div>')
}