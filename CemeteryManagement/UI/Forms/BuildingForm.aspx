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
            <input id="editId" type="hidden" />
            <input id="inputType" type="text" name="Type" placeholder="Tipul clădirii" /><br />
            Parcelă:<select id="inputAreaId" class="AreaIdSelect"></select><br />      
            Clădire istorică <input id="inputIsHistorical" type="checkbox" name="IsHistorical"/><br />
        </div>
        <p id="titleEditPopup" style="display:none;">Modifică clădire</p>
        <div id="editDiv" style="display: none">
            Tip clădire:<input id="editType" type="text" name="editType" placeholder="Tipul clădirii" /><br />
            Parcelă:<select id="editAreaId" class="AreaIdSelect"></select><br />      
            Clădire istorică <input id="editIsHistorical" type="checkbox" name="IsHistorical"/><br />
        </div>
        <div id="modal_dialog" style="display: none">
            This is a Modal Background popup
        </div>

        
        <div class="clear"></div>

        <br />
        <table id="buildingContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="tagsort tableheading">Este cladire istorica</th>
                    <th class="questiontypesort tableheading">Tip</th>
                    <th></th>
                </tr>
        </table>
        <script id="buildingTemplate" type="text/x-jquery-tmpl">
            <tr AreaId="${AreaId}" id="row${BuildingId}">                
                <td>${IsHistorical}</td>
                <td>${Type}</td>
                <td style="vertical-align: middle;">
                    <button class="btn btn-default" onclick="startEdit(${BuildingId}); return false;">Modifică</button>
                </td>
                <td style="vertical-align: middle;">
                    <a href="#" class="delete" onclick="startDelete(${BuildingId}); return false;"><i class="flaticon-close19"></i></a>
                </td>
            </tr>
        </script>
    </div>
    <script src="/Scripts/BuildingForm.js"></script>
</asp:Content>

