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
    public partial class jugadoresAdmin : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
           JugadorNegocio jugadorNegocio = new JugadorNegocio();
            Session.Add("listaJugadores", jugadorNegocio.listar());
            gvJugadores.DataSource = Session["listaJugadores"];
            gvJugadores.DataBind();
        }

        protected void gvJugadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gvJugadores.SelectedDataKey.Value.ToString();
            Response.Redirect("formularioJugador.aspx?IDJugador=" + id);
        }

        protected void gvJugadores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJugadores.PageIndex = e.NewPageIndex;
            gvJugadores.DataBind();
        }

        protected void FiltroR_TextChanged(object sender, EventArgs e)
        {
            List<Jugador> jugadoresF = ((List<Jugador>)Session["listaJugadores"]).FindAll(x => x.Nombres.ToUpper().Contains(txtFiltroR.Text.ToUpper()));
            gvJugadores.DataSource = jugadoresF;
            gvJugadores.DataBind();
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

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltroR.Enabled = !FiltroAvanzado;
            btnLimpiar.Enabled = false;

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                JugadorNegocio negocio = new JugadorNegocio();
                gvJugadores.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.Value.ToString(),
                    ddlCriterio.SelectedItem.Value.ToString(),
                    ddlEstado.SelectedItem.ToString());
                gvJugadores.DataBind();
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
            gvJugadores.DataSource = Session["listaJugadores"];
            gvJugadores.DataBind();
            ddlCriterio.Items.Clear();
            btnLimpiar.Enabled=false;
        }
    }
}