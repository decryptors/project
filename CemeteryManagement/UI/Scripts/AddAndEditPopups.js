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
        if ($("#inputGraveyardId") != null)
            loadGraveyardSelect($("#inputGraveyardId"));
        if ($("#inputContractId") != null)
            loadContractSelect($("#inputContractId"));
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

function deleteRow(btn) {
    event.preventDefault();
    event.stopPropagation();
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
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

function loadGraveyardSelect(obj, graveyardId) {
    $.ajax({
        type: "POST",
        url: "/Webservices/GraveyardService.asmx/ReadAll",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj.empty();
            var deserializedData = JSON.parse(data.d);
            
            for (var i = 0; i < deserializedData.length; i++) {
                var graveyard = deserializedData[i];
                var selected = graveyardId == graveyard.GraveyardId;
                obj.append("<option value='" + graveyard.GraveyardId + "'" + (selected == true ? " selected " : "") + ">" +
                    graveyard.Name + "</option>");
            }
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
}

function loadContractSelect(obj, areaId) {
    for (var i = 1; i < 4; i++) {
        var selected = areaId == i;
        obj.append("<option value='" + i + "'" + (selected == true ? " selected " : "") + ">" +
            "Contract " + i + "</option>");
    }
    /*
    $.ajax({
        type: "POST",
        url: "/Webservices/ContractService.asmx/ReadAll",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            obj.empty();
            var deserializedData = JSON.parse(data.d);            
            for (var i = 0; i < deserializedData.length; i++) {
                var contract = deserializedData[i];
                var selected = contractId == contract.contractId;
                obj.append("<option value='" + area.graveyardId + "'" + (selected == true ? " selected " : "") + ">" +
                    area.Graveyard.Name + "</option>");
            }
            for (var i = 1; i < 4; i++) {
                var selected = areaId == i;
                obj.append("<option value='" + i + "'" + (selected == true ? " selected " : "") + ">" +
                    "Contract " + i + "</option>");
            }
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
    */
}
