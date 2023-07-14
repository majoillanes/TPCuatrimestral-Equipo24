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
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        public bool HayErrorRegistro { get; set; }
        public bool HayErrorIngreso { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario;
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario = new Usuario(txtEmail.Text, txtPassword.Text);
                if (negocio.ingresar(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("menu.aspx", false);
                }
                else
                {
                    HayErrorIngreso = true;
                }

            }
            catch (Exception ex)
            {
                 Session.Add("error", ex.ToString());
                 Response.Redirect("error.aspx");
            }
        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                Usuario usuario = new Usuario();
                EmailService emailService = new EmailService();

                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtMailRegistro.Text;
                usuario.Clave = txtPass.Text;
                

                if (!(string.IsNullOrEmpty(usuario.Nombre) || string.IsNullOrEmpty(usuario.Apellido) || string.IsNullOrEmpty(usuario.Email) || string.IsNullOrEmpty(usuario.Clave)) && txtPass.Text.ToString().Equals(txtConfirmPass.Text))
                {
                    usuarioNegocio.crearUsuario(usuario);
                    usuarioNegocio.ingresar(usuario);
                    Session.Add("usuario", usuario);
                    string asunto = "Bienvenida";
                    string cuerpo = $"<h1>Bienvenido!</h1> <br><p>Hola {usuario.Nombre},</p> <p>Gracias por registrarte en la aplicación. Desde ahora podrás coleccionar las figuritas del Álbum de la Liga Profesional Argentina.</p>";
                    emailService.armarCorreo(usuario.Email, asunto, cuerpo);
                    emailService.enviarEmail();
                    Response.Redirect("menu.aspx", false);
                }
                else
                {
                    HayErrorRegistro = true;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                throw ex;
            }
        }
    }
}