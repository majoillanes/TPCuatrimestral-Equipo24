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
                    Session.Add("error", "user o pass incorrectos");
                    Response.Redirect("../error.aspx", false);
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
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.Email = txtMailRegistro.Text;
                usuario.Clave = txtPass.Text;
                usuarioNegocio.crearUsuario(usuario);
                usuarioNegocio.ingresar(usuario);
                Session.Add("usuario", usuario);
                Response.Redirect("menu.aspx",false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("error.aspx",false);
            }
        }
    }
}