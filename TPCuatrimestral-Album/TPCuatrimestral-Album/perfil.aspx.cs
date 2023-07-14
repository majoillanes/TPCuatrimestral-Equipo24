using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_Album
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        public Usuario Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuario)Session["usuario"];
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx", false);
        }
    }
}