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
    public partial class Formulario_web15 : System.Web.UI.Page
    {
        public bool Mostrar { get; set; }
        public List<Figurita> figuritas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnAbrir.Enabled = false;
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            if (usuarioNegocio.consultarUltimoPaquete((Usuario)Session["usuario"]).Date < DateTime.Now.Date)
               btnAbrir.Enabled = true;
            //PaqueteNegocio paqueteNegocio = new PaqueteNegocio();
            //if (!IsPostBack) Mostrar = false;
            //else
            //{
            //    //Usuario usuario = (Usuario)Session["usuario"];
            //    repeaterJugadores.DataSource = paqueteNegocio.GenerarFiguritas();
            //    repeaterJugadores.DataBind();
            //    //Mostrar = (bool)Session["M"];
            //}
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx", false);
        }

        protected void btnAbrir_Click(object sender, EventArgs e)
        {
            Mostrar = true;
            //Session.Add("M", Mostrar);
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            Usuario usuario = (Usuario)Session["usuario"];
            PaqueteNegocio paqueteNegocio = new PaqueteNegocio();
            paqueteNegocio.GenerarFiguritas(usuario);
//<<<<<<< Updated upstream
//            repeaterJugadores.DataSource = paqueteNegocio.MasRecientes();
//            repeaterJugadores.DataBind();
            usuarioNegocio.actualizarFechaPaquete(usuario);
            btnAbrir.Enabled=false;
            //repeaterFiguritas.DataSource = paqueteNegocio.MasRecientes();
            //repeaterFiguritas.DataBind();
            figuritas = paqueteNegocio.MasRecientes();
        }
        public int EsJugador(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idJugador = -1;
                accesoDatos.setearConsulta($"SELECT ID FROM Figuritas_Jugadores WHERE IDFigurita = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idJugador = (int)accesoDatos.Lector["ID"];
                }
                return idJugador;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
        public int ListarIDEstadioPorID(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idEstadio = new int();
                accesoDatos.setearConsulta($"SELECT IDEstadios FROM Figuritas_Estadios WHERE ID = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idEstadio = (Int16)accesoDatos.Lector["IDEstadios"];
                }
                return idEstadio;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
        public bool EsEquipo(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idEquipo = -1;
                accesoDatos.setearConsulta($"SELECT IDEquipo FROM Figuritas_Equipos WHERE IDFigurita = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idEquipo = (Int16)accesoDatos.Lector["IDEquipo"];
                }
                if (idEquipo == -1)
                    return false;
                else
                    return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}