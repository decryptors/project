<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>

<button id="btnPopupAdd">Adauga</button> 
    <p id="titleAddPopup" style="display:none;">Adauga proprietar</p>
    <div id="addDiv" style="display: none">
        <input type="text" value="Nume"
            onblur="onBlur(this)"
            onfocus="onFocus(this)" />
        <input type="text" value="Adresa"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
              
    </div>
    
    <button id="btnPopupEdit">Modifica</button> 
    <p id="titleEditPopup" style="display:none;">Modifica datele proprietarului</p>
    <div id="editDiv" style="display: none">
        <input type="text" value="Nume"
            onblur="onBlur(this)"
            onfocus="onFocus(this)" />
        <input type="text" value="Adresa"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
              
    </div>
         <h2 class="entity">Concesionari</h2>
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


