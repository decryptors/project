<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />
    
    <h2 class="entity">Parcele</h2>
    <br />
    <div class="content-wrapper">   
        <button id="btnPopupAdd" class="btn btn-default">Adaugă</button> 
        <p id="titleAddPopup" style="display:none;">Adaugă parcelă</p>
        <div class="popup-overlay">
            <div id="addDiv" style="display: none">
                <input id="inputNumber" class="form-control" type="text" placeholder="Numărul parcelei"/>
                Cimitir:<select id="inputGraveyardId" class="GraveyardIdSelect"></select><br />
                <input id="inputSurface" class="form-control" type="text" placeholder="Suprfață"/>
                Contract: <select id="inputContractId" class="form-control" />
                <p>Alegeti fotografii</p>
                <input id="inputPhoto" class="form-control" type="file" alt="Adauga fotografii..."/>
            </div>            
        </div>

        <p id="titleEditPopup" style="display:none;">Modifica datele parcelei</p>
        <div id="editDiv" style="display: none">
            <input id="editId" type="hidden" />
            Număr:<input id="editNumber" class="form-control" type="text" placeholder="Numărul parcelei"/>
            Cimitir:<select id="editGraveyardId" class="GraveyardIdSelect"></select><br />
            Suprafață:<input id="editSurface" class="form-control" type="text" placeholder="Suprfață"/>
            Contract:<select id="editContractId" class="form-control" />
            <p>Alegeti fotografii</p>
            <input id="editPhoto" class="form-control" type="file" alt="Adauga fotografii..."/>
        </div>
 
        <div class="clear"></div>
        <br />
        <table id="areaContainer" class="table table-stripped table-bordered">
                <tr>                    
                    <th class="textsort tableheading">Număr</th>
                    <th class="textsort tableheading">Cimitir</th>
                    <th class="categorysort tableheading">Suprafaţă</th>
                    <th class="categorysort tableheading">Număr contract</th>
                    <th class="tagsort tableheading">Fotografie</th>
                    <th></th>
                    <th></th>
                </tr>
        </table>
        <script id="areaTemplate" type="text/x-jquery-tmpl">
            <tr id="row${AreaId}">                
                <td>${Number}</td>
                <td>${Graveyard.Name}</td>
                <td>${Surface}</td>
                <td>10</td>
                <td>${Photo}</td>                
                <td style="vertical-align: middle;">
                    <button class="btn btn-default" onclick="startEdit(${AreaId}); return false;">Modifică</button>
                </td>
                <td style="vertical-align: middle;">
                    <a href="#" class="delete" onclick="startDelete(${AreaId}); return false;"><i class="flaticon-close19"></i></a>
                </td>
            </tr>
        </script>
    </div>
    <script src="/Scripts/AreaForm.js"></script>
</asp:Content>

