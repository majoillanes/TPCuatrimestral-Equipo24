<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="TPCuatrimestral_Album.error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Error</h3>
    <asp:Label Text="text" ID="lblError" runat="server" />
    <br />
    <button class="btn btn-primary" style="display: block;">
        <a href="menu.aspx" style="text-decoration: none; color: white;">Volver</a>
    </button>
</asp:Content>
