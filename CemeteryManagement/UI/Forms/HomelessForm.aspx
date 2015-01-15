<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Decedați fără aparținători</h2>
    <br />
    <div class="content-wrapper">              
        <button id="btnPopupAdd" class="btn btn-default">Adauga</button> 
        <p id="titleAddPopup" style="display:none;">Adauga homeless</p>
        <div id="addDiv" style="display: none">
            <input type="text" name="Nume" placeholder="Nume"/>
             <input type="text" name="Religion" placeholder="Religie" /><br />
            <input id="inputDateOfBurial" type="text" class="datepicker" name="DateOfBurial" placeholder="Data înhumării" />
            Martir/Erou: <input id="checkImportant" type="checkbox" name="IsVIP"/><br />
            <input type="text" name="NrCertDeces" placeholder="Nr. certificatului de deces"/>
            <input type="text" name="NrAdev" placeholder="Nr. adeverintei"/>
            
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
            <tr>
                <td>${Name}</td>
                <td>${Religion}</td>
                <td>${DateOfBurial}</td>
                <td>${IsVIP}</td>
                <td>${BurialCertificateNumber}</td>
                <td>${RequestNumber}</td>
                <td>
                    <button class="btn btn-default" onclick="">Modifică</button>
                </td>
                <td style="vertical-align: middle;">
                    <a href="#" class="delete" onclick="deleteRow(this)"><i class="flaticon-close19"></i></a>
                </td>
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

