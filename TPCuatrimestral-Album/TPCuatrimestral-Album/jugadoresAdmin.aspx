<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="jugadoresAdmin.aspx.cs" Inherits="TPCuatrimestral_Album.jugadoresAdmin" %>

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
                                <div class="col-3">
                                    <div class="mb-3">
                                        <asp:Label Text="Estado" runat="server" />
                                        <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                                            <asp:ListItem Text="Todos" />
                                            <asp:ListItem Text="Activo" />
                                            <asp:ListItem Text="Inactivo" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
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
        <div>
            <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
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
            <%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </div>

</asp:Content>
