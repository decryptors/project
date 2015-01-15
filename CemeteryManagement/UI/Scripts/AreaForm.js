

function FinishAdd() {
    var area = new Object();    
    var contractId = $("#inputContractId").val();
    area.Number = $("#inputNumber").val();
    area.Surface = $("#inputSurface").val();
    //area.Photo = $("#inputPhoto").prop("files")[0];    
    area.Graveyard = new Object();
    area.Graveyard.GraveyardId = $("#inputGraveyardId").val();    
    var obj = JSON.stringify({ area: area, contractId: contractId });
    alert(obj);
    $.ajax({
        type: "POST",
        url: "/Webservices/AreaService.asmx/AddArea",
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
    var graveyardId = $("#row" + id).attr("graveyardId");
    $("#editId").val(id);
    $("#editNumber").val($("#row" + id + " td:nth-child(1)").html());
    $("#editSurface").val($("#row" + id + " td:nth-child(3)").html());
    //$("#editContractId").val("11");
    loadGraveyardSelect($("#editGraveyardId"), graveyardId);
    loadContractSelect($("#editContractId"), id);    
}

function finishEdit() {
    var area = new Object();
    var contractId = $("#editContractId").val();
    area.AreaId = $("#editId").val();
    area.Number = $("#editNumber").val();
    area.Surface = $("#editSurface").val();
    //area.Photo = $("#editPhoto").val();
    area.Graveyard = new Object();
    area.Graveyard.GraveyardId = $("#editGraveyardId").val();
   
    var obj = JSON.stringify({ area: area, contractId: contractId });
    $.ajax({
        type: "POST",
        url: "/Webservices/AreaService.asmx/EditArea",
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
        url: "/Webservices/AreaService.asmx/DeleteArea",
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
        url: "/Webservices/AreaService.asmx/ReadAll",
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

function CreateGrid(area) {
    $('#areaContainer').find("tr:gt(0)").remove();
    $('#areaTemplate').tmpl(area).appendTo('#areaContainer');
}


