<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ingreso.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex flex-column align-items-center">
        <div class="login col-4">
            <h2 style="text-align: center">Registrate o Inicia Sesión</h2>

            <form>
                <div class="row g-3 align-items-center p-3">
                    <div class="col">
                        <asp:Label ID="lblEmail" runat="server" CssClass="form-label">E-mail:</asp:Label>
                    </div>
                    <div class="col-auto">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" type="email"></asp:TextBox>
                    </div>
                </div>

                <div class="row g-3 align-items-center p-3">
                    <div class="col">
                        <asp:Label ID="lblPassword" runat="server" CssClass="form-label">Password:</asp:Label>
                    </div>
                    <div class="col-auto">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Type="password"></asp:TextBox>
                    </div>
                </div>
                <div class="d-flex justify-content-center pb-3">
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-light" onclick="btnIngresar_Click"/>
                </div>


            </form>
        </div>
    </div>
</asp:Content>
