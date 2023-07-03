<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="estadisticas.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
      <div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Estadísticas</h2>
   </div>

    <div>
        <img class="imageEstadisticas" src="Images/estadisticas.png" alt="Estadisticas">
        </div>

      <style>
        .star-icon {
            color: gold;
        }
    </style>
    
   <table>
    <tr>
        <td><i class="fas fa-star star-icon"></i> Porcentaje de álbum completado:</td>
        <td><% Response.Write(" "); %></td>
    </tr>
    <tr>
        <td><i class="fas fa-star star-icon"></i> Cantidad de figuritas vendidas:</td>
        <td><% Response.Write(" "); %></td>
    </tr>
    <tr>
        <td><i class="fas fa-star star-icon"></i> Cantidad de figuritas compradas:</td>
        <td><% Response.Write(" "); %></td>
    </tr>
    <tr>
        <td><i class="fas fa-star star-icon"></i> Cantidad de figuritas intercambiadas:</td>
        <td><% Response.Write(" "); %></td>
    </tr>
    <tr>
        <td><i class="fas fa-star star-icon"></i> Ranking de usuarios:</td>
        <td><% Response.Write(" "); %></td>
    </tr>
</table>


    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
</asp:Content>
