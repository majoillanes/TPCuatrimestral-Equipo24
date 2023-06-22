using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class jugadoresAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           JugadorNegocio jugadorNegocio = new JugadorNegocio();
            gvJugadores.DataSource = jugadorNegocio.listar();
            gvJugadores.DataBind();
        }

        protected void gvJugadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvJugadores.SelectedDataKey.Value.ToString();
            Response.Redirect("formularioJugador.aspx?IDJugador=" + id);
        }

        protected void gvJugadores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJugadores.PageIndex = e.NewPageIndex;
            gvJugadores.DataBind();
        }
    }
}