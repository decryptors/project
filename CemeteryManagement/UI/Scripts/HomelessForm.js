

function FinishAdd() {
    var homeless = new Object();
    homeless.Name = $("#inputName").val();
    homeless.Religion = $("#inputReligion").val();
    homeless.DateOfBurial = $("inputDateOfBurial").val();
    homeless.IsVIP = $("#checkImportant").prop('checked');
    homeless.BurialCertificateNumber = $("#inputBurialCertificateNumber").val();
    homeless.RequestNumber = $("#inputRequestNumber").val();
    var obj = JSON.stringify({ homeless: homeless });
    $.ajax({
        type: "POST",
        url: "/Webservices/HomelessService.asmx/AddHomeless",
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
    event.preventDefault()    
    StartEditPopup();
    $("#editId").val(id);
    $("#editName").val($("#row" + id + " td:nth-child(1)").html());
    $("#editReligion").val($("#row" + id + " td:nth-child(2)").html());
    $("#editDateOfBurial").val($("#row" + id + " td:nth-child(3)").html());
    $("#editImportant").prop("checked", $("#row" + id + " td:nth-child(4)").html() == "true");
    $("#editBurialCertificateNumber").val($("#row" + id + " td:nth-child(5)").html());
    $("#editRequestNumber").val($("#row" + id + " td:nth-child(6)").html());
}

function finishEdit() {
    var homeless = new Object();
    homeless.PersonId = $("#editId").val();
    homeless.Name = $("#editName").val();
    homeless.Religion = $("#editReligion").val();
    homeless.DateOfBurial = $("editDateOfBurial").val();
    homeless.IsVIP = $("#editImportant").prop('checked');
    homeless.BurialCertificateNumber = $("#editBurialCertificateNumber").val();
    homeless.RequestNumber = $("#editRequestNumber").val();
    var obj = JSON.stringify({ homeless: homeless });
    $.ajax({
        type: "POST",
        url: "/Webservices/HomelessService.asmx/EditHomeless",
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
    var homeless = new Object();
    homeless.PersonId = id;
    var obj = JSON.stringify({ homeless: homeless });
    $.ajax({
        type: "POST",
        url: "/Webservices/HomelessService.asmx/DeleteHomeless",
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
        url: "/Webservices/HomelessService.asmx/ReadAll",
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

function CreateGrid(homeless) {
    $('#homelessContainer').find("tr:gt(0)").remove();
    $('#homelessTemplate').tmpl(homeless).appendTo('#homelessContainer');
}


