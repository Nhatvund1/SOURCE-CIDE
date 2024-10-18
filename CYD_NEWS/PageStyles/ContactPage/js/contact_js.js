function send_c() {
    var full_name = $('#txtFullName').val();
    var email = $('#txtEmail').val();
    var phone = $('#txtPhone').val();
    var subject = $('#txtSubject').val();
    var content = $('#txtContent').val();
    if (full_name.trim() == '') {
        alert('Vui lòng nhập tên người liên hệ.');
        return;
    }
    if (phone.trim() == '') {
        alert('Vui lòng nhập số điện thoại.');
        return;
    }
    if (subject.trim() == '') {
        alert('Vui lòng nhập chủ đề.');
        return;
    }
    if (content.trim() == '') {
        alert('Vui lòng nhập nội dung liên hệ.');
        return;
    }
    if (email.trim() != '') {
        if (!validateEmail(email)) {
            alert('Email không hợp lệ, vui lòng kiểm tra lại');
            return;
        }
    }
    jQuery.ajax({
        type: "POST",
        url: "/Ajax.aspx/insertContact",
        data: '{"fullName":"' + full_name + '","email":"' + email + '","phone":"' + phone + '","subject":"' + subject + '","content":"' + content + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            if (data.d != "1") {
                alert(data.d);
            }
            else {
                clear_c();
                alert('Gửi thông tin liên hệ thành công.');
            }
        }
    });
}

function clear_c() {
    $('#txtFullName').val('');
    $('#txtEmail').val('');
    $('#txtPhone').val('');
    $('#txtSubject').val('');
    $('#txtContent').val('');
}

$('#btnClear').click(function () {
    clear_c();
})

$('#btnSend').click(function () {
    send_c();
})

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}