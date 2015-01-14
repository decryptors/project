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
        if ($("#inputAreaId") != null)
            loadAreaSelect($("#inputAreaId"));
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

function loadAreaSelect(obj, buildingId) {
    $.ajax({
        type: "POST",
        url: "/Webservices/AreaService.asmx/ReadAll",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj.empty();
            var deserializedData = JSON.parse(data.d);            
            for (var i = 0; i < deserializedData.length; i++) {
                var area = deserializedData[i];              
                var selected = false;
                if (buildingId>0) {
                    for(var building = 0; building<area.Buildings.length; building++)
                        if (area.Buildings[building].BuildingId==buildingId)
                            selected = true;
                }
                obj.append("<option value='" + area.AreaId + "'" + (selected==true?" selected ":"") + ">" +
                    area.Graveyard.Name + "-" + area.Number+"</option>");
            }

        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
}