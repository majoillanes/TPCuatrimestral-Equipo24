﻿using dominio2;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;

namespace TPCuatrimestral_Album
{
    public partial class Formulario_web111 : System.Web.UI.Page
    {
        public bool HayError { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HayError=false;
            }
            string id = Request.QueryString["ID"] != null ? Request.QueryString["ID"].ToString() : "";
            if (id != "" && !IsPostBack)
            {
                Estadio estadio = new Estadio();
                EstadioNegocio estadioNegocio = new EstadioNegocio();

                estadio = estadioNegocio.listar(id);
                txtAlias.Text = estadio.Alias;
                txtNombre.Text = estadio.Nombre;
                txtImagen.Text = estadio.Imagen;
                txtCapacidad.Text = estadio.Capacidad;
                txtBarrio.Text = estadio.Barrio;
                txtCalle.Text = estadio.Calle;
                txtID.Text = id;
                txtID.Enabled = false;
                imgEstadios.ImageUrl = txtImagen.Text;
                btnInactivar.Visible = true;
                if (!estadio.Activo)
                    btnInactivar.Text = "Reactivar";

            }
            if (id=="")
            {
                txtID.Visible = false;
                lblID.Visible = false;
                btnInactivar.Visible = false;
            }

        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            imgEstadios.ImageUrl = txtImagen.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Estadio nuevo = new Estadio();
                EstadioNegocio negocio = new EstadioNegocio();

                nuevo.Barrio = txtBarrio.Text == "" ? null : txtBarrio.Text;
                nuevo.Alias = txtAlias.Text == "" ? null : txtAlias.Text;
                nuevo.Capacidad = txtCapacidad.Text;
                nuevo.Calle = txtCalle.Text == "" ? null : txtCalle.Text;
                nuevo.Imagen = txtImagen.Text == "" ? null : txtImagen.Text;
                nuevo.Nombre = txtNombre.Text;

                if (Request.QueryString["ID"] != null)
                {
                    nuevo.ID = int.Parse(txtID.Text);
                    negocio.modificar(nuevo);
                }
                else
                    negocio.agregar(nuevo);
                Response.Redirect("estadiosAdmin.aspx", false);
            }
            catch(SqlException)
            {
                HayError = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {

            string id = Request.QueryString["ID"];
            EstadioNegocio estadioNegocio = new EstadioNegocio();
            estadioNegocio.eliminar(id, (btnInactivar.Text == "Inactivar") ? false : true);
            Response.Redirect("estadiosAdmin.aspx", false);
        }
    }
}