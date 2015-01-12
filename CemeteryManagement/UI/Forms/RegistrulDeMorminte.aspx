<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulDeMorminte.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulDeMorminte" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul de morminte</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th rowspan='2' class="textsort tableheading">Cimitir</th>
                    <th rowspan='2' class="categorysort tableheading">Parcelă</th>
                    <th colspan='3' class="categorysort tableheading">Deținător</th>
                    <th rowspan='2' class="questiontypesort tableheading">Nr. chitanţă</th>
                    <%-- Pentru fiecare persoana inmormantata trebuie Nume, Prenume, Data inmormantarii 
                         subgrid? cu persoane inmormantate, popup? --%>                 
                    <th rowspan='2' class="questiontypesort tableheading">Persoane înhumate</th>
                    <th rowspan='2' class="questiontypesort tableheading">Observaţii</th>
                </tr>
                <tr>
                    <th class="questiontypesort tableheading">Nume</th>
                    <th class="questiontypesort tableheading">Prenume</th>
                    <th class="questiontypesort tableheading">Domiciliu</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
