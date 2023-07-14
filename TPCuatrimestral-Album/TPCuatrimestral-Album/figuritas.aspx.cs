using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;
using dominio2;

namespace TPCuatrimestral_Album
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FiguritaJugadorNegocio figuritaNegocio = new FiguritaJugadorNegocio();
            // gvLista.DataSource = figuritaNegocio.listar();
            // gvLista.DataBind();
            Usuario usuario = (Usuario)Session["usuario"];
            repeaterJugadores.DataSource = figuritaNegocio.listar(usuario.Id);
            repeaterJugadores.DataBind();

            FiguritaEquipoNegocio figuritaEquipoNegocio = new FiguritaEquipoNegocio();
            repeaterEquipos.DataSource = figuritaEquipoNegocio.listar(usuario.Id);
            repeaterEquipos.DataBind();

            FiguritaEstadioNegocio figuritaEstadioNegocio = new FiguritaEstadioNegocio();
            repeaterEstadios.DataSource = figuritaEstadioNegocio.listar(usuario.Id);
            repeaterEstadios.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx", false);
        }
    }
}