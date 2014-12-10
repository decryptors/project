<%@ Page MasterPageFile="/Forms/cemetery-template.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <button id="btnPopup">Add</button> 
    <div id="dialog">
        This is a simple popup
    </div>
    <div id="modal_dialog" style="display: none">
        This is a Modal Background popup
    </div>

    <table id="deceasedContainer" class="gridviewtable">
            <tr>
                <th style="text-align: left;" class="textsort tableheading"></th>
                <th style="text-align: left;" class="categorysort tableheading"></th>
                <th style="text-align: left;" class="levelsort tableheading"></th>
                <th style="text-align: left;" class="tagsort tableheading"></th>
                <th style="text-align: left;" class="questiontypesort tableheading"></th>
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
    <script type="text/javascript">
        $(document).ready(function () {
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
        });
        function CreateGrid(deceased) {
            /*
            var string = "";
            for (var i in deceased) {
                string += (deceased[i]["Name"] + ",");
            }
            alert(string);
            var obj = JSON.stringify({ deceased: deceased[0] });
            /*
            $.ajax({
                type: "POST",
                url: "/Webservices/DeceasedService.asmx/AddDeceased",
                data: obj,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                },
                failure: function (err, msg) {
                    alert(err + msg);
                }

            });
            */
            //To Do Repair template usage
            $('#deceasedTemplate').tmpl(deceased).appendTo('#deceasedContainer');
        }
    </script>

</asp:Content>
