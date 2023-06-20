using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class equipoAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EquipoNegocio equipoNegocio = new EquipoNegocio();
            gvEquipos.DataSource = equipoNegocio.listar();
            gvEquipos.DataBind();
        }
        protected void gvEquipos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEquipos.PageIndex = e.NewPageIndex;
            gvEquipos.DataBind();
        }
        protected void gvEquipos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvEquipos.SelectedDataKey.Value.ToString();
            Response.Redirect("formularioEquipo.aspx?ID=" + id);
        }
    }
}