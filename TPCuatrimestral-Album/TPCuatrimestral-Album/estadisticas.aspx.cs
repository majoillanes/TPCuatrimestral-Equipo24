using dominio2;
using Test;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_Album
{
    public partial class Formulario_web19 : System.Web.UI.Page
    {
        public int Completadas { get; set; }
        public int Porcentaje { get; set; } 
        public Usuario Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuario)Session["usuario"];
            FiguritaNegocio figuritaNegocio = new FiguritaNegocio();
            Completadas = figuritaNegocio.cantidadFiguiritasxUsuario(Usuario.Id);
            Porcentaje = (Completadas * 100) / 364;
            lblCantidadPegadas.Text += Completadas.ToString();
            int faltantes = 364 - Completadas;
            lblCantidadFaltantes.Text += " " + faltantes.ToString();
            lblCantidadNoPegadas.Text += figuritaNegocio.cantidadFiguiritasDisponibles(Usuario.Id);

        }

    }
}