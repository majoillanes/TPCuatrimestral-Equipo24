<%@ Page Language="C#"MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmailHelp.aspx.cs" Inherits="TPCuatrimestral_Album.EmailHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <h2 style="color: #fff;">Envienos su duda</h2>
    </div>

    <div class="container d-flex justify-content-left">
        <div class="container-center">
            <div class="row g-2 align-items-center p-2">
                <div class="col">
                    <asp:Label CssClass="form-label" ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row g-2 align-items-center p-2">
                <div class="col">
                    <asp:Label CssClass="form-label" ID="lblCorreo" runat="server" Text="Correo:"></asp:Label>
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row g-2 align-items-center p-2">
                <div class="col">
                    <asp:Label CssClass="form-label" ID="lblAsunto" runat="server" Text="Asunto:"></asp:Label>
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row g-2 align-items-center p-2">
                <div class="col">
                    <asp:Label CssClass="form-label" ID="lblMensaje" runat="server" Text="Mensaje:"></asp:Label>
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-flex justify-content-center pb-2">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar Mensaje" CssClass="btn btn-secondary" OnClick="btnEnviar_Click" />
                </div>
            </div>
        </div>
    </div>
 <%if (Enviado)
     { %>           
 <div class="d-flex justify-content-center">
     <h1>¡Mensaje Enviado!</h1>
 </div>
    <%} %>

</asp:Content>
