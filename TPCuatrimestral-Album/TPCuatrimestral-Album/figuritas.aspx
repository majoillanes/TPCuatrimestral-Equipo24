<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="figuritas.aspx.cs" Inherits="TPCuatrimestral_Album.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-xl">
        <div class="row">
            <h1>Mis Figuritas</h1>
            <div class="row">
                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="mb-3">
                        <asp:CheckBox Text="Filtro Avanzado"
                            CssClass="" ID="chkAvanzado" runat="server"
                            AutoPostBack="true"
                            OnCheckedChanged="chkAvanzado_CheckedChanged" />
                    </div>
                </div>

                <%if (chkAvanzado.Checked)
                    { %>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                                        <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                            <asp:ListItem Text="" />
                                            <asp:ListItem Text="Equipo" />
                                            <asp:ListItem Text="Posicion" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Criterio" runat="server" />
                                        <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <%--            <div class="col-3">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" />
                    <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                </div>
            </div>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
                        <asp:Button Text="Limpiar" runat="server" CssClass="btn btn-light" ID="btnLimpiar" OnClick="btnLimpiar_Click" />

                    </div>
                </div>
            </div>
            <%} %>
        </div>
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
            <asp:Repeater ID="repeaterEquipos" runat="server">
                <ItemTemplate>
                    <div class="container d-flex justify-content-center mt-2">
                        <div class="borde-figurita container d-flex justify-content-center align-items-center">
                            <div class="figurita-figurita d-flex flex-column">
                                <div class="imagen-figurita" style="background-image: url('<%# Eval("Equipo.Imagen") %>')"></div>
                                <div class="info-figurita d-flex flex-column">
                                    <div class="nombre-figurita d-flex justify-content-center">
                                        <p><b><%# Eval("Equipo.Nombre") %></b></p>
                                    </div>
                                    <div class="props-figurita">
                                        <ul>
                                            <li><%# Eval("Equipo.Alias") %></li>
                                            <li><%# Eval("Equipo.Ciudad") %></li>
                                            <li><%# Eval("Equipo.Fundacion") %></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="repeaterEstadios" runat="server">
                <ItemTemplate>
                    <div class="container d-flex justify-content-center mt-2">
                        <div class="borde-figurita container d-flex justify-content-center align-items-center">
                            <div class="figurita-figurita d-flex flex-column">
                                <div class="imagen-figurita" style="background-image: url('<%# Eval("Estadio.Imagen") %>')"></div>
                                <div class="info-figurita d-flex flex-column">
                                    <div class="nombre-figurita d-flex justify-content-center">
                                        <p><b><%# Eval("Estadio.Nombre") %></b></p>
                                    </div>
                                    <div class="props-figurita">
                                        <ul>
                                            <li><%# Eval("Estadio.Alias") %></li>
                                            <li><%# Eval("Estadio.Capacidad") %></li>
                                            <li><%# Eval("Estadio.Barrio") %></li>
                                            <li><%# Eval("Estadio.Calle") %></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <div class="container d-flex justify-content-center mt-4">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
        </div>
    </div>

</asp:Content>
