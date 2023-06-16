<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ingreso.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <h2>Registrate o Inicia Sesión</h2>
    <form>
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <asp:Label ID="lblEmail" runat="server" CssClass="form-label">E-mail:</asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <asp:Label ID="lblPassword" runat="server" CssClass="form-label">Password:</asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox ID="txtPassword" runat="server" Cssclass="form-control" Type="password"></asp:TextBox>
            </div>
        </div>
        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-light" />
       

    </form>
       
</asp:Content>
