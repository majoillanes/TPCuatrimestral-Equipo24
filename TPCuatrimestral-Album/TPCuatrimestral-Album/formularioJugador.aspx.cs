using dominio2;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class formularioJugador : System.Web.UI.Page
    {
        public bool HayError { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                btnInactivar.Visible = false;
                lblID.Visible = false;
                txtID.Visible = false;
                if (!IsPostBack)
                {
                    EquipoNegocio equipoNegocio = new EquipoNegocio();
                    List<Equipo> listaEquipo = equipoNegocio.listar();
                    NacionalidadNegocio nacionalidadNegocio = new NacionalidadNegocio();
                    List<Nacionalidad> listaNacionalidad = nacionalidadNegocio.listarDisponilbes();
                    PosicionNegocio estadioNegocio = new PosicionNegocio();
                    List<Posicion> listaPosicion = estadioNegocio.listar();

                    HayError = false;

                    ddlEquipo.DataSource = listaEquipo;
                    ddlEquipo.DataValueField = "ID";
                    ddlEquipo.DataTextField = "Nombre";
                    ddlEquipo.DataBind();

                    ddlNacionalidad.DataSource = listaNacionalidad;
                    ddlNacionalidad.DataValueField = "ISO";
                    ddlNacionalidad.DataTextField = "Gentilicio";
                    ddlNacionalidad.DataBind();

                    ddlPosicion.DataSource = listaPosicion;
                    ddlPosicion.DataValueField = "Codigo";
                    ddlPosicion.DataTextField = "Descripcion";
                    ddlPosicion.DataBind();
                }
                //configuración si estamos modificando.
                string ID = Request.QueryString["IDJugador"] != null ? Request.QueryString["IDJugador"].ToString() : "";
                if (ID != "" && !IsPostBack)
                {
                    btnInactivar.Visible = true;
                    lblID.Visible = true;
                    txtID.Visible = true;
                    txtID.Enabled = false;
                    JugadorNegocio jugador = new JugadorNegocio();
                    Jugador seleccionado = jugador.listar(ID);
                    txtID.Text = ID;
                    txtNombres.Text = seleccionado.Nombres;
                    txtApellidos.Text = seleccionado.Apellidos;
                    txtFechaNacimiento.Text = seleccionado.FechaDeNacimiento.ToString("yyyy-MM-dd");
                    txtImagenUrl.Text = seleccionado.Imagen;
                    txtImagenUrl_TextChanged(sender, e);

                    ddlEquipo.SelectedValue = seleccionado.Equipo.ID.ToString();
                    ddlNacionalidad.SelectedValue = seleccionado.Nacionalidad.ISO;
                    ddlPosicion.SelectedValue = seleccionado.Posicion.Codigo;
                    if (!seleccionado.Activo)
                        btnInactivar.Text = "Reactivar";
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                // Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgJugador.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Jugador nuevo = new Jugador();
                JugadorNegocio negocio = new JugadorNegocio();

                nuevo.Nombres = string.IsNullOrWhiteSpace(txtNombres.Text) ? null : txtNombres.Text;
                nuevo.Apellidos = string.IsNullOrWhiteSpace(txtApellidos.Text) ? null : txtApellidos.Text;
                nuevo.FechaDeNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                nuevo.Nacionalidad = new Nacionalidad();
                nuevo.Nacionalidad.ISO = ddlNacionalidad.SelectedItem.Value;
                nuevo.Equipo = new Equipo();
                nuevo.Equipo.ID = Int16.Parse(ddlEquipo.SelectedItem.Value);
                nuevo.Posicion = new Posicion();
                nuevo.Posicion.Codigo = ddlPosicion.SelectedItem.Value;
                nuevo.Imagen = string.IsNullOrWhiteSpace(txtImagenUrl.Text) ? null : txtImagenUrl.Text;

                if (!(string.IsNullOrEmpty(nuevo.Nombres) || string.IsNullOrEmpty(nuevo.Apellidos) || string.IsNullOrEmpty(nuevo.Imagen)))
                {
                    if (Request.QueryString["IDJugador"] != null)
                    {
                        nuevo.IDJugador = Int32.Parse(txtID.Text);
                        negocio.modificar(nuevo);
                    }
                    else
                    {
                        negocio.agregar(nuevo);
                    }

                    Response.Redirect("jugadoresAdmin.aspx", false);
                }
                else
                {
                    HayError = true;
                }
            }
            catch (FormatException)
            {
                HayError = true;
            }
            catch (SqlException)
            {
                HayError = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                throw ex;
            }
        }
        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            try
            {
                JugadorNegocio negocio = new JugadorNegocio();
                negocio.eliminar(txtID.Text, (btnInactivar.Text == "Inactivar") ? false : true);
                Response.Redirect("jugadoresAdmin.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}