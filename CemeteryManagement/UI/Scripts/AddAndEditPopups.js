$(document).ready(function () {
    $("#btnPopupAdd").click(function (event) {
        event.stopPropagation();
        event.preventDefault();
        $("#addDiv").dialog({
            title: document.getElementById("titleAddPopup").innerHTML,
            buttons: [
                {
                    text: "Adauga",
                    "class": 'btn',
                    click: function () {
                        FinishAdd();
                    },
                    OK: function () {
                    }
                }],
            //modal: true,
            draggable: false,
            resizable: false
        });
        $("#dialog").dialog('open');
    });

    $("#btnPopupEdit").click(function (event) {        
        event.stopPropagation();
        event.preventDefault();
        $("#editDiv").dialog({
            title: document.getElementById("titleEditPopup").innerHTML,
            buttons: [
                {
                    text: "Modifica",
                    "class": 'btn',
                    click: function () {
                        finishEdit();
                    },
                    OK: function () {
                    }
                }],
            //modal: true,
            draggable: false,
            resizable: false
        });
        $("#dialog").dialog('open');
    });
    

    $(".cautaContract").click(function (event) {
        event.stopPropagation();
        event.preventDefault();
        $("#showContract").dialog({
            title: 'Cauta contract',
            buttons: [
                {
                    text: "Selecteaza",
                    "class": 'btn',
                    OK: function () {
                    }
                }],
            //modal: true,
            draggable: false,
            resizable: false,
            position: { my: "right top", at: "right bottom", of: window }
        });
        $("#dialog").dialog('open');
    });

    $(".cautaProprietar").click(function (event) {
        event.stopPropagation();
        event.preventDefault();
        $("#showOwner").dialog({
            title: 'Cauta proprietar',
            buttons: [
                {
                    text: "Selecteaza",
                    "class": 'btn',
                    OK: function () {
                    }
                }],
            //modal: true,
            draggable: false,
            resizable: false,
            position: { my: "right top", at: "right bottom", of: window }
        });
        $("#dialog").dialog('open');
    });

    $(".datepicker").datepicker();
    loadGrid();
});

function StartEditPopup() {
    $("#editDiv").dialog({
        title: document.getElementById("titleEditPopup").innerHTML,
        buttons: [
            {
                text: "Modifica",
                "class": 'btn',
                click: function () {
                    finishEdit();
                },
                OK: function () {
                }
            }],
        //modal: true,
        draggable: false,
        resizable: false
    });
    $("#dialog").dialog('open');
}

function onBlur(el) {
    if (el.value == '') {
        el.value = el.defaultValue;
    }
}
function onFocus(el) {
    if (el.value == el.defaultValue) {
        el.value = '';
    }
}

function CreateEditButtons() {   

}