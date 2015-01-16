String.format = function () {
    var s = arguments[0];
    for (var i = 0; i < arguments.length - 1; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        s = s.replace(reg, arguments[i + 1]);
    }

    return s;
}

function FinishAdd() {
    var deceased = {};
    deceased.Name = $("#inputName").val();
    deceased.Religion = $("#inputReligion").val();
    deceased.DateOfBurial = $("#inputDateOfBurial").val();
    deceased.IsVIP = $("#checkImportant").prop('checked');
    deceased.BurialCertificateNumber = $("#inputBurialCertificateNumber").val();
    deceased.AreaId = $("#inputAreaId").find("option:selected").val();
    var obj = JSON.stringify({ deceased: deceased});
    $.ajax({
        type: "POST",
        url: "/Webservices/DeceasedService.asmx/AddDeceased",
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

function startEdit(id, areaId) {
    
    $("#editId").val(id);
    $("#editName").val($("#row" + id + " td:nth-child(1)").html());
    $("#editReligion").val($("#row" + id + " td:nth-child(2)").html());
    $("#editDateOfBurial").val($("#row" + id + " td:nth-child(3)").html());
    $("#editImportant").prop("checked", $("#row" + id + " td:nth-child(4)").html() == "true");
    $("#editBurialCertificateNumber").val($("#row" + id + " td:nth-child(5)").html());
    readAllAreas($("#editAreaId"), areaId);
}

function finishEdit() {
    var deceased = {};
    deceased.PersonId = $("#editId").val();
    deceased.Name = $("#editName").val();
    deceased.Religion = $("#editReligion").val();
    deceased.DateOfBurial = $("#editDateOfBurial").val();
    deceased.IsVIP = $("#editImportant").prop('checked');
    deceased.BurialCertificateNumber = $("#editBurialCertificateNumber").val();
    deceased.AreaId = $("#editAreaId").find("option:selected").val();

    var obj = JSON.stringify({ deceased: deceased});
    $.ajax({
        type: "POST",
        url: "/Webservices/DeceasedService.asmx/EditDeceased",
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
    var deceased = new Object();
    deceased.PersonId = id;
    var obj = JSON.stringify({ deceased: deceased });
    $.ajax({
        type: "POST",
        url: "/Webservices/DeceasedService.asmx/DeleteDeceased",
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

function readAllAreas(control, id) {
    $.ajax({
        type: "POST",
        url: "/Webservices/AreaService.asmx/ReadAll",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var deserializedData = JSON.parse(data.d);
            PopulateAreaDropdown(id, deserializedData, control);
        },
        failure: function (err, msg) {
            alert(err + msg);
        }

    });

}

function PopulateAreaDropdown(areaId, allAreas, control) {
    control.children().remove();
    for (var i = 0; i < allAreas.length; i++) {
        if (allAreas[i].AreaId == areaId) {
            control.append(String.format("<option value='{0}' selected>{1} Numarul:{2}</option>",allAreas[i].AreaId, allAreas[i].Graveyard.Name, allAreas[i].Number));
        } else {
            control.append(String.format("<option value='{0}'>{1} Numarul:{2}</option>",allAreas[i].AreaId, allAreas[i].Graveyard.Name, allAreas[i].Number));
        }
    }
    StartEditPopup();
}

function loadGrid() {
    $.ajax({
        type: "POST",
        url: "/Webservices/DeceasedService.asmx/ReadAll",
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

function CreateGrid(deceased) {
    $('#deceasedContainer').find("tr:gt(0)").remove();
    $('#deceasedTemplate').tmpl(deceased).appendTo('#deceasedContainer');
}


