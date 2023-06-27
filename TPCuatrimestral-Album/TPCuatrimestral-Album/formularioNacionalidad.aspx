<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="formularioNacionalidad.aspx.cs" Inherits="TPCuatrimestral_Album.formularioNacionalidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-7">
                <div class="mb-3">
                    <label for="txtISO" class="form-label">ISO</label>
                    <asp:TextBox runat="server" ID="txtISO" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtPais" class="form-label">País: </label>
                    <asp:TextBox runat="server" ID="txtPaís" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtGentilicio" class="form-label">Gentilicio: </label>
                    <asp:TextBox runat="server" ID="txtGentilicio" CssClass="form-control"  />
                </div>
                <div class="mb-3">
                    <asp:Label CssClass="alert alert-danger d-flex justify-content-center" ID="lblError" runat="server" Text="Por favor complete todos los campos"></asp:Label>
                </div>
            </div>
            
            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                <asp:Button Text="Inactivar" ID="btnInactivar" OnClick="btnInactivar_Click" CssClass="btn btn-info" runat="server" />
                <a class="btn btn-light" href="nacionalidadAdmin.aspx">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
