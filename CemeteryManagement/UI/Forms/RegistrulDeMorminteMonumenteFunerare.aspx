<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulDeMorminteMonumenteFunerare.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulDeMorminteMonumenteFunerare" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="entity">Registrul de morminte-monumete funerare</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th style="text-align: left;" class="textsort tableheading">Cimitir</th>
                    <th style="text-align: left;" class="categorysort tableheading">Parcelă</th>
                    <%-- parcela == nr mormant??? --%>
                    <th style="text-align: left;" class="questiontypesort tableheading">Nr. mormânt</th>
                    <th style="text-align: left;" class="categorysort tableheading">Suprafață</th>
                    <%-- TODO: Detinator trebuie sa aiba Nume, Prenume, Domiciliu --%>
                    <th style="text-align: left;" class="categorysort tableheading">Deținător</th>
                    <%-- TODO: Persoana inmormantata trebuie sa aiba Nume, Prenume, Data inmormantarii 
                         subgrid? cu persoane inmormantate, popup? --%>
                    <th style="text-align: left;" class="questiontypesort tableheading">Persoană înmormântată</th>
                    <th style="text-align: left;" class="questiontypesort tableheading">Observaţii</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
