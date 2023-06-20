using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using dominio2;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class formularioNacionalidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                btnEliminar.Visible = false;
                //configuración si estamos modificando.
                string ISO = Request.QueryString["ISO"] != null ? Request.QueryString["ISO"].ToString() : "";
                if (ISO != "" && !IsPostBack)
                {
                    btnEliminar.Visible = true;
                    txtISO.Enabled = false;
                    NacionalidadNegocio negocio = new NacionalidadNegocio();
                    Nacionalidad seleccionado = (negocio.listar(ISO));
                    txtISO.Text = ISO;
                    txtPaís.Text = seleccionado.Pais;
                    txtGentilicio.Text = seleccionado.Gentilicio;
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                //Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Nacionalidad nuevo = new Nacionalidad();
                NacionalidadNegocio negocio = new NacionalidadNegocio();

                nuevo.Pais = txtPaís.Text;
                nuevo.Gentilicio = txtGentilicio.Text;
                nuevo.ISO = txtISO.Text;

                if (Request.QueryString["ISO"] != null)
                {
                    nuevo.ISO = txtISO.Text;
                    negocio.modificar(nuevo);
                }
                else
                    negocio.agregar(nuevo);

                Response.Redirect("nacionalidadAdmin.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                    NacionalidadNegocio negocio = new NacionalidadNegocio();
                    negocio.eliminar(txtISO.Text);
                    Response.Redirect("nacionalidadAdmin.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}