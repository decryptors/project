<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrulCuEvidentaCererilorDeAtribuireALocurilorDeInhumare.aspx.cs" MasterPageFile="/Forms/cemetery-template.Master" Inherits="UI.Forms.RegistrulCuEvidentaCererilorDeAtribuireALocurilorDeInhumare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Styles/grids.css" rel="stylesheet" />

    <h2 class="entity">Registrul cu evidenţa cererilor de atribuire a locurilor de înhumare</h2>
    <br />
    <div class="content-wrapper">              
                
        <div class="clear"></div>
        <br />
        <table id="deceasedContainer" class="table table-stripped table-bordered">
                <tr>
                    <th class="textsort tableheading">Nr. curent</th>
                    <th class="categorysort tableheading">Data înregistrării</th>
                    <th class="categorysort tableheading">Nr. infocet</th>
                    <th class="categorysort tableheading">Stadiu de soluţionare</th>
                </tr>
        </table>
       
    </div>

</asp:Content>