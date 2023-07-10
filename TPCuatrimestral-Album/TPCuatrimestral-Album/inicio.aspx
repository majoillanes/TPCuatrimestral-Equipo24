<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2 class="titulo-bienvenida">Bienvenidos al album de </h2>
        <div class="d-flex">
            <asp:Image Class="ImageInicio" ID="ImageInicio" runat="server" src="Images/LogoLiga.png" />
        </div>
        <div class="d-flex justify-content-center">
        <asp:Button CssClass="btn-ing btn btn-light" ID="btnIngresar" runat="server" Text="Ingresar" onclick="btnIngresar_Click"/>
            </div>
    </div>
</asp:Content>
