<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="formularioJugador.aspx.cs" Inherits="TPCuatrimestral_Album.formularioJugador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Label runat="server" ID="lblID" AssociatedControlID="txtID" CssClass="form-label" Text="ID"></asp:Label>
                            <asp:TextBox runat="server" ID="txtID" CssClass="form-control" />
                            </div>
                <div class="mb-3">
                    <label for="txtNombres" class="form-label">Nombres: </label>
                    <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control" />
                </div>
                            <div class="mb-3">
                                <label for="txtApellidos" class="form-label">Apellidos: </label>
                                <asp:TextBox runat="server" ID="txtApellidos" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento: </label>
                                <asp:TextBox runat="server" ID="txtFechaNacimiento" CssClass="form-control" TextMode="Date" />
                            </div>
                            <div class="mb-3">
                                <label for="ddlEquipo" class="form-label">Equipo:</label>
                                <asp:DropDownList ID="ddlEquipo" CssClass="btn btn-info dropdown-toggl" runat="server"></asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="ddlNacionalidad" class="form-label">Nacionalidad:</label>
                                <asp:DropDownList ID="ddlNacionalidad" CssClass="btn btn-info dropdown-toggl" runat="server"></asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="ddlPosicion" class="form-label">Posicion:</label>
                                <asp:DropDownList ID="ddlPosicion" CssClass="btn btn-info dropdown-toggl" runat="server"></asp:DropDownList>
                            </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="col-6">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="mb-3">
                                    <label for="txtImagen" class="form-label">Imagen:</label>
                                    <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                        AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                                </div>
                                <asp:Image ImageUrl="https://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png"
                                    runat="server" ID="imgJugador" Width="60%" />
                                <%if (HayError)
                                    { %>
                                <div class="alert alert-danger mt-4 py-4 d-flex justify-content-center" role="alert">
                                    <p>Error. Por favor verificar todos los campos.</p>
                                </div>
                                <%} %>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="mb-3">
                        <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                        <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                        <a class="btn btn-light" href="jugadoresAdmin.aspx">Cancelar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
