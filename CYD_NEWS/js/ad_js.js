function show_msg(msg_content) {
    $('#dialog-message-content').html(msg_content);
    $("#dialog-message").dialog({
        modal: true,
        resizable: false,
        draggable: false,
        show: {
            effect: "fade",
            duration: 300
        },
        hide: {
            effect: "fade",
            duration: 300
        },
        buttons: {
            Đóng: function () {
                $(this).dialog("close");
            }
        }
    });
};

function show_waiting() {
    $('#waiting-message').dialog({
        modal: true,
        resizable: false,
        draggable: false,
        show: {
            effect: "fade",
            duration: 300
        },
        hide: {
            effect: "fade",
            duration: 300
        },
        buttons: {
            Đóng: function () {
                $(this).dialog("close");
            }
        }
    });
}

function close_waiting() {
    $("#waiting-message").dialog('close');
}

jQuery(".number_int").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
        // Allow: Ctrl+A, Command+A
        (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
        // Allow: home, end, left, right, down, up
        (e.keyCode >= 35 && e.keyCode <= 40)) {
        // let it happen, don't do anything
        return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});

function BrowseServer(startupPath, functionData) {
    var finder = new CKFinder();
    finder.basePath = '/images/';
    finder.startupPath = startupPath;
    finder.selectActionFunction = SetFileField;
    finder.selectActionData = functionData;
    finder.StartupFolderExpanded = true;
    finder.popup();
}

function SetFileField(fileUrl, data) {
    document.getElementById(data["selectActionData"]).value = fileUrl;
}