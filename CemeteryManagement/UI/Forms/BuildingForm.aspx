<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/BuildingForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>

<%--Should be removed!--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>

    <h2 class="entity">Clădiri</h2>
    <br />
    <div class="content-wrapper">              
        <button id="btnPopupAdd" class="btn btn-default">Adaugă</button> 
        <p id="titleAddPopup" style="display:none;">Adaugă clădire</p>
        <div id="addDiv" style="display: none">
            <input id="inputType" type="text" name="Type" placeholder="Tipul clădirii" /><br />
            <input id="inputAreaId" type="text" name="Type" placeholder="Area id" /><br />
            Cladire istorica: <input id="checkImportant" type="checkbox" name="IsHistorical"/><br />
        </div>
        <p id="titleEditPopup" style="display:none;">Modifică clădire</p>
        <div id="editDiv" style="display: none">
            <input id="editType" type="text" name="editType" placeholder="Tipul clădirii" /><br />
            <input id="editAreaId" type="text" name="Type" placeholder="Area id" /><br />
            Clădire istorică <input id="editIsHistorical" type="checkbox" name="IsHistorical"/><br />
        </div>
        <div id="modal_dialog" style="display: none">
            This is a Modal Background popup
        </div>

        
        <div class="clear"></div>

        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="tagsort tableheading">Este cladire istorica</th>
                    <th class="questiontypesort tableheading">Tip</th>
                    <th>Area id</th>
                    <th></th>
                </tr>
        </table>
        <script id="deceasedTemplate" type="text/x-jquery-tmpl">
            <tr id="row${BuildingId}">
                <td>${IsHistorical}</td>
                <td>${Type}</td>
                <td>${AreaId}</td>
                <td>
                    <button class="btn btn-default" onclick="startEdit(${BuildingId}); return false;">Modifică</button>
                </td>
            </tr>
        </script>
    </div>
    <script src="/Scripts/BuildingForm.js"></script>
</asp:Content>

