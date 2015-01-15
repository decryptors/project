<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Styles/PopupsStyle.css" />
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Concesionari</h2>
    <br />
    <div class="content-wrapper">
        <button id="btnPopupAdd" class="btn btn-default">Adaugă</button>
        <p id="titleAddPopup" style="display: none;">Adauga apartinator</p>
        <div id="addDiv" style="display: none">
            <input id="inputName" type="text" name="Name" placeholder="Nume" /><br />
            <input id="inputAddress" type="text" name="Address" placeholder="Adresa" /><br />
        </div>

        <p id="titleEditPopup" style="display: none;">Modifică apartinator</p>
        <div id="editDiv" style="display: none">
            <input id="editId" type="hidden" />
            Nume:<input id="editName" type="text" name="Name" placeholder="Nume" /><br />
            Adresă:<input id="editAddress" type="text" name="Address" placeholder="Adresa" /><br />
        </div>
        <div id="modal_dialog" style="display: none">
            This is a Modal Background popup
        </div>

        <div class="clear"></div>
        <br />
        <table id="ownerContainer" class="table table-stripped table-bordered">
            <tr>
                <th class="textsort tableheading">Nume</th>
                <th class="textsort tableheading">Address</th>
            </tr>
        </table>
        <script id="ownerTemplate" type="text/x-jquery-tmpl">
            <tr id="row${PersonId}">
                <td>${Name}</td>
                <td>${Address}</td>
                <td>
                    <button class="btn btn-default" onclick="startEdit(${PersonId}); return false;">Modifică</button>
                </td>
                <td style="vertical-align: middle;">
                    <a href="#" class="delete" onclick="startDelete(${PersonId}); return false;"><i class="flaticon-close19"></i></a>
                </td>
            </tr>
        </script>
    </div>
    <script src="/Scripts/OwnerForm.js"></script>

</asp:Content>


