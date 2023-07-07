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
            <asp:Repeater ID="repeaterJugadores" runat="server">
                <ItemTemplate>
                    <div class="container d-flex justify-content-center mt-2">
                        <div class="borde-figurita container d-flex justify-content-center align-items-center">
                            <div class="figurita-figurita d-flex flex-column">
                                <div class="imagen-figurita" style="background-image: url('<%# Eval("Jugador.Imagen") %>')"></div>
                                <div class="info-figurita d-flex flex-column">
                                    <div class="nombre-figurita d-flex justify-content-center">
                                        <p><b><%# Eval("Jugador.Nombres") %> <%# Eval("Jugador.Apellidos") %></b></p>
                                    </div>
                                    <div class="props-figurita">
                                        <ul>
                                             <li><%# Eval("Jugador.FechaDeNacimiento", "{0:dd/MM/yyyy}") %></li>
                                            <li><%# Eval("Jugador.Posicion.Descripcion") %></li>
                                            <li><%# Eval("Jugador.Equipo.Nombre") %></li>
                                            <li><%# Eval("Jugador.Nacionalidad.Gentilicio") %></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
        <%} %>
</asp:Content>
