<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Cimitire</h2>
    <br />
    <div class="content-wrapper">      
        <button id="btnPopupAdd">Adauga</button> 
        <p id="titleAddPopup" style="display:none;">Adauga cimitir</p>
        <div id="addDiv" style="display: none">
            <input type="text" value="Nume"
                onblur="onBlur(this)"
                onfocus="onFocus(this)" />
            <input type="text" value="Adresa"
               onblur="onBlur(this)"
                onfocus="onFocus(this)"  />
             </div>

        <button id="btnPopupEdit">Modifica</button> 
        <p id="titleEditPopup" style="display:none;">Modifica datele cimitirului</p>
        <div id="editDiv" style="display: none">
            <input type="text" value="Nume"
                onblur="onBlur(this)"
                onfocus="onFocus(this)" />
            <input type="text" value="Adresa"
               onblur="onBlur(this)"
                onfocus="onFocus(this)"  />

        </div>

        <div class="clear"></div>
        <br />
        <table id="contractContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nume</th>
                    <th class="textsort tableheading">Adresă</th>
                </tr>
        </table>
    </div>
    
</asp:Content>


