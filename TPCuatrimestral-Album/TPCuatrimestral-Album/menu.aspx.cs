using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_Album
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFiguritas_Click(object sender, EventArgs e)
        {
            Response.Redirect("figuritas.aspx", false);
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("perfil.aspx", false);
        }

        protected void btnAlbum_Click(object sender, EventArgs e)
        {
            Response.Redirect("album.aspx", false);
        }

        protected void btnPaquete_Click(object sender, EventArgs e)
        {
            Response.Redirect("paquete.aspx", false);
        }

        protected void btnIntercambiar_Click(object sender, EventArgs e)
        {
            Response.Redirect("intercambio.aspx", false);
        }

        protected void btnBonosRecompensas_Click(object sender, EventArgs e)
        {
            Response.Redirect("bonosRecompensas.aspx", false);
        }

        protected void btnTienda_Click(object sender, EventArgs e)
        {
            Response.Redirect("tienda.aspx", false);
        }

        protected void btnEstadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("estadisticas.aspx", false);
        }
        
        protected void btnAdministrador_Click(object sender, EventArgs e)
        {
            Response.Redirect("administracion.aspx", false);
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("ingreso.aspx", false);
        }
    }
}