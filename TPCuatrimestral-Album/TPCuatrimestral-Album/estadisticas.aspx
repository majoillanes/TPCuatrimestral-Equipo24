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

    <div class="row row-cols-1 row-cols-md-3 g-4">
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
    </div>
</asp:Content>
