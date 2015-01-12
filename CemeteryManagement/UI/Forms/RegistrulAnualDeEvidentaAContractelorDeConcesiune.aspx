<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulAnualDeEvidentaAContractelorDeConcesiune.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulAnualDeEvidentaAContractelorDeConcesiune" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul anual de evidenţă a contractelor de concesiune</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nr. curent</th>
                    <th class="categorysort tableheading">Nr. eliberării contractului</th>
                    <th class="categorysort tableheading">Data eliberării contractului</th>
                    <th class="categorysort tableheading">Nume</th>
                    <th class="categorysort tableheading">Prenume</th>
                    <th class="categorysort tableheading">Adresă</th>
                </tr>
        </table>
       
      </div> 
      <%--<script id="deceasedTemplate" type="text/x-jquery-tmpl">
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
        
    </script>--%>

</asp:Content>