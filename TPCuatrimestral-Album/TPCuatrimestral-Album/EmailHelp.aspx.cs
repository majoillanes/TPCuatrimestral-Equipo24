using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_Album
{
    public partial class EmailHelp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
          
            string remitente = txtNombre.Text;
            string asunto = txtAsunto.Text;
            string mensaje = txtMensaje.Text;

           
            if (string.IsNullOrEmpty(remitente) || string.IsNullOrEmpty(asunto) || string.IsNullOrEmpty(mensaje))
            {
               
                lblMensaje.Text = "Por favor complete todos los campos obligatorios.";
                lblMensaje.CssClass = "error";
                return;
            }

            try
            {
               
                EmailHelp emailHelper = new EmailHelp();

               
                emailHelper.enviarEmail(remitente, asunto, mensaje);

               
                lblMensaje.Text = "El correo electrónico se envió correctamente.";
                lblMensaje.CssClass = "exito";
            }
            catch (Exception ex)
            {
                
                lblMensaje.Text = "Ocurrió un error al enviar el correo electrónico: " + ex.Message;
                lblMensaje.CssClass = "error";
            }

        }

        private void enviarEmail(string remitente, string asunto, string mensaje)
        {
            //throw new NotImplementedException();
        }
    }
}