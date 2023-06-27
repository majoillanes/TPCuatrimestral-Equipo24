using dominio2;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class formularioEquipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EstadioNegocio estadioNegocio = new EstadioNegocio();
                EstadioNegocio negocio = new EstadioNegocio();
                List<Estadio> lista = estadioNegocio.listarDisponibles();

                ddlEstadio.DataSource = lista;
                ddlEstadio.DataValueField = "ID";
                ddlEstadio.DataTextField = "Nombre";
                ddlEstadio.DataBind();
            }

            try
            {
                lblError.Visible = false;
                lblID.Visible = false;
                txtID.Visible = false;
                btnEliminar.Visible = false;
                //configuración si estamos modificando.
                string ID = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "";
                if (ID != "" && !IsPostBack)
                {
                    lblID.Visible = true;
                    txtID.Visible = true;
                    btnEliminar.Visible = true;
                    txtID.Enabled = false;
                    EquipoNegocio equipo = new EquipoNegocio();
                    Equipo seleccionado = (equipo.listar(ID));
                    txtID.Text = ID;
                    txtNombre.Text = seleccionado.Nombre;
                    txtAlias.Text = seleccionado.Alias;
                    txtCiudad.Text = seleccionado.Ciudad;
                    txtFundacion.Text = seleccionado.Fundacion.ToString();
                    txtImagenUrl.Text = seleccionado.Imagen;
                    txtImagenUrl.Text = seleccionado.Imagen;
                    txtImagenUrl_TextChanged(sender, e);

                    EstadioNegocio estadioNegocio = new EstadioNegocio();
                    Estadio estadio = estadioNegocio.listarddl(seleccionado.IDEstadio);
                    List<Estadio> listaEstadios = new List<Estadio>();
                    List<Estadio> lista = estadioNegocio.listarDisponibles();
                    listaEstadios.Add(estadio);
                    listaEstadios.AddRange(lista);
                    ddlEstadio.DataSource = listaEstadios;
                    ddlEstadio.DataValueField = "ID";
                    ddlEstadio.DataTextField = "Nombre";
                    ddlEstadio.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                // Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Equipo nuevo = new Equipo();
                EquipoNegocio negocio = new EquipoNegocio();


                nuevo.Nombre = txtNombre.Text;
                nuevo.Alias = txtAlias.Text == "" ? null : txtAlias.Text;
                nuevo.Ciudad = txtCiudad.Text;
                nuevo.Fundacion = txtFundacion.Text == "" ? null : txtFundacion.Text;
                nuevo.IDEstadio = string.IsNullOrEmpty(ddlEstadio.SelectedItem?.Value) ? (short)0 : Int16.Parse(ddlEstadio.SelectedItem.Value);
                nuevo.Imagen = txtImagenUrl.Text == "" ? null : txtImagenUrl.Text;

                if (!(string.IsNullOrEmpty(nuevo.Nombre)  || string.IsNullOrEmpty(nuevo.Ciudad) || nuevo.IDEstadio == 0 ))
                {
                    if (Request.QueryString["ID"] != null)
                    {
                        nuevo.ID = Int16.Parse(txtID.Text);
                        negocio.modificar(nuevo);
                    }
                    else
                    {
                        negocio.agregar(nuevo);
                    }
                    Response.Redirect("equipoAdmin.aspx", false);
                }
                else
                {
                    lblError.Visible = true;
                }
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
                EquipoNegocio negocio = new EquipoNegocio();
                negocio.eliminar(txtID.Text);
                Response.Redirect("equipoAdmin.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgEquipo.ImageUrl = txtImagenUrl.Text;
        }
    }
}