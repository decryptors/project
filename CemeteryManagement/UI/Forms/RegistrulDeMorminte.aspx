<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulDeMorminte.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulDeMorminte" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="entity">Registrul de morminte</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th rowspan='2' style="text-align: left;" class="textsort tableheading">Cimitir</th>
                    <th rowspan='2' style="text-align: left;" class="categorysort tableheading">Parcelă</th>
                    <%-- TODO: Detinator trebuie sa aiba Nume, Prenume, Domiciliu --%>
                    <th colspan='3' style="text-align: left;" class="categorysort tableheading">Deținător</th>
                    <th rowspan='2' style="text-align: left;" class="questiontypesort tableheading">Nr. chitanţă</th>
                    <%-- Pentru fiecare persoana inmormantata trebuie Nume, Prenume, Data inmormantarii 
                         subgrid? cu persoane inmormantate, popup? --%>
                    <th rowspan='2' style="text-align: left;" class="questiontypesort tableheading">Persoane înmormântate</th>
                    <th rowspan='2' style="text-align: left;" class="questiontypesort tableheading">Observaţii</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
