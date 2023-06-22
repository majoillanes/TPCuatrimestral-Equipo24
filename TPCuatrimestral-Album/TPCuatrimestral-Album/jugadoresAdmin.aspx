<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="jugadoresAdmin.aspx.cs" Inherits="TPCuatrimestral_Album.jugadoresAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl mt-2 ">
        <asp:GridView ID="gvJugadores" runat="server" DataKeyNames="IDJugador"
            CssClass="table" AutoGenerateColumns="false"
            OnSelectedIndexChanged="gvJugadores_SelectedIndexChanged"
            OnPageIndexChanging="gvJugadores_PageIndexChanging"
            AllowPaging="True" PageSize="5">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="IDJugador" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombres" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellidos" />
                <asp:BoundField HeaderText="Fecha de nacimiento" DataField="FechaDeNacimiento" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField HeaderText="Nacionalidad" DataField="Nacionalidad.Gentilicio" />
                <asp:BoundField HeaderText="Equipo" DataField="Equipo.Nombre" />
                <asp:BoundField HeaderText="Posicion" DataField="Posicion.Descripcion" />
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <asp:Image ID="imgEquipo" runat="server" ImageUrl='<%# Eval("Imagen") %>' Width="100" Height="100" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Activo" DataField="Activo" />
                <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
            </Columns>
        </asp:GridView>
        <a href="formularioJugador.aspx" class="btn btn-primary">Agregar</a>
        <a href="administracion.aspx" class="btn btn-light">Volver</a>
    </div>
</asp:Content>
