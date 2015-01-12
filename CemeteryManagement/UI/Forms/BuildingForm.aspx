<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>

<%--Should be removed!--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <button id="btnPopupAdd">Adauga</button> 
    <p id="titleAddPopup" style="display:none;">Adauga constructie</p>
    <div id="addDiv" style="display: none">
        
        Constructie istorica
        <input type="checkbox"/>
         <input type="text" value="Tipul constructiei"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
    </div>
    
    <button id="btnPopupEdit">Modifica</button> 
    <p id="titleEditPopup" style="display:none;">Editeaza constructia</p>
    <div id="editDiv" style="display: none">
        Constructie istorica
        <input type="checkbox"/>
        <input type="text" value="Tipul constructiei"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
    </div>

</asp:Content>

