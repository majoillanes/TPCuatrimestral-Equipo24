<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="album.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web14" %>
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
        <h2 style="color:#fff;">Mi Album</h2>
   </div>
    <div class="d-flex justify-content-center mt-3">
        <div class="album d-flex justify-content-evenly align-items-center">
            <div class="pagina1 py-2">

                    <div class="container d-flex justify-content-around" style="height: 33.33%;">
                        <div class="borde-escudo d-flex justify-content-center align-items-center">
                          <div class="figurita-escudo d-flex flex-column">
                            <div class="imagen-escudo">
                            </div>
                            <div class="info-escudo d-flex flex-column">
                              <div class="nombre-escudo d-flex justify-content-center">
                                <p><b>River Plate</b></p>
                              </div>
                              <div class="props">
                                  <ul class="d-flex flex-row">
                                  <li class="mt-2">El millonario</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde-estadio d-flex justify-content-center align-self-center align-items-center">
                          <div class="figurita-estadio d-flex flex-column">
                            <div class="imagen-estadio">
                            </div>
                            <div class="info-estadio d-flex flex-column">
                              <div class="nombre-estadio d-flex justify-content-center mb-1">
                                <p><b>Monumental</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around">
                                  <li>83196</li>
                                  <li>Nuñez</li>
                                  <li>Av. Pres. Figueroa Alcorta 7597</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <div class="container d-flex justify-content-evenly" style="height: 33.33%;">
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <div class="container d-flex justify-content-around" style="height: 33.33%;">
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
            </div>
            <div class="pagina2 py-2">
                <div class="container d-flex justify-content-evenly" style="height: 33.33%;">
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                <div class="container d-flex justify-content-evenly" style="height: 33.33%;">
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                <div class="container d-flex justify-content-evenly" style="height: 33.33%;">
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="borde d-flex justify-content-center align-items-center">
                          <div class="figurita d-flex flex-column">
                            <div class="imagen">
                            </div>
                            <div class="info d-flex flex-column">
                              <div class="nombre d-flex justify-content-center">
                                <p><b>Franco Armani</b></p>
                              </div>
                              <div class="props">
                                <ul class="d-flex justify-content-around flex-column">
                                  <li>16/10/1986</li>
                                  <li>ARQ</li>
                                  <li>River</li>
                                  <li>Argentino</li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
</asp:Content>
