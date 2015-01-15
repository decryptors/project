function FinishAdd() {
    var owner = new Object();
    owner.Name = $("#inputName").val();
    owner.Religion = $("#inputAddress").val();
    var obj = JSON.stringify({ owner: owner });
    $.ajax({
        type: "POST",
        url: "/Webservices/OwnersService.asmx/AddOwner",
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
    var owner = new Object();
    owner.PersonId = $("#editId").val();
    owner.Name = $("#editName").val();
    var obj = JSON.stringify({ owner: owner });
    $.ajax({
        type: "POST",
        url: "/Webservices/OwnersService.asmx/EditOwner",
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


$(document).ready(function () {
    loadGrid();

});

function loadGrid() {
    $.ajax({
        type: "POST",
        url: "/Webservices/OwnersService.asmx/ReadAll",
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
function CreateGrid(owner) {
    $('#ownerContainer').find("tr:gt(0)").remove();
    $('#ownerTemplate').tmpl(deceased).appendTo('#ownerContainer');
}