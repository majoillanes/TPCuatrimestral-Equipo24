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
            <span class="icon-descrip"><%= Usuario.Nombre %></span> 
            <span class="icon-descrip"><%= Usuario.Email %></span> 
            </div>
        <li>
            <a id="linkToCopy" href="inicio.aspx" onClick="CopyLinkToClipboard()" class="icons">
            <img class="icons" src="Images/amigos.png" alt="Invitar amigos">
                </a>
            <a id="linkToCopy2" href="inicio.aspx" onClick="CopyLinkToClipboard()" class="icons">
            <span class="icon-description">Invitar amigos</span>
                </a>
           
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
            <a href="EmailHelp.aspx" class="icons">
            <img class="icons" src="Images/help.png" alt="Help" >
                </a>
            <a href="EmailHelp.aspx"> 
            <span class="icon-description" >Help</span>
                </a>
 
        </li>
    </ul>

   
    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
<script>
    function CopyLinkToClipboard() {
        var link = document.getElementById("linkToCopy");
        var tempInput = document.createElement("input");
        tempInput.setAttribute("value", link.href);
        document.body.appendChild(tempInput);
        tempInput.select();
        document.execCommand("copy");
        document.body.removeChild(tempInput);
        alert("¡Enlace copiado al portapapeles!");
    }
</script>
</asp:Content>
