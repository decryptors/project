<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Cimitire</h2>
    <br />
    <div class="content-wrapper">      
        <button id="btnPopupAdd" class="btn btn-default">Adauga</button> 
        <p id="titleAddPopup" style="display:none;">Adauga cimitir</p>
        <div id="addDiv" style="display: none">
            <input id="inputName" type="text" value="Nume"
                onblur="onBlur(this)"
                onfocus="onFocus(this)" />
            <input id="inputAddress" type="text" value="Adresa"
               onblur="onBlur(this)"
                onfocus="onFocus(this)"  />
        </div>
        <p id="titleEditPopup" style="display:none;">Modifica datele cimitirului</p>
        <div id="editDiv" style="display: none">
            <input id="editId" type="hidden" />
            <input id="editName" type="text" value="Nume"
                onblur="onBlur(this)"
                onfocus="onFocus(this)" />
            <input id="editAddress" type="text" value="Adresa"
               onblur="onBlur(this)"
                onfocus="onFocus(this)"  />

        </div>

        <div class="clear"></div>
        <br />
        <table id="graveyardContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nume</th>
                    <th class="textsort tableheading">Adresă</th>
                    <th></th>
                </tr>
        </table>
        <script id="graveyardTemplate" type="text/x-jquery-tmpl">
            <tr id="row${GraveyardId}">
                <td>${Name}</td>
                <td>${Address}</td>
                <td style="vertical-align: middle;">
                    <button class="btn btn-default" onclick="startEdit(${GraveyardId}); return false;">Modifică</button>
                </td>
                <td style="vertical-align: middle;">
                    <a href="#" class="delete" onclick="startDelete(${GraveyardId}); return false;"><i class="flaticon-close19"></i></a>
                </td>
            </tr>
        </script>
    </div>
    <script src="/Scripts/GraveyardForm.js"></script>
    
</asp:Content>


