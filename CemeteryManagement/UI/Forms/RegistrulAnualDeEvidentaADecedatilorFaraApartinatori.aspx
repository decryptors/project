<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulAnualDeEvidentaADecedatilorFaraApartinatori.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulAnualDeEvidentaADecedatilorFaraApartinatori" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul anual de evidenţă a decedaţilor fără aparţinători</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Adeverinţă de înhumare</th>
                    <th class="categorysort tableheading">Solicitare din partea IML/Asistenţă socială</th>
                    <th class="categorysort tableheading">Hartă</th>
                </tr>
        </table>
       
    </div>

</asp:Content>
