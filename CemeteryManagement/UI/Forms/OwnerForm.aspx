<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


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

</asp:Content>


