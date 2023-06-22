<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="nacionalidadAdmin.aspx.cs" Inherits="TPCuatrimestral_Album.nacionalidadAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xl mt-2 ">
        <asp:GridView ID="gvNacionalidades" runat="server" DataKeyNames="ISO"
            CssClass="table" AutoGenerateColumns="false"
            OnSelectedIndexChanged="gvNacionalidades_SelectedIndexChanged"
            OnPageIndexChanging="gvNacionalidades_PageIndexChanging"
            AllowPaging="True" PageSize="5">
            <Columns>
                <asp:BoundField HeaderText="ISO Nacionalidad" DataField="ISO" />
                <asp:BoundField HeaderText="País" DataField="Pais" />
                <asp:BoundField HeaderText="Gentilicio" DataField="Gentilicio" />
                <asp:CheckBoxField HeaderText="Estado" DataField="Activo"/>
                <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
            </Columns>
        </asp:GridView>
        <a href="formularioNacionalidad.aspx" class="btn btn-primary">Agregar</a>
        <a href="administracion.aspx" class="btn btn-light">Volver</a>
    </div>
</asp:Content>
