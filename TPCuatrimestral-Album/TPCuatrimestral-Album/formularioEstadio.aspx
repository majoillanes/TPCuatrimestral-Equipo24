<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="formularioEstadio.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Label for="txtID" ID="lblID" runat="server" Text="ID:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtID" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label for="txtNombre" ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label for="txtAlias" ID="lblAlias" runat="server" Text="Alias:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtAlias" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label for="txtCapacidad" ID="lblCapacidad" runat="server" Text="Capacidad:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtCapacidad" CssClass="form-control" TextMode="Number" AutoPostBack="true" />
                        </div>
                        <div class="mb-3">
                            <asp:Label for="txtBarrio" ID="lblBarrio" runat="server" Text="Barrio:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtBarrio" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <asp:Label for="txtCalle" ID="lblCalle" runat="server" Text="Calle:"></asp:Label>
                            <asp:TextBox runat="server" ID="txtCalle" CssClass="form-control" />
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="col-6">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="mb-3">
                                <asp:Label for="txtImagen" ID="lblImagen" runat="server" Text="Imagen:"></asp:Label>
                                <asp:TextBox runat="server" ID="txtImagen" CssClass="form-control mb-3" AutoPostBack="true" OnTextChanged="txtImagen_TextChanged" />
                                <asp:Image ImageUrl="Images/imagen_rota" ID="imgEstadios" Width="50%" runat="server" />
                                <%if (HayError)
                                    { %>
                                <div class="alert alert-danger mt-4 py-4 d-flex justify-content-center" role="alert">
                                    <p>Error. Por favor verificar todos los campos.</p>
                                </div>
                                <%} %>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="mb-3">
                    <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                    <asp:Button Text="Inactivar" ID="btnInactivar" OnClick="btnInactivar_Click" CssClass="btn btn-info" runat="server" />
                    <a class="btn btn-light" href="estadiosAdmin.aspx">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
