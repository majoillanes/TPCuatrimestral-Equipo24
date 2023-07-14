<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

   
      <div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Mi Perfil</h2>
   </div>
    
  <ul class="icons-right">
           <li>
            <img class="icon" src="Images/coins.png" alt="Monedas">
            <span class="icon-description"><%= Usuario.Monedas%></span>
        </li>


    </ul>
     
    <ul class="icon-list">
        <li>
            <img class="icons" src="Images/perfil.png" alt="Perfil">
        </li>
        <div class="descrip">
            <span class="icon-descrip"><%= Usuario.Nombre %></span> <!--Deberíamos traer de la base-->
            <span class="icon-descrip"><%= Usuario.Email %></span> <!--Deberíamos traer de la base-->
            </div>
        <li>
            <img class="icons" src="Images/amigos.png" alt="Invitar amigos">
            <span class="icon-description">Invitar amigos</span>
            <!--Hacemos un enlace a redes o que directamente copie enlace a la app?-->
        </li>
        <li>
            <img class="icons" src="Images/novedades.png" alt="Novedades">
            <span class="icon-description">Novedades</span>
            <!--Hacemos un enlace?-->
        </li>
        <li>
            <img class="icons" src="Images/estadisticas.png" alt="Estadísticas">
            <span class="icon-description">Estadísticas</span>
            <!--Lo dejo aunque no lo lleguemos a desarrollar pero queda lindo-->
        </li>
        <li>
            <img class="icons" src="Images/help.png" alt="Help">
            <span class="icon-description">Help</span>
            <!--Redireccionamos al form de contacto?-->
        </li>
    </ul>

   
    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
</asp:Content>
