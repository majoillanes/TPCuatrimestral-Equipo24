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
    public partial class Formulario_web110 : System.Web.UI.Page
    {
        public Usuario Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuario)Session["usuario"];
            if (!Usuario.EsAdmin(Usuario))
            {
                Session.Add("error", "No tienes permisos de Administrador");
                Response.Redirect("error.aspx", false);
            }
            EstadioNegocio estadioNegocio = new EstadioNegocio();
            gvEstadios.DataSource = estadioNegocio.listar();
            gvEstadios.DataBind();
        }

        protected void gvEstadios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvEstadios.SelectedDataKey.Value.ToString();
            Response.Redirect("formularioEstadio.aspx?ID=" + id);
        }

        protected void gvEstadios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEstadios.PageIndex = e.NewPageIndex;
            gvEstadios.DataBind();
        }
    }
}