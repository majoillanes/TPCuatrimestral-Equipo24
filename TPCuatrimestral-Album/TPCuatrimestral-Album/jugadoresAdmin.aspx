﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="jugadoresAdmin.aspx.cs" Inherits="TPCuatrimestral_Album.jugadoresAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-xl mt-2 ">
            <div class="row">
    <h1>Listado de jugadores</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server"></asp:Label>
                <asp:TextBox runat="server" ID="txtFiltroR" CssClass="form-control" AutoPostBack="true" OnTextChanged="FiltroR_TextChanged"></asp:TextBox>
            </div>
        </div>
    </div>

    </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gvJugadores" runat="server"
                    AllowPaging="True"
                    AutoGenerateColumns="false" CssClass="table table-hover align-middle text-center"
                    DataKeyNames="IDJugador"
                    OnPageIndexChanging="gvJugadores_PageIndexChanging"
                    OnSelectedIndexChanged="gvJugadores_SelectedIndexChanged"
                    PageSize="5">
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
                        <asp:CheckBoxField HeaderText="Estado" DataField="Activo" />
                        <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍" />
                    </Columns>
                </asp:GridView>
                <a href="formularioJugador.aspx" class="btn btn-primary">Agregar</a>
                <a href="administracion.aspx" class="btn btn-light">Volver</a>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
