using dominio2;
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
            Session.Add("listaJugadores", jugadorNegocio.listar());
            gvJugadores.DataSource = Session["listaJugadores"];
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

        protected void FiltroR_TextChanged(object sender, EventArgs e)
        {
            List<Jugador> jugadoresF = ((List<Jugador>)Session["listaJugadores"]).FindAll(x => x.Nombres.ToUpper().Contains(txtFiltroR.Text.ToUpper()));
            gvJugadores.DataSource = jugadoresF;
            gvJugadores.DataBind();
        }

    }
}