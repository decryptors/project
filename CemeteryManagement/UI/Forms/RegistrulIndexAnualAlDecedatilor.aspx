<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulIndexAnualAlDecedatilor.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulIndexAnualAlDecedatilor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul index anual al decedaților</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <%-- TODO: Decedat trebuie sa aiba Nume, Prenume --%>
                    <th class="textsort tableheading">Decedat</th>
                    <th class="categorysort tableheading">Cimitir</th>
                    <th class="categorysort tableheading">Parcelă</th>
                    <%-- parcela == nr mormant??? --%>
                    <th class="questiontypesort tableheading">Nr. mormânt</th>
                </tr>
        </table>
       
    </div>

</asp:Content>