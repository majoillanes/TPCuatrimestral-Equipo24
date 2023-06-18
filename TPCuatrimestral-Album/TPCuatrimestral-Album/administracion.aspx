<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="administracion.aspx.cs" Inherits="TPCuatrimestral_Album.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container container-menu d-flex justify-content-center align-items-center">
        <div class="col-6 d-flex flex-column mt-2 p-4">
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnNacionalidadAdmin" runat="server" Text="Administrar nacionalidades" onClick="btnNacionalidadAdmin_Click"/>

        </div>
    </div>
</asp:Content>
