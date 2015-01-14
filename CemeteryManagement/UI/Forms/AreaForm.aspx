<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="/Forms/AreaForm.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.AreaForm"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Styles/PopupsStyle.css"/>
    <link href="/Styles/grids.css" rel="stylesheet" />
    
    <h2 class="entity">Morminte</h2>
    <br />
    <div class="content-wrapper">   
        <button id="btnPopupAdd" class="btn btn-default">Adauga</button> 
        <p id="titleAddPopup" style="display:none;">Adauga mormant</p>
        <div class="popup-overlay">
            <div id="addDiv" style="display: none">
                <select class="form-control">
                    <option value="Cimitir1">Cimitir 1</option>
                    <option value="Cimitir2">Cimitir 2</option>
                    <option value="Cimitir3">Cimitir 3</option>
                    <option value="Cimitir4">Cimitir 4</option>
                </select>
                <input class="form-control" type="text" value="Numarul mormantului"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)" />
                <input class="form-control" type="text" value="Suprafata"
                   onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <p>Alegeti fotografii</p>
                <input  class="form-control" type="file" alt="Adauga fotografii..."/>
                <button class="cautaProprietar" style="background-color:#424852;">Cauta contract</button>

            </div>

            <div id="showContract" style="display: none">
                <input type="text" value="Numar infocet"
                onblur="onBlur(this)"
                onfocus="onFocus(this)" />
                <input type="text" value="Numar contract"
                   onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <input type="text" value="Numarul mormantului"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)"  />
                <input type="text" value="Proprietar"
                    onblur="onBlur(this)"
                    onfocus="onFocus(this)"/>

            </div>
        </div>

        <button id="btnPopupEdit" class="btn btn-default">Modifica</button> 
        <p id="titleEditPopup" style="display:none;">Modifica datele mormantului</p>
        <div id="editDiv" style="display: none">
            <select class="form-control">
                <option value="Cimitir1">Cimitir 1</option>
                <option value="Cimitir2">Cimitir 2</option>
                <option value="Cimitir3">Cimitir 3</option>
                <option value="Cimitir4">Cimitir 4</option>
            </select>
            <input class="form-control" type="text" value="Numarul mormantului" />

            <input class="form-control" type="text" value="Suprafata" />
            <input class="form-control"  type="text" value="Numarul contractului" />
            <button class="cautaContract" style="background-color:#424852;">Cauta contract</button>
            <input  class="form-control" type="image" alt="Adauga fotografii..."/>

        </div>
 
        <div class="clear"></div>
        <br />
        <table id="areaContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Cimitir</th>
                    <th class="textsort tableheading">Nr. mormânt</th>
                    <th class="categorysort tableheading">Suprafaţă</th>
                    <th class="levelsort tableheading">Nr. contract</th>
                    <th class="levelsort tableheading">Construcţii</th>
                    <th class="tagsort tableheading">Fotografie</th>
                </tr>
        </table>
    </div>

</asp:Content>

