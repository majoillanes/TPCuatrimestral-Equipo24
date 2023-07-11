﻿using dominio2;
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
        public int JugadoresPagina1 { get; set; }
        public int JugadoresPagina2 { get; set; }
        public List<FiguritaJugador> Figuritas {get;set;}
        public FiguritaJugador Figurita { get; set;}
        public List<FiguritaEstadio> FiguritasEstadios { get; set; }
        public FiguritaEstadio FiguritaEstadio { get; set; }
        public List<FiguritaEquipo> FiguritasEquipos { get; set; }
        public FiguritaEquipo FiguritaEquipo { get; set; }
        public Usuario Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuario)Session["usuario"];
            
            if (Usuario == null || !Usuario.EsUsuario(Usuario))
            {
                Session.Add("error", "Debes iniciar sesión");
                Response.Redirect("error.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            FiguritaJugadorNegocio figuritaNegocio = new FiguritaJugadorNegocio();
            Figuritas = figuritaNegocio.listar(Usuario.Id);
            FiguritaEstadioNegocio figuritaEstadioNegocio = new FiguritaEstadioNegocio();
            FiguritasEstadios = figuritaEstadioNegocio.listar(Usuario.Id);
            FiguritaEquipoNegocio figuritaEquipoNegocio = new FiguritaEquipoNegocio();
            FiguritasEquipos = figuritaEquipoNegocio.listar(Usuario.Id);
            

            if (!IsPostBack)
            {
                

                EquipoNegocio equipoNegocio = new EquipoNegocio();
                Equipo = equipoNegocio.listar().First();
                lblNumeroPagina.Text = "1";
                Session.Add("EquipoActual", Equipo);

                List<string> numeros = new List<string>();
                lblNumeroEscudo.Text = "1";
                lblNumeroEstadio.Text = "2";
                numeros.Add(lblNumeroEscudo.Text);
                numeros.Add(lblNumeroEstadio.Text);
                Session.Add("Numeros", numeros);

                JugadoresPagina1 = 3;
                Session.Add("Pagina1", JugadoresPagina1);

                JugadoresPagina2 = 5;
                Session.Add("Pagina2", JugadoresPagina2);

                Page.DataBind();
                CargarFiguritasJugadores();
            }
            else
            {
                Equipo = (Equipo)Session["EquipoActual"];
                List<string> numeros = new List<string>();
                numeros = (List<string>)Session["Numeros"];
                lblNumeroEscudo.Text = numeros[0];
                lblNumeroEstadio.Text = numeros[1];
                


                JugadoresPagina1 = int.Parse(Session["Pagina1"].ToString());
                JugadoresPagina2 = int.Parse(Session["Pagina2"].ToString());
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
                List<string> numeros = new List<string>();
                EquipoNegocio equipoNegocio = new EquipoNegocio();
                lblNumeroPagina.Text = (int.Parse(lblNumeroPagina.Text) - 1).ToString();
                //Equipo = equipoNegocio.listar((int.Parse(lblNumeroPagina.Text) - 1).ToString());
                Equipo = (Equipo)Session["EquipoActual"];
                Equipo = equipoNegocio.listar(Equipo.ID - 1);
                Session["EquipoActual"] = Equipo;

                numeros = (List<string>)Session["Numeros"];
                lblNumeroEscudo.Text = (int.Parse(numeros[0]) - 13).ToString();
                lblNumeroEstadio.Text = (int.Parse(numeros[1]) - 13).ToString();
                numeros[0] = lblNumeroEscudo.Text;
                numeros[1] = lblNumeroEstadio.Text;
                Session["Numeros"] = numeros;

                JugadoresPagina1 = int.Parse(Session["Pagina1"].ToString());
                JugadoresPagina1 -= 13;
                Session["Pagina1"] = JugadoresPagina1;

                JugadoresPagina2 = int.Parse(Session["Pagina2"].ToString());
                JugadoresPagina2 -= 13;
                Session["Pagina2"] = JugadoresPagina2;

                CargarFiguritasJugadores();
            }
        }

        protected void SiguientePagina_Click(object sender, EventArgs e)
        {
            if (int.Parse(lblNumeroPagina.Text) < 28)
            {
                List<string> numeros = new List<string>();
                EquipoNegocio equipoNegocio = new EquipoNegocio();
                lblNumeroPagina.Text = (int.Parse(lblNumeroPagina.Text) + 1).ToString();
                Equipo = (Equipo)Session["EquipoActual"];
                Equipo = equipoNegocio.listar(Equipo.ID + 1);
                Session["EquipoActual"] = Equipo;

                numeros = (List<string>)Session["Numeros"];
                lblNumeroEscudo.Text = (int.Parse(numeros[0]) + 13).ToString();
                lblNumeroEstadio.Text = (int.Parse(numeros[1]) + 13).ToString();
                numeros[0] = lblNumeroEscudo.Text;
                numeros[1] = lblNumeroEstadio.Text;
                Session["Numeros"] = numeros;

                JugadoresPagina1 = int.Parse(Session["Pagina1"].ToString());
                JugadoresPagina1 += 13;
                Session["Pagina1"] = JugadoresPagina1;

                JugadoresPagina2 = int.Parse(Session["Pagina2"].ToString());
                JugadoresPagina2 += 13;
                Session["Pagina2"] = JugadoresPagina2;

                CargarFiguritasJugadores();
            }
        }

        public void CargarFiguritasJugadores()
        {
            int inicio = Int32.Parse(lblNumeroEscudo.Text.ToString());
            int fin = JugadoresPagina2 + 8;
            repeaterJugadores.DataSource = Figuritas.Where(f => !f.Pegada && f.Ubicacion >= inicio && f.Ubicacion <= fin);
            repeaterJugadores.DataBind();
        }

        protected void btnPegar_Click(object sender, EventArgs e)
        {
            FiguritaNegocio figuritaNegocio = new FiguritaNegocio();
            string ubicacion = ((Button)sender).CommandArgument;
            figuritaNegocio.pegar(Int32.Parse(ubicacion));
            Response.Redirect("album.aspx", false);
        }
    }
}