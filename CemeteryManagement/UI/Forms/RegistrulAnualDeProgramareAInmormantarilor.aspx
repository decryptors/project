<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulAnualDeProgramareAInmormantarilor.aspx.cs"  MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulAnualDeProgramareAInmormantarilor"%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul anual de programare a înmormântărilor</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nume</th>
                    <th class="categorysort tableheading">Prenume</th>
                    <th class="levelsort tableheading">Religie</th>
                    <th class="tagsort tableheading">Parcelă</th>
                    <th class="questiontypesort tableheading">Dată</th>
                    <th class="questiontypesort tableheading">Oră</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
