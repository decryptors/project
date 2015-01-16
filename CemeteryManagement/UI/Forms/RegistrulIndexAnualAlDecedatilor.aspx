<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulIndexAnualAlDecedatilor.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulIndexAnualAlDecedatilor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul index anual al decedaților</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Decedat</th>
                    <th class="categorysort tableheading">Cimitir</th>
                    <th class="categorysort tableheading">Parcelă</th>
                </tr>
        </table>
       
    </div>
     <script id="deceasedTemplate" type="text/x-jquery-tmpl">
            <tr>
                <td>${Name}</td>
                <td>${CemeteryName}</td>
                <td>${AreaNumber}</td>
            </tr>
      </script>

    <script type="text/javascript">
        $(document).ready(function () {
            loadGrid();

        });

        function loadGrid() {
            $.ajax({
                type: "POST",
                url: "/Webservices/ReportsService.asmx/ReadAllRegD",
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

    </script>

</asp:Content>