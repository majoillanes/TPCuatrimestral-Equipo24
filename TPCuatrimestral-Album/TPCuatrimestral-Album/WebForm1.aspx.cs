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
            FiguritaNegocio figuritaNegocio = new FiguritaNegocio();
           // gvLista.DataSource = figuritaNegocio.listar();
           // gvLista.DataBind();
            repeaterJugadores.DataSource = figuritaNegocio.listar();
            repeaterJugadores.DataBind();
        }
    }
}