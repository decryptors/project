<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="stylesheet" href="Styles/PopupsStyle.css"/>

    <button id="btnPopupAdd">Adauga</button> 
    <p id="titleAddPopup" style="display:none;">Adauga mormant</p>
    <div id="addDiv" style="display: none">
        <select>
            <option value="Cimitir1">Cimitir 1</option>
            <option value="Cimitir2">Cimitir 2</option>
            <option value="Cimitir3">Cimitir 3</option>
            <option value="Cimitir4">Cimitir 4</option>
        </select>
        <input type="text" value="Numarul mormantului"
            onblur="onBlur(this)"
            onfocus="onFocus(this)" />
        <input type="text" value="Suprafata"
           onblur="onBlur(this)"
            onfocus="onFocus(this)"  />
        <button id="cautaContract"">Cauta contract</button>
        <input type="image" alt="Adauga fotografii..."/>
        
    </div>
    
    <div id="showContract" style="display: none">
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

    <button id="btnPopupEdit">Modifica</button> 
    <p id="titleEditPopup" style="display:none;">Modifica datele mormantului</p>
    <div id="editDiv" style="display: none">
        <br />
        <select>
            <option value="Cimitir1">Cimitir 1</option>
            <option value="Cimitir2">Cimitir 2</option>
            <option value="Cimitir3">Cimitir 3</option>
            <option value="Cimitir4">Cimitir 4</option>
        </select>
        <br />
        <input type="text" value="Numarul mormantului" />
        <br />
        <input type="text" value="Suprafata" />
        <br />
        <input type="text" value="Numarul contractului" />
        <br />
        <input type="image" alt="Adauga fotografii..."/>
        
    </div>


</asp:Content>

