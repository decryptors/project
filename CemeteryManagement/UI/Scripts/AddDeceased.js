﻿$(document).ready(function () {
    $("#btnPopup").click(function (event) {
        event.stopPropagation();
        event.preventDefault();
        $("#dialog").dialog({
            title: "Adăugare decedat",
            buttons: {
                Close: function () {
                    $(this).dialog('close');
                }
            },
            modal: true,
            draggable: false,
            resizable: false
        });
        $("#dialog").dialog('open');
        // return false;
    });
});