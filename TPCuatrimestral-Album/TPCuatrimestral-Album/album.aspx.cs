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
    public partial class Formulario_web14 : System.Web.UI.Page
    {
        //public int NumeroPagina { get; set; }
        public Equipo Equipo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EquipoNegocio equipoNegocio = new EquipoNegocio();
                Equipo = equipoNegocio.listar().First();
                lblNumeroPagina.Text = "1";
                Session.Add("EquipoActual", Equipo);
            }
            else
            {
                Equipo = (Equipo)Session["EquipoActual"];
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx", false);
        }

        protected void AnteriorPagina_Click(object sender, EventArgs e)
        {
            if (int.Parse(lblNumeroPagina.Text) > 1)
            {
                EquipoNegocio equipoNegocio = new EquipoNegocio();
                lblNumeroPagina.Text = (int.Parse(lblNumeroPagina.Text) - 1).ToString();
                //Equipo = equipoNegocio.listar((int.Parse(lblNumeroPagina.Text) - 1).ToString());
                Equipo = (Equipo)Session["EquipoActual"];
                Equipo = equipoNegocio.listar(Equipo.ID - 1);
                Session["EquipoActual"] = Equipo;
            }
        }

        protected void SiguientePagina_Click(object sender, EventArgs e)
        {
            if (int.Parse(lblNumeroPagina.Text) < 28)
            {
                EquipoNegocio equipoNegocio = new EquipoNegocio();
                lblNumeroPagina.Text = (int.Parse(lblNumeroPagina.Text) + 1).ToString();
                Equipo = (Equipo)Session["EquipoActual"];
                Equipo = equipoNegocio.listar(Equipo.ID + 1);
                Session["EquipoActual"] = Equipo;
            }
        }
    }
}