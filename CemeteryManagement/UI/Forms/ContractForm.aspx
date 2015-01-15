<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Contracte</h2>
    <br />
    <div class="content-wrapper">      
          <script>
          </script>

         <button id="btnPopupAdd" class="btn btn-default">Adauga</button> 
            <p id="titleAddPopup" style="display:none;">Adauga contract</p>
            <div id="addDiv" style="display: none">
                <input type="text" value="Numar infocet"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)" />
                <input type="text" value="Numar contract"
                   onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <input type="text" value="Numarul mormantului"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <p>Incepand cu data de: </p>
                <input type="text" class="datepicker"/>
                <p>Pana la data de</p>
                <input type="text" class="datepicker"/>
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

            <p id="titleEditPopup" style="display:none;">Editeaza contractul</p>
            <div id="editDiv" style="display: none">
                <input type="text" value="Numar infocet"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)" />
                <input type="text" value="Numar contract"
                   onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <input type="text" value="Numarul mormantului"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <p>Incepand cu data de: </p>
                <input type="text" class="datepicker"/>
                <p>Pana la data de</p>
                <input type="text" class="datepicker"/>
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
                    <th class="levelsort tableheading">Nr. mormânt</th>
                    <th class="levelsort tableheading">Perioadă</th> <%--Data de inceput - Data de sfarsit--%>
                </tr>
        </table>
    </div>
</asp:Content>
