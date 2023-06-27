<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="formularioEquipo.aspx.cs" Inherits="TPCuatrimestral_Album.formularioEquipo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <asp:Label runat="server" ID="lblID" AssociatedControlID="txtID" CssClass="form-label" Text="ID"></asp:Label>
                    <asp:TextBox runat="server" ID="txtID" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre: </label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtAlias" class="form-label">Alias: </label>
                    <asp:TextBox runat="server" ID="txtAlias" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtCiudad" class="form-label">Ciudad: </label>
                    <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtFundacion" class="form-label">Fundación: </label>
                    <asp:TextBox runat="server" ID="txtFundacion" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="ddlEstadio" class="form-label">Estadio</label>
                    <asp:DropDownList ID="ddlEstadio" CssClass="btn btn-info dropdown-toggl" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="txtImagen" class="form-label">Imagen:</label>
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                        </div>
                        <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                            runat="server" ID="imgEquipo" Width="60%" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="mb-3">
                <%--                    Cuando se dispara el error, se va de gira el tamaño de los textbox--%>
                <asp:Label CssClass="alert alert-danger d-flex justify-content-center" ID="lblError" runat="server" Text="Por favor complete los campos obligatorios"></asp:Label>
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Inactivar" ID="btnInactivar" OnClick="btnInactivar_Click" CssClass="btn btn-info" runat="server" />
                <a class="btn btn-light" href="EquipoAdmin.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
