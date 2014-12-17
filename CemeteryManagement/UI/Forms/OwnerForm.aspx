<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <h2 class="entity">Concesionari</h2>
    <br />
    <div class="content-wrapper">              
        <button id="btnPopup" class="btn btn-default">Adaugă</button>   
        <div id="dialog">
            <input id="inputName" type="text" name="Name" placeholder="Nume" /><br />
            <input id="inputAddress" type="text" name="Address" placeholder="Address" /><br />
            <button onclick="AddOwner()">Add</button>
        </div>
        <div id="modal_dialog" style="display: none">
            This is a Modal Background popup
        </div>

        
        <button id="btnPopup" class="btn btn-default">Modifică</button> 
        <div class="clear"></div>
        <br />
        <table id="ownerContainer" class="table table-stripped table-bordered">
                <tr>
                    <th style="text-align: left;" class="textsort tableheading">Nume</th>
                    <th style="text-align: left;" class="textsort tableheading">Address</th>
                </tr>
        </table>
        <script id="ownerTemplate" type="text/x-jquery-tmpl">
            <tr>
                <td>${Name}</td>
                <td>${Address}</td>
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
                url: "/Webservices/OwnersService.asmx/ReadAll",
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
            $('#ownerContainer').find("tr:gt(0)").remove();
            $('#ownerTemplate').tmpl(deceased).appendTo('#ownerContainer');
        }
    </script>

</asp:Content>


