<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="paquete.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web15" %>
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
        <h2 style="color:#fff;">Paquete Diario</h2>
   </div>

         <div>
          <img class="imageCard1" src="Images/joker-card.png" alt="JokerCard">
        <img class="imageBox1" src="Images/box.png" alt="Box">
    </div>

    <div class="container d-flex">
        <div class="container d-flex justify-content-center mt-4">
            <asp:Button ID="btnAbrir" runat="server" Text="Abrir Paquete" CssClass="btn btn-secondary" OnClick="btnAbrir_Click" />
        </div>

        <div class="container d-flex justify-content-center mt-4">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
