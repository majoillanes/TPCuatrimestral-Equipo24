<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="estadisticas.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web19" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-progress {
            height: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center">
        <h2 style="color: #fff;">Estadísticas</h2>
    </div>

    <div>
        <img class="imageEstadisticas" src="Images/estadisticas.png" alt="Estadisticas">
    </div>

      <div class="container d-flex">
           <div class="container-left">
    <div class="container d-flex justify-content-center">
        <div class="col">
            <div class="card sombra">
                <div class="card-body">
                    <div class="card-body">
                        <h5 class="card-title">Porcentaje de álbum completado:</h5>
                        <div class="progress custom-progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="<%= Porcentaje %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= Porcentaje %>%"> <%= Porcentaje.ToString("00.00") %>%</div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
         <div class="container-right">
             <div class="container d-flex justify-content-center">
                <div class="card sombra">
                    <div class="card-body mx-auto">
                        <h5 class="card-title">Mis figuritas</h5>
                        <asp:Label ID="lblCantidadPegadas" runat="server" Text="Figuritas pegadas: "></asp:Label>
                        <br />
                        <asp:Label ID="lblCantidadFaltantes" runat="server" Text="Figuritas faltantes: "></asp:Label>
                        <br />
                        <asp:Label ID="lblCantidadNoPegadas" runat="server" Text="Figuritas disponibles: "></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
          </div>
    </div>
    
</asp:Content>
