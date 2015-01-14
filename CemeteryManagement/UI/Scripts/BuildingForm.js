

function FinishAdd() {
    var building = new Object();    
    var areaId = parseInt($("#inputAreaId").val());
    building.Type = $("#inputType").val();
    building.IsHistorical = $("#inputIsHistorical").prop('checked');
    var obj = JSON.stringify({ building: building, areaId: areaId });
    $.ajax({
        type: "POST",
        url: "/Webservices/BuildingService.asmx?op=AddBuilding",
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
    $("#editIsHistorical").prop("checked", $("#row" + id + " td:nth-child(1)").html() == "true");
    $("#editType").val($("#row" + id + " td:nth-child(2)").html());
    $("#editAreaId").val($("#row" + id + " td:nth-child(3)").html());
}

function finishEdit() {
    var building = new Object();
    var areaId = parseInt($("#editAreaId").val());
    building.BuildingId = $("#editId").val();
    building.Type = $("#editType").val();
    building.IsHistorical = $("#editIsHistorical").prop('checked');
    var obj = JSON.stringify({ building: building, areaId: areaId });    
    $.ajax({
        type: "POST",
        url: "/Webservices/BuildingService.asmx?op=EditBuilding",
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
        url: "/Webservices/BuildingService.asmx/ReadAll",
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
