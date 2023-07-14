using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class EmailHelp : System.Web.UI.Page
    {
        public bool Enviado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Enviado = false;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();
            emailService.armarCorreo(txtCorreo.Text, txtAsunto.Text, txtMensaje.Text);
            try
            {
                emailService.enviarEmail();
                txtCorreo.Text=string.Empty;
                txtAsunto.Text=string.Empty;    
                txtMensaje.Text=string.Empty;
                txtNombre.Text=string.Empty;
                Enviado = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

    }
}