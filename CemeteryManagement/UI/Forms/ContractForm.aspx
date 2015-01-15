<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Contracte</h2>
    <br />
    <div class="content-wrapper">      
          <script>
          </script>

         <button id="btnPopupAdd">Adauga</button> 
            <p id="titleAddPopup" style="display:none;">Adauga contract</p>
            <div id="addDiv" style="display: none">
                <input id="inputInfocetNumber" type="text" name="InfocetNumber"  placeholder="Numar Infocet" /><br />
                 <input id="inputContractNumber" type="text" name="ContractNumber"  placeholder="Numar Contract" /><br />
                <input id="inputAreaNumber" type="text" name="AreaNumber"  placeholder="Numar Area" /><br />
                <p>Incepand cu data de: </p>
                <input id="inputStartDate" type="text" class="datepicker" name="StartDate" placeholder="Incepand" /><br />
                <p>Pana la data de</p>
                <input id="inputEndDate" type="text" class="datepicker" name="EndDate" placeholder="Pana" /><br />
                <button class="cautaProprietar" style="background-color:#424852;">Cauta proprietar</button>
                <input type="text" value="Proprietar" disabled="true" />
            </div>

            <div id="showOwner" style="display: none">
                <br />
                <input type="text" value="Nume"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)" />
                <br />
                <input type="text" value="Adresa"
                   onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />

            </div>

            <button id="btnPopupEdit">Modifica</button> 
            <p id="titleEditPopup" style="display:none;">Editeaza contractul</p>
            <div id="editDiv" style="display: none">
                 <input id="editInfocetNumber" type="text" name="InfocetNumber"  placeholder="Numar Infocet" /><br />
                <input id="editContractNumber" type="text" name="ContractNumber"  placeholder="Numar Contract" /><br />             
                 <input id="editAreaNumber" type="text" name="AreaNumber"  placeholder="Numar Area" /><br />
                 
                <p>Incepand cu data de: </p>
                <input id="editStartDate" type="text" class="datepicker" name="StartDate" placeholder="Incepand" /><br />
                <p>Pana la data de</p>
                <input id="editEndDate" type="text" class="datepicker" name="EndDate" placeholder="Pana" /><br />
                
                <button class="cautaProprietar" style="background-color:#424852;">Cauta proprietar</button>
                <input type="text" value="Proprietar" disabled="true" />

            </div>

        <div class="clear"></div>
        <br />
        <table id="contractContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nr. infocet</th>
                    <th class="textsort tableheading">Nr. contract</th>
                    <th class="categorysort tableheading">Proprietar</th>
                    <th class="levelsort tableheading">Nr. suprafata</th>
                    <th class="levelsort tableheading">Perioadă</th> <%--Data de inceput - Data de sfarsit--%>
                </tr>
        </table>
        <script id="contractTemplate" type="text/x-jquery-tmpl">
            <tr id="row${ContractId}">
                <td>${InfocetNumber}</td>
                <td>${Number}</td>            
                <td>${Area.Number}</td>
                <td>${StartDate}</td>
                <td>${EndDate}</td>
                <td>${Owner.Name}</td>
                <td>
                    <button class="btn btn-default" onclick="startEdit(${ContractId}); return false;">Modifică</button>
                </td>
            </tr>
        </script>
        <script src="/Scripts/ContractForm.js"></script>
    </div>
</asp:Content>
