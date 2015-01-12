<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulDeMorminteMonumenteFunerare.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulDeMorminteMonumenteFunerare" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul de morminte-monumete funerare</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th style="text-align: left;" class="textsort tableheading">Cimitir</th>
                    <th style="text-align: left;" class="categorysort tableheading">Parcelă</th>
                    <th rowspan='2' class="textsort tableheading">Cimitir</th>
                    <th rowspan='2' class="categorysort tableheading">Parcelă</th>
                    <%-- parcela == nr mormant??? --%>
                    <th rowspan='2' class="questiontypesort tableheading">Nr. mormânt</th>
                    <th rowspan='2' class="categorysort tableheading">Suprafață</th>
                    <th colspan='3' class="categorysort tableheading">Deținător</th>
                    <th colspan='3' class="questiontypesort tableheading">Persoană înhumată</th>
                    <th rowspan='2' class="questiontypesort tableheading">Observaţii</th>
                </tr>
                <tr>
                    <th>Nume</th>
                    <th>Prenume</th>
                    <th>Domiciliu</th>
                    <th>Nume</th>
                    <th>Prenume</th>
                    <th>Dată înhumare</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
