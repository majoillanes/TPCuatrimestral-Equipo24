using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class nacionalidadAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NacionalidadNegocio  nacionalidadNegocio= new NacionalidadNegocio();
            gvNacionalidades.DataSource = nacionalidadNegocio.listar();
            gvNacionalidades.DataBind();
        }
        protected void gvNacionalidades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvNacionalidades.PageIndex = e.NewPageIndex;
            gvNacionalidades.DataBind();
        }
        protected void gvNacionalidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvNacionalidades.SelectedDataKey.Value.ToString();
            Response.Redirect("formularioNacionalidad.aspx?ISO=" + id);
        }
    }
}