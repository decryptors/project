<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulAnualDeProgramareAInmormantarilor.aspx.cs"  MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulAnualDeProgramareAInmormantarilor"%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="entity">Registrul anual de programare a înmormântărilor</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th style="text-align: left;" class="textsort tableheading">Nume</th>
                    <th style="text-align: left;" class="categorysort tableheading">Prenume</th>
                    <th style="text-align: left;" class="levelsort tableheading">Religie</th>
                    <th style="text-align: left;" class="tagsort tableheading">Parcelă</th>
                    <th style="text-align: left;" class="questiontypesort tableheading">Dată</th>
                    <th style="text-align: left;" class="questiontypesort tableheading">Oră</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
