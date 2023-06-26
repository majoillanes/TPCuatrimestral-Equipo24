<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container d-flex justify-content-center mt-2">
        <h2 style="color:#fff;">Menú Principal</h2>
        <img class="icon" src="Images/LogoLiga.png" alt="Banner">
    </div>
    <div class="container container-menu d-flex justify-content-center align-items-center">
        <div class="col-6 d-flex flex-column mt-2 p-4">
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnPerfil" runat="server" Text="Perfil" onclick="btnPerfil_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnAlbum" runat="server" Text="Ver Album" onclick="btnAlbum_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnPaquete" runat="server" Text="Paquete diario" onclick="btnPaquete_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnFiguritas" runat="server" Text="Ver figuritas" onclick="btnFiguritas_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnIntercambiar" runat="server" Text="Intercambio" onclick="btnIntercambiar_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnBonosRecompensas" runat="server" Text="Bonos y recompensas" onclick="btnBonosRecompensas_Click"/>                             
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnTienda" runat="server" Text="Tienda" onclick="btnTienda_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnEstadisticas" runat="server" Text="Estadísticas" onclick="btnEstadisticas_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnAdministrador" runat="server" Text="Administración" onclick="btnAdministrador_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnSalir" runat="server" Text="Salir" onclick="btnSalir_Click"/>
        </div>
    </div>
</asp:Content>
