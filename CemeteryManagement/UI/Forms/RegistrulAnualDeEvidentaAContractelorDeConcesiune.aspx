<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulAnualDeEvidentaAContractelorDeConcesiune.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulAnualDeEvidentaAContractelorDeConcesiune" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="entity">Registrul anual de evidenţă a contractelor de concesiune</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th style="text-align: left;" class="textsort tableheading">Nr. curent</th>
                    <th style="text-align: left;" class="categorysort tableheading">Nr. eliberării contractului</th>
                    <th style="text-align: left;" class="categorysort tableheading">Data eliberării contractului</th>
                    <th style="text-align: left;" class="categorysort tableheading">Nume</th>
                    <th style="text-align: left;" class="categorysort tableheading">Prenume</th>
                    <th style="text-align: left;" class="categorysort tableheading">Adresă</th>
                </tr>
        </table>
       
    </div>

</asp:Content>