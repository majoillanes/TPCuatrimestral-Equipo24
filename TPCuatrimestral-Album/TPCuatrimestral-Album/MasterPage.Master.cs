using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_Album
{
    public partial class MasterPAge : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Usuario.SesionActiva((Usuario)Session["usuario"]))
                Response.Redirect("ingreso.aspx", false);
            if(!Usuario.EsUsuario((Usuario)Session["usuario"]) && (Page is Formulario_web14 || Page is Formulario_web17 || Page is Formulario_web19 || Page is WebForm1 || Page is Formulario_web16 || Page is Formulario_web18 || Page is Formulario_web13 || Page is Formulario_web15))
            {
                Session.Add("error", "Debes iniciar sesión con un usuario no administrador");
                Response.Redirect("error.aspx", false);
            }else if(Usuario.EsAdmin((Usuario)Session["usuario"]) && !(Page is Formulario_web12 ) && (Page is Formulario_web14 || Page is Formulario_web17 || Page is Formulario_web19 || Page is WebForm1 || Page is Formulario_web16 || Page is Formulario_web18 || Page is Formulario_web13 || Page is Formulario_web15))
            {
                Session.Add("error", "Debes iniciar sesión con un usuario administrador");
                Response.Redirect("error.aspx", false);
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("ingreso.aspx");
        }
    }
}