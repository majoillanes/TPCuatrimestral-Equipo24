<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="administracion.aspx.cs" Inherits="TPCuatrimestral_Album.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="menu.aspx">
        <img class="icon" src="Images/LogoLiga.png" alt="Banner">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="menu.aspx">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="perfil.aspx">Mi Perfil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="album.aspx">Album</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="paquete.aspx">Paquete diario</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="figuritas.aspx">Figuritas</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="intercambio.aspx">Intercambio</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="bonosRecompensas.aspx">Bonos y Recompensas</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="tienda.aspx">Tienda</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="estadisticas.aspx">Estadísticas</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="administracion.aspx">Administración</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="#">Log Out</a>
            </li>
        </ul>
    </div>
</nav>
      <div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Administración</h2>
   </div>
    <div class="container container-menu d-flex justify-content-center align-items-center">
        <div class="col-6 d-flex flex-column mt-2 p-4">
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnNacionalidadAdmin" runat="server" Text="Administrar nacionalidades" onClick="btnNacionalidadAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnEquipoAdmin" runat="server" Text="Administrar equipos" OnClick="btnEquipoAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnEstadiosAdmin" runat="server" Text="Administrar estadios" OnClick="btnEstadiosAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnJugadoresAdmin" runat="server" Text="Administrar jugadores" OnClick="btnJugadoresAdmin_Click"/>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click"/>
        </div>
    </div>
</asp:Content>