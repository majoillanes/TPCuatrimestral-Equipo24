<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="paquete.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex justify-content-center">
        <h2 style="color: #fff;">Paquete Diario</h2>
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

    <%if (Mostrar)
        { %>


    <div class="container-xl mt-3">
        <div class="row row-cols-1 row-cols-sm-6 g-4 mt-2">
            <%--            <asp:Repeater ID="repeaterFiguritas" runat="server">
                <ItemTemplate>--%>
            <% foreach (dominio2.Figurita figurita in figuritas)
                { 
                if (EsJugador(figurita.IDFigurita) != -1)
                {            %>
            <div class="container d-flex justify-content-center mt-2">
                <div class="borde-figurita container d-flex justify-content-center align-figuritas-center">
                    <div class="figurita-figurita d-flex flex-column">
                        <div class="imagen-figurita" style="background-image: url('<%: ((dominio2.FiguritaJugador)figurita).Jugador.Imagen %>')"></div>
                        <div class="info-figurita d-flex flex-column">
                            <div class="nombre-figurita d-flex justify-content-center">
                                <p><b><%: ((dominio2.FiguritaJugador)figurita).Jugador.Nombres %></b> <b><%: ((dominio2.FiguritaJugador)figurita).Jugador.Apellidos%></b></p>
                            </div>
                            <div class="props-figurita">
                                <ul>
                                    <li><%: ((dominio2.FiguritaJugador)figurita).Jugador.Equipo.Nombre %></li>
                                    <li><%: ((dominio2.FiguritaJugador)figurita).Jugador.Posicion.Descripcion %></li>
                                    <li><%: ((dominio2.FiguritaJugador)figurita).Jugador.FechaDeNacimiento.ToString("dd/MM/yyyy") %></li>
                                    <li><%: ((dominio2.FiguritaJugador)figurita).Jugador.Nacionalidad.Gentilicio %></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

            <%}
                else if (EsEquipo(figurita.IDFigurita))
                {%>
            <div class="container d-flex justify-content-center mt-2">
                <div class="borde-figurita container d-flex justify-content-center align-figuritas-center">
                    <div class="figurita-figurita d-flex flex-column">
                        <div class="imagen-figurita" style="background-image: url('<%: ((dominio2.FiguritaEquipo)figurita).Equipo.Imagen %>')"></div>
                        <div class="info-figurita d-flex flex-column">
                            <div class="nombre-figurita d-flex justify-content-center">
                                <p><b><%: ((dominio2.FiguritaEquipo)figurita).Equipo.Nombre %></b></p>
                            </div>
                            <div class="props-figurita">
                                <ul>
                                    <li><%: ((dominio2.FiguritaEquipo)figurita).Equipo.Alias %></li>
                                    <li><%: ((dominio2.FiguritaEquipo)figurita).Equipo.Ciudad %></li>
                                    <li><%: ((dominio2.FiguritaEquipo)figurita).Equipo.Fundacion %></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%} else
                {            %>
            <div class="container d-flex justify-content-center mt-2">
                <div class="borde-figurita container d-flex justify-content-center align-figuritas-center">
                    <div class="figurita-figurita d-flex flex-column">
                        <div class="imagen-figurita" style="background-image: url('<%: ((dominio2.FiguritaEstadio)figurita).Estadio.Imagen %>')"></div>
                        <div class="info-figurita d-flex flex-column">
                            <div class="nombre-figurita d-flex justify-content-center">
                                <p><b><%: ((dominio2.FiguritaEstadio)figurita).Estadio.Nombre %></b></p>
                            </div>
                            <div class="props-figurita">
                                <ul>
                                    <li><%: ((dominio2.FiguritaEstadio)figurita).Estadio.Alias %></li>
                                    <li><%: ((dominio2.FiguritaEstadio)figurita).Estadio.Barrio %></li>
                                    <li><%: ((dominio2.FiguritaEstadio)figurita).Estadio.Capacidad %></li>
                                    <li><%: ((dominio2.FiguritaEstadio)figurita).Estadio.Calle %></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
            <%--                </ItemTemplate>
            </asp:Repeater>--%>
            <%} %>
        </div>
    </div>
    <% }
    %>
</asp:Content>
