<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="intercambio.aspx.cs" Inherits="TPCuatrimestral_Album.Formulario_web16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="container d-flex justify-content-center">
        <h2 style="color:#fff;">Intercambio</h2>
   </div>

    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 10px;
            margin-left: 5%;
        }

        .figurita {
            background-color: #ccc;
            height: 15em;
            width: 10em;
            text-align: center;
        }

        .container-right {
            margin-top: 20px;
            top: 0;
            right: 0;
            left: auto;
            padding: 10px;
            text-align: right;
            align-content: flex-start;
        }

        .container-left {
            margin-top: 20px;
            top: 0;
            right: 0;
            left: auto;
            padding: 10px;
            text-align: left;
            align-content: flex-start;
        }
    </style>

    <div class="container d-flex">
        <div class="container-left">

            <div class="container d-flex justify-content-center">
                <h2 style="color: #fff ;">Mis figuritas</h2>

            </div>

            <div class="grid-container d-flex justify-content-left mt-4">
                <div class="figurita">Figurita 1</div>
                <div class="figurita">Figurita 2</div>
                <div class="figurita">Figurita 3</div>
            </div>

            <div class="grid-container d-flex justify-content-left mt-4">
                <div class="figurita">Figurita 4</div>
                <div class="figurita">Figurita 5</div>
                <div class="figurita">Figurita 6</div>
            </div>

            <div class="grid-container d-flex justify-content-left mt-4">
                <div class="figurita">Figurita 7</div>
                <div class="figurita">Figurita 8</div>
                <div class="figurita">Figurita 9</div>
            </div>

        </div>
        <div class="container-right">
            <div class="container d-flex justify-content-center">
                <h2 style="color: #fff;">Figuritas repetidas para intercambiar</h2>

            </div>

            <div class="grid-container d-flex justify-content-left mt-4">
                <div class="figurita">Figurita 1</div>
                <div class="figurita">Figurita 2</div>
                <div class="figurita">Figurita 3</div>
            </div>

            <div class="grid-container d-flex justify-content-left mt-4">
                <div class="figurita">Figurita 4</div>
                <div class="figurita">Figurita 5</div>
                <div class="figurita">Figurita 6</div>
            </div>

            <div class="grid-container d-flex justify-content-left mt-4">
                <div class="figurita">Figurita 7</div>
                <div class="figurita">Figurita 8</div>
                <div class="figurita">Figurita 9</div>
            </div>

        </div>
    </div>
    <div class="container d-flex">
    <div class="container d-flex justify-content-center mt-4">
    <asp:Button ID="bntIntercambiar" runat="server" Text="Intercambiar" CssClass="btn btn-secondary" OnClick="bntIntercambiar_Click"/>
</div>
    <div class="container d-flex justify-content-center mt-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" OnClick="btnVolver_Click" />
    </div>
        </div>
</asp:Content>
