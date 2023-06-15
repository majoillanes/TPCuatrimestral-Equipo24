<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TPCuatrimestral_Album.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvLista" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="IDFigurita" HeaderText="ID Figurita" />
        <asp:BoundField DataField="IDAlbum" HeaderText="ID Album" />
        <asp:BoundField DataField="Activo" HeaderText="Activo" />
        <asp:BoundField DataField="Pegada" HeaderText="Pegada" />
        <asp:TemplateField HeaderText="Jugador">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# Eval("Jugador.Nombres") %>'></asp:Label>
                <asp:Label runat="server" Text='<%# Eval("Jugador.Apellidos") %>'></asp:Label>
                <asp:Label runat="server" Text='<%# Eval("Jugador.Nacionalidad.Gentilicio") %>'></asp:Label>
                <asp:Label runat="server" Text='<%# Eval("Jugador.FechaDeNacimiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                <asp:Label runat="server" Text='<%# Eval("Jugador.Equipo.Nombre") %>'></asp:Label>
                <asp:Label runat="server" Text='<%# Eval("Jugador.Posicion.Descripcion") %>'></asp:Label>
                <br />
                <asp:Image runat="server" ImageUrl='<%# Eval("Jugador.Imagen") %>' Width="100" Height="100" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


</asp:Content>
