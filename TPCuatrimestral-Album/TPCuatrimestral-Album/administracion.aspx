<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="administracion.aspx.cs" Inherits="TPCuatrimestral_Album.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex justify-content-center mt-2">
        <h2 style="color:#fff;">Administración</h2>
        <img class="icon" src="Images/LogoLiga.png" alt="Banner">
    </div>
    <div class="container container-menu d-flex justify-content-center align-items-center">
        <div class="col-6 d-flex flex-column mt-2 p-4">
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnNacionalidadAdmin" runat="server" Text="Administrar nacionalidades" onClick="btnNacionalidadAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnEquipoAdmin" runat="server" Text="Administrar equipos" OnClick="btnEquipoAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnEstadiosAdmin" runat="server" Text="Administrar estadios" OnClick="btnEstadiosAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnJugadoresAdmin" runat="server" Text="Administrar Jugadores" OnClick="btnJugadoresAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click"/>
        </div>
    </div>
</asp:Content>