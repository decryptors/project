

function FinishAdd() {
    var contract = new Object();
    contract.InfocetNumber = $("#inputInfocetNumber").val();
    contract.ContractNumber = $("#inputContractNumber").val();
    contract.Area = new Object();
    contract.Area.Number = $("inputAreaNumber").val();
    contract.StartDate = $("inputStartDate").val();
    contract.EndDate = $("inputEndDate").val();
    contract.Owner = new Object();
    contract.Owner.Name = $("inputOwnerName").val();
    var obj = JSON.stringify({ deceased: deceased });
    $.ajax({
        type: "POST",
        url: "/Webservices/ContractService.asmx/AddContract",
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
    $("#editInfocetNumber").val(id);
    $("#editContractNumber").val($("#row" + id + " td:nth-child(1)").html());
    $("#editAreaNumber").val($("#row" + id + " td:nth-child(2)").html());
    $("#editStartDate").val($("#row" + id + " td:nth-child(3)").html());
    $("#editEndDate").prop("checked", $("#row" + id + " td:nth-child(4)").html() == "true");
    $("#editOwner").val($("#row" + id + " td:nth-child(5)").html());
}

function finishEdit() {
    var contract = new Object();
    contract.InfocetNumber = $("#editInfocetNumber").val();
    contract.ContractNumber = $("#editContractNumber").val();
    contract.Area = new Object();
    contract.Area.Number = $("editAreaNumber").val();
    contract.StartDate = $("editStartDate").val();
    contract.EndDate = $("editEndDate").val();
    contract.Owner = new Object();
    contract.Owner.Name = $("editOwnerName").val();
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
        url: "/Webservices/ContractService.asmx/ReadAll",
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
    $('#contractContainer').find("tr:gt(0)").remove();
    $('#contractTemplate').tmpl(deceased).appendTo('#contractContainer');
}
