<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TPCuatrimestral_Album.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:GridView ID="gvLista" CssClass="table" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="IDFigurita" HeaderText="ID Figurita" />
            <asp:BoundField DataField="IDAlbum" HeaderText="ID Album" />
            <asp:BoundField DataField="Activo" HeaderText="Activo" />
            <asp:BoundField DataField="Pegada" HeaderText="Pegada" />
            <asp:TemplateField HeaderText="Nombres">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Jugador.Nombres") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apellidos">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Jugador.Apellidos") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nacionalidad">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Jugador.Nacionalidad.Gentilicio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha de Nacimiento">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Jugador.FechaDeNacimiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Equipo">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Jugador.Equipo.Nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Posicion">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("Jugador.Posicion.Descripcion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image runat="server" ImageUrl='<%# Eval("Jugador.Imagen") %>' Width="100" Height="100" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>--%>
    <div class="row row-cols-1 row-cols-sm-6 g-4 mt-4">
        <asp:Repeater ID="repeaterJugadores" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img class="card-img-top" src='<%# Eval("Jugador.Imagen") %>' alt="Imagen del jugador">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Jugador.Nombres") %> <%# Eval("Jugador.Apellidos") %></h5>
                            <p class="card-text"> <%# Eval("Jugador.Nacionalidad.Gentilicio") %></p>
                            <p class="card-text"><%# Eval("Jugador.FechaDeNacimiento", "{0:dd/MM/yyyy}") %></p>
                            <p class="card-text"><%# Eval("Jugador.Equipo.Nombre") %></p>
                            <p class="card-text"><%# Eval("Jugador.Posicion.Descripcion") %></p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>
