

function FinishAdd() {
    var deceased = new Object();
    deceased.Name = $("#inputName").val();
    deceased.Religion = $("#inputReligion").val();
    deceased.DateOfBurial = $("inputDateOfBurial").val();
    deceased.IsVIP = $("#checkImportant").prop('checked');
    deceased.BurialCertificateNumber = $("#inputBurialCertificateNumber").val();
    var obj = JSON.stringify({ deceased: deceased });
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

function startEdit(id) {
    StartEditPopup();
    $("#editId").val(id);
    $("#editName").val($("#row"+id+" td:nth-child(1)").html());
    $("#editReligion").val($("#row" + id + " td:nth-child(2)").html());
    $("#editDateOfBurial").val($("#row" + id + " td:nth-child(3)").html());
    $("#editImportant").prop("checked", $("#row" + id + " td:nth-child(4)").html()=="true");
    $("#editBurialCertificateNumber").val($("#row" + id + " td:nth-child(5)").html());
}

function finishEdit() {
    var deceased = new Object();
    deceased.PersonId = $("#editId").val();
    deceased.Name = $("#editName").val();
    deceased.Religion = $("#editReligion").val();
    deceased.DateOfBurial = $("editDateOfBurial").val();
    deceased.IsVIP = $("#editImportant").prop('checked');
    deceased.BurialCertificateNumber = $("#editBurialCertificateNumber").val();
    var obj = JSON.stringify({ deceased: deceased });
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
