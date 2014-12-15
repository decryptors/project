<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>

 <button id="btnPopupAdd">Adauga</button> 
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
        <input type="date" value="Data de inceput" />
        <p>Pana la data de</p>
        <input type="date" value="Data de sfarsit"  />
        <button id="cautaProprietar">Cauta proprietar</button>
        
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
        <br />
        <input type="text" value="Numar infocet"
            onblur="onBlur(this)"
            onfocus="onFocus(this)" />
        <br />
        <input type="text" value="Numar contract"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
        <br />
        <input type="text" value="Proprietar"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
        <br />
        <input type="text" value="Numarul mormantului"
            onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
        <br />
        <input type="date" value="Data de inceput" />
        <br />
        <input type="date" value="Data de sfarsit"  />
        <br />
        
    </div>

</asp:Content>


