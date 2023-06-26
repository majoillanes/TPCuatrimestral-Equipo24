<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="paquete.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Abrir Paquete</h2>
        <img class="icon" src="Images/LogoLiga.png" alt="Banner">
    </div>

         <div>
          <img class="imageCard1" src="Images/joker-card.png" alt="JokerCard">
        <img class="imageBox1" src="Images/box.png" alt="Box">
    </div>

    <div class="container d-flex">
        <div class="container d-flex justify-content-center mt-4">
            <asp:Button ID="btnAbrir" runat="server" Text="Abrir Paquete" CssClass="btn btn-secondary" OnClick="btnAbrir_Click" />
        </div>

        <div class="container d-flex justify-content-center mt-4">
            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
