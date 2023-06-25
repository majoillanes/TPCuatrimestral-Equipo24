<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="bonosRecompensas.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Bonos y Recompensas</h2>
        <img class="icon" src="Images/LogoLiga.png" alt="Banner">
    </div>
    <div>
        <img class="imageRecompensa" src="Images/recompensa.png" alt="Banner">
    </div>

    <div class="container-box">
  <ul class="list">
    <li>
      <div>
          <img class="imageCard" src="Images/joker-card.png" alt="JokerCard">
        <img class="imageBox" src="Images/box.png" alt="Box">
    </div>
        </li>
      <li>
 
      <div>
          <img class="imageCard" src="Images/joker-card.png" alt="JokerCard">
        <img class="imageBox" src="Images/box.png" alt="Box">
    </div>
        </li>
      <li>
      <div>
          <img class="imageCard" src="Images/joker-card.png" alt="JokerCard">
        <img class="imageBox" src="Images/box.png" alt="Box">
    </div>
        </li>
        </ul>
</div>
    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
</asp:Content>
