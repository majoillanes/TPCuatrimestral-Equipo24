using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Test;
using dominio2;

namespace TPCuatrimestral_Album
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FiguritaJugadorNegocio figuritaNegocio = new FiguritaJugadorNegocio();
            Usuario usuario = (Usuario)Session["usuario"];

            Session.Add("listaJugadores", figuritaNegocio.listar(usuario.Id).Where(x => !x.Pegada).ToList());
            repeaterJugadores.DataSource = Session["listaJugadores"];
            repeaterJugadores.DataBind();

            FiguritaEquipoNegocio figuritaEquipoNegocio = new FiguritaEquipoNegocio();
            Session.Add("listaEquipos", figuritaEquipoNegocio.listar(usuario.Id).Where(x => !x.Pegada));
            repeaterEquipos.DataSource = Session["listaEquipos"];
            repeaterEquipos.DataBind();

            FiguritaEstadioNegocio figuritaEstadioNegocio = new FiguritaEstadioNegocio();
            Session.Add("listaEstadios", figuritaEstadioNegocio.listar(usuario.Id).Where(x => !x.Pegada));
            repeaterEstadios.DataSource = Session["listaEstadios"];
            repeaterEstadios.DataBind();
        }
        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            btnLimpiar.Enabled = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = (Usuario)Session["usuario"];
                FiguritaJugadorNegocio figuritaJugadorNegocio = new FiguritaJugadorNegocio();
                repeaterJugadores.DataSource = figuritaJugadorNegocio.filtrar(usuario.Id, ddlCampo.SelectedItem.Value.ToString(),
                    ddlCriterio.SelectedItem.Value.ToString());
                repeaterJugadores.DataBind();

                if (!ddlCampo.SelectedItem.Value.Equals("Posicion"))
                {
                    FiguritaEquipoNegocio figuritaEquipoNegocio = new FiguritaEquipoNegocio();
                    repeaterEquipos.DataSource = figuritaEquipoNegocio.filtrar(usuario.Id, ddlCampo.SelectedItem.Value.ToString(),
                        ddlCriterio.SelectedItem.Value.ToString());
                    repeaterEquipos.DataBind();

                    FiguritaEstadioNegocio figuritaEstadioNegocio = new FiguritaEstadioNegocio();
                    repeaterEstadios.DataSource = figuritaEstadioNegocio.filtrar(usuario.Id, ddlCampo.SelectedItem.Value.ToString(),
                        ddlCriterio.SelectedItem.Value.ToString());
                    repeaterEstadios.DataBind();
                }
                btnLimpiar.Enabled = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            //gvJugadores.DataSource = Session["listaJugadores"];
            //gvJugadores.DataBind();
            ddlCriterio.Items.Clear();
            btnLimpiar.Enabled = false;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Equipo")
            {
                EquipoNegocio equipoNegocio = new EquipoNegocio();
                ddlCriterio.DataSource = equipoNegocio.listar();
                ddlCriterio.DataValueField = "ID";
                ddlCriterio.DataTextField = "Nombre";
                ddlCriterio.DataBind();
            }
            else
            {
                PosicionNegocio posicionNegocio = new PosicionNegocio();
                ddlCriterio.DataSource = posicionNegocio.listar();
                ddlCriterio.DataValueField = "Codigo";
                ddlCriterio.DataTextField = "Descripcion";
                ddlCriterio.DataBind();
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx", false);
        }
    }
}