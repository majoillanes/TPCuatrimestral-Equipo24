<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ingreso.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--Registrarse-->
        <div class="container d-flex justify-content-center">
            <div class="container-left">
                <div class="container d-flex justify-content-center">
                    <div class="login col-8">
                        <h2 style="text-align: center">Registro</h2>
                        <div>
                            <div class="row g-2 align-items-center p-2">
                                <div class="col">
                                    <asp:Label ID="lblNombre" runat="server" CssClass="form-label" Text="Nombre:"></asp:Label>
                                </div>
                                <div class="col-auto">
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row g-2 align-items-center p-2">
                                <div class="col">
                                    <asp:Label ID="lblApellido" runat="server" CssClass="form-label" Text="Apellido:"></asp:Label>
                                </div>
                                <div class="col-auto">
                                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row g-2 align-items-center p-2">
                                <div class="col">
                                    <asp:Label ID="lblMailR" runat="server" CssClass="form-label" Text="EMail"></asp:Label>
                                </div>
                                <div class="col-auto">
                                    <asp:TextBox ID="txtMailRegistro" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row g-2 align-items-center p-2">
                                <div class="col">
                                    <asp:Label ID="lblPass" runat="server" CssClass="form-label" Text="Password"></asp:Label>
                                </div>
                                <div class="col-auto">
                                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" Type="password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row g-2 align-items-center p-2">
                                <div class="col">
                                    <asp:Label ID="lblConfirmPass" runat="server" CssClass="form-label" Text="Confirmar Password"></asp:Label>
                                </div>
                                <div class="col-auto">
                                    <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" Type="password"></asp:TextBox>
                                </div>
                            </div>
                            <%if (HayErrorRegistro)
                                    { %>
                                <div class="alert alert-danger mt-4 py-4 d-flex justify-content-center" role="alert">
                                    <p>Error. Por favor verificar todos los campos.</p>
                                </div>
                                <%} %>

                            <div class="d-flex justify-content-center pb-3">
                                <asp:Button ID="btnCrearCuenta" runat="server" Text="Crear Cuenta" CssClass="btn btn-secondary" OnClick="btnCrearCuenta_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
   
        <!--Iniciar sesion-->

        <div class="container-right">
            <div class="container d-flex justify-content-center">
                <div class="login col-10">
                    <h2 style="text-align: center">Iniciar Sesión</h2>
                    <div>
                        <div class="row g-2 align-items-center p-2">
                            <div class="col">
                                <asp:Label ID="lblEmail" runat="server" CssClass="form-label">E-mail:</asp:Label>
                            </div>
                            <div class="col-auto">
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" type="email"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row g-2 align-items-center p-2">
                            <div class="col">
                                <asp:Label ID="lblPassword" runat="server" CssClass="form-label">Password:</asp:Label>
                            </div>
                            <div class="col-auto">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Type="password"></asp:TextBox>
                            </div>
                        </div>
                        <%if (HayErrorIngreso)
                                    { %>
                                <div class="alert alert-danger mt-4 py-4 d-flex justify-content-center" role="alert">
                                    <p>Email o contraseña incorrectos, por favor verifique los datos ingresados.</p>
                                </div>
                                <%} %>
                        <div class="d-flex justify-content-center pb-3">
                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-secondary" OnClick="btnIngresar_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
 </div>


</asp:Content>
