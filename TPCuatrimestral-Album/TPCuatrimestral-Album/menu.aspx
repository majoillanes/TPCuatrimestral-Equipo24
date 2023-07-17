<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Inicio</h2>
        <img class="icon" src="Images/LogoLiga.png" alt="Banner">
    </div>
    <div class="container container-menu d-flex justify-content-center align-items-center">
        <div class="d-flex flex-column">
            <%if (dominio2.Usuario.EsUsuario(Usuario))
                {  %>

            <%--<asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnPerfil" runat="server" Text="Perfil" onclick="btnPerfil_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnAlbum" runat="server" Text="Ver Album" onclick="btnAlbum_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnPaquete" runat="server" Text="Paquete diario" onclick="btnPaquete_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnFiguritas" runat="server" Text="Ver figuritas" onclick="btnFiguritas_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnIntercambiar" runat="server" Text="Intercambio" onclick="btnIntercambiar_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnBonosRecompensas" runat="server" Text="Bonos y recompensas" onclick="btnBonosRecompensas_Click"/>                             
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnTienda" runat="server" Text="Tienda" onclick="btnTienda_Click"/>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnEstadisticas" runat="server" Text="Estadísticas" onclick="btnEstadisticas_Click"/>--%>
            <h1> Bienvenido/a</h1>   <div class="descrip">
            <span class="icon-descrip"><%= Usuario.Nombre %></span> 
            </div>

           <div class="container d-flex">
           <div class="container-left">
    <div class="container d-flex justify-content-center">
        <div class="col">
            <div class="card sombra">
                <div class="card-body">
                    <div class="card-body">
                        <h5 class="card-title">Porcentaje de álbum completado:</h5>
                        <div class="progress custom-progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="<%= Porcentaje %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= Porcentaje %>%"> <%= Porcentaje.ToString("00.00") %>%</div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
         <div class="container-right">
             <div class="container d-flex justify-content-center">
                <div class="card sombra">
                    <div class="card-body mx-auto">
                        <h5 class="card-title">Mis figuritas</h5>
                        <asp:Label ID="lblCantidadPegadas" runat="server" Text="Figuritas pegadas: "></asp:Label>
                        <br />
                        <asp:Label ID="lblCantidadFaltantes" runat="server" Text="Figuritas faltantes: "></asp:Label>
                        <br />
                        <asp:Label ID="lblCantidadNoPegadas" runat="server" Text="Figuritas disponibles: "></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
          </div>
    </div>
    

        <div class="container d-flex justify-content-center">
            <%} %>
            <%if (dominio2.Usuario.EsAdmin(Usuario))
        
                {  %>
             <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnAdministrador" runat="server" Text="Administración" onclick="btnAdministrador_Click"/> <%} %>
            <asp:Button CssClass="btn btn-light btn-menu my-1" ID="btnSalir" runat="server" Text="Salir" onclick="btnSalir_Click"/>
    </div>
        </div>
        </div>
</asp:Content>
