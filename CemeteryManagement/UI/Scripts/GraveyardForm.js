

function FinishAdd() {
    var graveyard = new Object();
    graveyard.Name = $("#inputName").val();
    graveyard.Address = $("#inputAddress").val();
    var obj = JSON.stringify({ graveyard: graveyard });
    $.ajax({
        type: "POST",
        url: "/Webservices/GraveyardService.asmx/AddGraveyard",
        data: obj,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#addDiv").dialog('close');
            loadGrid();
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
}

function startEdit(id) {
    StartEditPopup();
    $("#editId").val(id);
    $("#editName").val($("#row" + id + " td:nth-child(1)").html());
    $("#editAddress").val($("#row" + id + " td:nth-child(2)").html());
}

function finishEdit() {
    var graveyard = new Object();
    graveyard.GraveyardId = $("#editId").val();
    graveyard.Name = $("#editName").val();
    graveyard.Address = $("#editAddress").val();
    var obj = JSON.stringify({ graveyard: graveyard });
    $.ajax({
        type: "POST",
        url: "/Webservices/GraveyardService.asmx/EditGraveyard",
        data: obj,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#editDiv").dialog('close');
            loadGrid();
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
}

function startDelete(id) {
    var graveyard = new Object();
    graveyard.GraveyardId = id;
    var obj = JSON.stringify({ deceased: deceased });
    $.ajax({
        type: "POST",
        url: "/Webservices/GraveyardService.asmx/DeleteGraveyard",
        data: obj,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            loadGrid();
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
}

function loadGrid() {
    $.ajax({
        type: "POST",
        url: "/Webservices/GraveyardService.asmx/ReadAll",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var deserializedData = JSON.parse(data.d);
            CreateGrid(deserializedData);
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });
}

function CreateGrid(graveyard) {
    $('#graveyardContainer').find("tr:gt(0)").remove();
    $('#graveyardTemplate').tmpl(graveyard).appendTo('#graveyardContainer');
}


