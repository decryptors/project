<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Decedați fără aparținători</h2>
    <br />
    <div class="content-wrapper">              
        <button id="btnPopupAdd" class="btn btn-default">Adauga</button> 
        <p id="titleAddPopup" style="display:none;">Adauga decedat</p>
        <div id="addDiv" style="display: none">
            <input id="inputName" type="text" name="Name" placeholder="Nume" /><br />
            <input id="inputReligion" type="text" name="Religion" placeholder="Religie" /><br />
            <input id="inputDateOfBurial" type="text" class="datepicker" name="DateOfBurial" placeholder="Data înhumării" /><br />
            Martir/Erou: <input id="checkImportant" type="checkbox" name="IsVIP"/><br />
            <input id="inputBurialCertificateNumber" type="text" name="BurialCertificateNumber" placeholder="Nr. cert. de înhumare" /><br />
            <input id="inputRequestNumber" type="text" name="NrAdev" placeholder="Nr. adeverintei"/>            
        </div>
        <p id="titleEditPopup" style="display:none;">Modifică decedat</p>
        <div id="editDiv" style="display: none">
            <input id="editId" type="hidden" />
            <input id="editName" type="text" name="Name" placeholder="Nume" /><br />
            <input id="editReligion" type="text" name="Religion" placeholder="Religie" /><br />
            <input id="editDateOfBurial" type="text" class="datepicker" name="DateOfBurial" placeholder="Data înhumării" /><br />
            Martir/Erou: <input id="editImportant" type="checkbox" name="IsVIP"/><br />
            <input id="editBurialCertificateNumber" type="text" name="BurialCertificateNumber" placeholder="Nr. cert. de înhumare" /><br />
            <input id="editRequestNumber" type="text" name="NrAdev" placeholder="Nr. adeverintei"/>            
        </div>
        
        <div class="clear"></div>
        <br />
        <table id="homelessContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nume</th>
                    <th class="categorysort tableheading">Religie</th>
                    <th class="levelsort tableheading">Data înhumării</th>
                    <th class="tagsort tableheading">Martir/Erou</th>
                    <th class="questiontypesort tableheading">Nr. cert. deces</th>
                    <th class="questiontypesort tableheading">Nr. adeverintei</th>
                    <th></th>
                </tr>
        </table>
        <script id="homelessTemplate" type="text/x-jquery-tmpl">
            <tr id="row${PersonId}">
                <td>${Name}</td>
                <td>${Religion}</td>
                <td>${DateOfBurial}</td>
                <td>${IsVIP}</td>
                <td>${BurialCertificateNumber}</td>
                <td>${RequestNumber}</td>
                <td>
                    <button class="btn btn-default" onclick="startEdit(${PersonId}); return false;">Modifică</button>
                </td>
                <td style="vertical-align: middle;">
                    <a href="#" class="delete" onclick="deleteRow(this); return false;"><i class="flaticon-close19"></i></a>
                </td>
            </tr>
        </script>
    </div>
    <script src="/Scripts/HomelessForm.js"></script>
  

</asp:Content>

