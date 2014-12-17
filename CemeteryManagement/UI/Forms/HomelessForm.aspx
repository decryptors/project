<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <h2 class="entity">Decedați fără aparținători</h2>
    <br />
    <div class="content-wrapper">              
        <button id="btnPopup" class="btn btn-default">Adaugă</button>   
        <div id="dialog">
            <input id="inputName" type="text" name="Name" placeholder="Nume" /><br />
            <input id="inputReligion" type="text" name="Religion" placeholder="Religie" /><br />
            <input id="inputDateOfBurial" type="text" name="DateOfBurial" placeholder="Data înhumării" /><br />
            Important: <input id="checkImportant" type="checkbox" name="IsVIP"/><br />
            <input id="inputBurialCertificateNumber" type="text" name="BurialCertificateNumber" placeholder="Nr. cert. de înhumare" /><br />
            <input id="inputHomelessCertificateNumber" type="text" name="RequestNumber" placeholder="Nr. adeverintei" /><br />
            <button onclick="AddHomeless()">Add</button>
        </div>
        <div id="modal_dialog" style="display: none">
            This is a Modal Background popup
        </div>

        
        <button id="btnPopup" class="btn btn-default">Modifică</button> 
        <div class="clear"></div>
        <br />
        <table id="homelessContainer" class="table table-stripped table-bordered">
                <tr>
                    <th style="text-align: left;" class="textsort tableheading">Nume</th>
                    <th style="text-align: left;" class="categorysort tableheading">Religie</th>
                    <th style="text-align: left;" class="levelsort tableheading">Data înhumării</th>
                    <th style="text-align: left;" class="tagsort tableheading">Martir/Erou</th>
                    <th style="text-align: left;" class="questiontypesort tableheading">Nr. cert. deces</th>
                    <th style="text-align: left;" class="questiontypesort tableheading">Nr. adeverintei</th>
                </tr>
        </table>
        <script id="homelessTemplate" type="text/x-jquery-tmpl">
            <tr>
                <td>${Name}</td>
                <td>${Religion}</td>
                <td>${DateOfBurial}</td>
                <td>${IsVIP}</td>
                <td>${BurialCertificateNumber}</td>
                <td>${RequestNumber}</td>
            </tr>
        </script>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            loadGrid();
            
        });

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
        function CreateGrid(deceased) {
            $('#homelessContainer').find("tr:gt(0)").remove();
            $('#homelessTemplate').tmpl(deceased).appendTo('#homelessContainer');
        }
    </script>

</asp:Content>

