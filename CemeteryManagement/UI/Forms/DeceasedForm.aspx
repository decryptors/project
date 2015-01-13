<%@ Page MasterPageFile="/Forms/cemetery-template.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>

    <h2 class="entity">Decedați</h2>
    <br />
    <div class="content-wrapper">              
        <button id="btnPopupAdd" class="btn btn-default">Adaugă</button> 
        <p id="titleAddPopup" style="display:none;">Adauga decedat</p>
        <div id="addDiv" style="display: none">
            <input id="inputName" type="text" name="Name" placeholder="Nume" /><br />
            <input id="inputReligion" type="text" name="Religion" placeholder="Religie" /><br />
            <input id="inputDateOfBurial" type="text" class="datepicker" name="DateOfBurial" placeholder="Data înhumării" /><br />
            Martir/Erou: <input id="checkImportant" type="checkbox" name="IsVIP"/><br />
            <input id="inputBurialCertificateNumber" type="text" name="BurialCertificateNumber" placeholder="Nr. cert. de înhumare" /><br />
        </div>
        <div id="modal_dialog" style="display: none">
            This is a Modal Background popup
        </div>

        
        <button id="btnPopupEdit" class="btn btn-default">Modifică</button>
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nume</th>
                    <th class="categorysort tableheading">Religie</th>
                    <th class="levelsort tableheading">Data înhumării</th>
                    <th class="tagsort tableheading">Martir/Erou</th>
                    <th class="questiontypesort tableheading">Nr. cert. deces</th>
                </tr>
        </table>
        <script id="deceasedTemplate" type="text/x-jquery-tmpl">
            <tr>
                <td>${Name}</td>
                <td>${Religion}</td>
                <td>${DateOfBurial}</td>
                <td>${IsVIP}</td>
                <td>${BurialCertificateNumber}</td>
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
                url: "/Webservices/DeceasedService.asmx/ReadAll",
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

        function AddDeceased() {
            var deceased = new Object();
            deceased.Name = $("#inputName").val();
            deceased.Religion = $("#inputReligion").val();
            deceased.DateOfBurial = $("inputDateOfBurial").val();
            deceased.IsVIP = $("#checkIsVIP").prop('checked');
            deceased.BurialCertificateNumber = $("#inputBurialCertificateNumber").val();
            var obj = JSON.stringify({ deceased: deceased });
            $.ajax({
                type: "POST",
                url: "/Webservices/DeceasedService.asmx/AddDeceased",
                data: obj,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                    loadGrid();
                },
                failure: function (err, msg) {
                    alert(err + msg);
                }

            });
        }
    </script>

    <script src="/Scripts/AddDeceased.js"></script>

</asp:Content>
