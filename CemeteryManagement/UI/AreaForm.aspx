<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AreaForm.aspx.cs" MasterPageFile="~/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <button id="btnPopup">Add</button> 
    <div id="dialog" style="display: none">
        This is a simple popup
    </div>
    <div id="modal_dialog" style="display: none">
        This is a Modal Background popup
    </div>
    <asp:Button ID="btnModalPopup" runat="server" Text="Show Modal Popup" />
    

</asp:Content>

