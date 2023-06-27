<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="equipoAdmin.aspx.cs" Inherits="TPCuatrimestral_Album.equipoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl mt-2 ">
        <asp:GridView ID="gvEquipos" runat="server"
            AllowPaging="True"
            AutoGenerateColumns="false" CssClass="table table-hover align-middle text-center"
            DataKeyNames="ID"
            OnPageIndexChanging="gvEquipos_PageIndexChanging"
            OnSelectedIndexChanged="gvEquipos_SelectedIndexChanged"
            PageSize="5">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Alias" DataField="Alias" />
                <asp:BoundField HeaderText="Ciudad" DataField="Ciudad" />
                <asp:BoundField HeaderText="Fundacion" DataField="Fundacion" />
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>
                        <asp:Image ID="imgEquipo" runat="server" ImageUrl='<%# Eval("Imagen") %>' Width="100" Height="100" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField HeaderText="Estado" DataField="Activo"/>
                <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
            </Columns>
        </asp:GridView>
        <a href="formularioEquipo.aspx" class="btn btn-primary">Agregar</a>
        <a href="administracion.aspx" class="btn btn-light">Volver</a>
    </div>
</asp:Content>
