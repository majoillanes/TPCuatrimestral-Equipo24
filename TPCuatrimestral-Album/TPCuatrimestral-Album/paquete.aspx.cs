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
    public partial class Formulario_web15 : System.Web.UI.Page
    {
        public bool Mostrar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //PaqueteNegocio paqueteNegocio = new PaqueteNegocio();
            //if (!IsPostBack) Mostrar = false;
            //else
            //{
            //    //Usuario usuario = (Usuario)Session["usuario"];
            //    repeaterJugadores.DataSource = paqueteNegocio.GenerarFiguritas();
            //    repeaterJugadores.DataBind();
            //    //Mostrar = (bool)Session["M"];
            //}
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx", false);
        }

        protected void btnAbrir_Click(object sender, EventArgs e)
        {
            Mostrar = true;
            //Session.Add("M", Mostrar);
            Usuario usuario = (Usuario)Session["usuario"];
            PaqueteNegocio paqueteNegocio = new PaqueteNegocio();
            paqueteNegocio.GenerarFiguritas(usuario);
            repeaterJugadores.DataSource = paqueteNegocio.MasRecientes();
            repeaterJugadores.DataBind();
        }
    }
}