<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="album.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex justify-content-center">
        <h2 style="color: #fff;">Mi Album</h2>
    </div>
    <asp:UpdatePanel ID="UPAlbum" runat="server">
        <ContentTemplate>
            <div class="d-flex justify-content-center mt-3">
                <div class="album d-flex flex-column justify-content-evenly align-items-center">
                    <div class="botones d-flex justify-content-evenly align-items-center">
                        <asp:LinkButton ID="AnteriorPagina" CssClass="boton" runat="server" OnClick="AnteriorPagina_Click"><</asp:LinkButton>
                        <div class="pagina1 d-flex flex-column justify-content-end py-2">

                            <div class="container d-flex justify-content-around" style="height: 33.33%;">
                                <div class="borde-escudo d-flex justify-content-center align-items-center">
                                    <div class="figurita-escudo d-flex flex-column align-items-center justify-content-center">
                                        <div class="circulo-figurita d-flex justify-content-center">
                                            <asp:Label ID="lblNumeroEscudo" runat="server" />
                                        </div>
                                        <%
                                        string numeroEquipo = lblNumeroEscudo.Text.ToString();
                                        FiguritaEquipo = FiguritasEquipos.Find(x => x.Ubicacion.ToString().Equals(numeroEquipo));
                                        if (FiguritaEquipo != null)
                                        {%>
                                        <div class="imagen">
                                        </div>
                                        <div class="info d-flex flex-column">
                                            <div class="nombre d-flex justify-content-center">
                                                <p><b><%= FiguritaEquipo.Equipo.Nombre %></b></p>
                                            </div>
                                            <div class="props">
                                                <ul class="d-flex justify-content-around flex-column">
                                                    <li><%= FiguritaEquipo.Equipo.Alias %></li>
                                                    <li><%= FiguritaEquipo.Equipo.Ciudad %></li>
                                                    <li><%= FiguritaEquipo.Equipo.Fundacion %></li>
                                                </ul>
                                            </div>
                                        </div>--
                                        <%} %>

                                        <%else
                                        {
                                            // Código si no se encuentra la figurita
                                        }
                                        %> 
                                        <%--<div class="imagen-escudo">
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
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="borde-estadio d-flex justify-content-center align-self-center align-items-center">
                                    <div class="figurita-estadio d-flex flex-column align-items-center justify-content-center">
                                        <div class="circulo-figurita d-flex justify-content-center">
                                            <asp:Label ID="lblNumeroEstadio" runat="server" />
                                        </div>
                                         <%
                                        string numeroEstadio = lblNumeroEstadio.Text.ToString();
                                        FiguritaEstadio = FiguritasEstadios.Find(x => x.Ubicacion.ToString().Equals(numeroEstadio));
                                        if (FiguritaEstadio != null)
                                        {%>
                                        <div class="imagen">
                                        </div>
                                        <div class="info d-flex flex-column">
                                            <div class="nombre d-flex justify-content-center">
                                                <p><b><%= FiguritaEstadio.Estadio.Nombre %></b></p>
                                            </div>
                                            <div class="props">
                                                <ul class="d-flex justify-content-around flex-column">
                                                    <li><%= FiguritaEstadio.Estadio.Alias %></li>
                                                    <li><%= FiguritaEstadio.Estadio.Capacidad %></li>
                                                    <li><%= FiguritaEstadio.Estadio.Barrio %></li>
                                                    <li><%= FiguritaEstadio.Estadio.Calle %></li>
                                                </ul>
                                            </div>
                                        </div>--
                                        <%} %>

                                        <%else
                                        {
                                            // Código si no se encuentra la figurita
                                        }
                                        %> 
                                        <%--<div class="imagen-estadio">
                                        </div>
                                        <div class="info-estadio d-flex flex-column">
                                            <div class="nombre-estadio d-flex justify-content-center mb-1">
                                                <p><b>Estadio Monumental</b></p>
                                            </div>
                                            <div class="props">
                                                <ul class="d-flex justify-content-around">
                                                    <li>16/10/1986</li>
                                                    <li>ARQ</li>
                                                    <li>River</li>
                                                    <li>Argentino</li>
                                                </ul>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="container d-flex justify-content-around" style="height: 33.33%;">
                                <%for (int i = 0; i < 2; i++)
                                    { %>


                                <div class="borde d-flex justify-content-center align-items-center">
                                    <div class="figurita d-flex flex-column align-items-center justify-content-center">
                                        <div class="circulo-figurita d-flex justify-content-center">
                                            <asp:Label ID="lblNumeroJugadorPagina1" runat="server"><%=JugadoresPagina1++ %></asp:Label>
                                        </div>
                                        <%
                                        int ubicacionJugadorPagina1 = JugadoresPagina1-1;
                                        Figurita = Figuritas.Find(x => x.Ubicacion == ubicacionJugadorPagina1);
                                        if (Figurita != null)
                                        {%>
                                        <div class="imagen">
                                        </div>
                                        <div class="info d-flex flex-column">
                                            <div class="nombre d-flex justify-content-center">
                                                <p><b><%= Figurita.Jugador.Nombres%> <%=Figurita.Jugador.Apellidos %></b></p>
                                            </div>
                                            <div class="props">
                                                <ul class="d-flex justify-content-around flex-column">
                                                    <li><%= Figurita.Jugador.FechaDeNacimiento.ToString("dd/MM/yyyy") %></li>
                                                    <li><%= Figurita.Jugador.Posicion.Codigo %></li>
                                                    <li><%= Figurita.Jugador.Equipo.Nombre %></li>
                                                    <li><%= Figurita.Jugador.Nacionalidad.Gentilicio %></li>
                                                </ul>
                                            </div>
                                        </div>--
                                        <%} %>

                                        <%else
                                        {
                                            // Código si no se encuentra la figurita
                                        }
                                        %> 

                                        <%--<div class="imagen">
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
                                        </div>--%>
                                    </div>
                                </div>
                                <%   } %>
                            </div>
                        </div>
                        <div class="pagina2" style="background-image: url('<% =Equipo.Imagen %>');">
                            <div class="opacidad-img py-2">
                                <% for (int i = 0; i < 3; i++)
                                    { %>
                                <div class="container d-flex justify-content-evenly" style="height: 33.33%;">

                                    <% for (int j = 0; j < 3; j++)
                                        { %>
                                    <div class="borde d-flex justify-content-center align-items-center">
                                        <div class="figurita d-flex flex-column align-items-center justify-content-center">
                                            <div class="circulo-figurita d-flex justify-content-center">
                                                <asp:Label ID="lblNumeroJugadorPagina2" runat="server"><%=JugadoresPagina2++ %></asp:Label>
                                            </div>
                                            <%
                                        int ubicacionJugadorPagina2 = JugadoresPagina2-1;
                                        Figurita = Figuritas.Find(x => x.Ubicacion == ubicacionJugadorPagina2);
                                        if (Figurita != null )
                                        {%>
                                        <div class="imagen">
                                        </div>
                                        <div class="info d-flex flex-column">
                                            <div class="nombre d-flex justify-content-center">
                                                <p><b><%= Figurita.Jugador.Nombres %> <%=Figurita.Jugador.Apellidos %></b></p>
                                            </div>
                                            <div class="props">
                                                <ul class="d-flex justify-content-around flex-column">
                                                    <li><%= Figurita.Jugador.FechaDeNacimiento.ToString("dd/MM/yyyy") %></li>
                                                    <li><%= Figurita.Jugador.Posicion.Codigo %></li>
                                                    <li><%= Figurita.Jugador.Equipo.Nombre %></li>
                                                    <li><%= Figurita.Jugador.Nacionalidad.Gentilicio %></li>
                                                </ul>
                                            </div>
                                        </div>--
                                        <%} %>

                                        <%else
                                        {
                                            // Código si no se encuentra la figurita
                                        }
                                        %> 
                                            <%--<div class="imagen">
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
                                            </div>--%>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <asp:LinkButton ID="SiguientePagina" CssClass="boton" runat="server" OnClick="SiguientePagina_Click">></asp:LinkButton>
                    </div>
                    <div class="circulo d-flex justify-content-center align-items-center">
                        <asp:Label ID="lblNumeroPagina" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
</asp:Content>
