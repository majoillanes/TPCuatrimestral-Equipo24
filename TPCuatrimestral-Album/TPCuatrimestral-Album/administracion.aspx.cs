using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_Album
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnNacionalidadAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("nacionalidadAdmin.aspx", false);
        }

        protected void btnEquipoAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("equipoAdmin.aspx", false);
        }

        protected void btnEstadiosAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("estadiosAdmin.aspx", false);
        }

        protected void btnJugadoresAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("jugadoresAdmin.aspx", false);
        }
    }
}