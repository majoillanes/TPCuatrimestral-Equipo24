<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="estadiosAdmin.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web110" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl mt-2 ">
        <asp:GridView ID="gvEstadios" runat="server" DataKeyNames="ID" CssClass="table " AutoGenerateColumns="false" OnSelectedIndexChanged="gvEstadios_SelectedIndexChanged" OnPageIndexChanging="gvEstadios_PageIndexChanging" AllowPaging="true" PageSize="5">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Alias" DataField="Alias" />
                <asp:BoundField HeaderText="Capacidad" DataField="Capacidad" />
                <asp:BoundField HeaderText="Barrio" DataField="Barrio" />
                <asp:BoundField HeaderText="Calle" DataField="Calle" />
                <asp:ImageField HeaderText="Imagen" DataImageUrlField="Imagen" ControlStyle-CssClass="img-fluid img-thumbnail" ControlStyle-Height="100px" />
                <asp:CheckBoxField HeaderText="Estado" DataField="Activo"/>
                <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
            </Columns>
        </asp:GridView>

        <a href="formularioEstadio.aspx" class="btn btn-primary">Agregar</a>
        <a href="administracion.aspx" class="btn btn-light">Volver</a>
    </div>
</asp:Content>

