using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class PaqueteNegocio
    {
        public void GenerarFiguritas(Usuario usuario)
        {
            FiguritaNegocio figuritaNegocio = new FiguritaNegocio();
            Figurita figurita = new Figurita();
            figurita.TipoDeFigurita = new TipoDeFigurita();
            figurita.TipoDeFigurita.Id = 3;
            FiguritaJugador figuritaJugador = new FiguritaJugador();
            //List<Figurita> listaFiguritas = new List<Figurita>();
            JugadorNegocio jugadorNegocio = new JugadorNegocio();
            FiguritaJugadorNegocio figuritaJugadorNegocio = new FiguritaJugadorNegocio();
            Random random = new Random();

            for (int i = 0; i < 5; i++)
            {
                figuritaNegocio.Agregar(figurita); // Crea las 5 figuritas
                figuritaJugador.Jugador = new Jugador();
                figuritaJugador.Jugador.IDJugador = random.Next(1, 308);
                figuritaJugador.Jugador = jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador);
                figuritaJugador.IDFigurita = figuritaNegocio.Listar().Last().IDFigurita;
                figuritaJugador.TipoDeFigurita = new TipoDeFigurita();
                figuritaJugador.TipoDeFigurita.Id = 3;
                figuritaJugador.Ubicacion = (Int16)(figuritaJugador.Jugador.IDJugador + 2 * jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador).Equipo.ID);
                figuritaNegocio.ActualizarUbicacion(figuritaJugador);
                //listaFiguritas.Add(figuritaJugador);
                figuritaJugadorNegocio.Agregar(figuritaJugador, usuario);
            }

            //return listaFiguritas;

            // Ubicacion = ID + 2 * equipo
        }

        public List<Figurita> MasRecientes()
        {
            AccesoDatos datos = new AccesoDatos();
            JugadorNegocio jugadorNegocio = new JugadorNegocio();
            
            List<Figurita> figuritas = new List<Figurita>();
            try
            {
                datos.setearConsulta("SELECT TOP 5 ID, IDFigurita, IDJugador FROM Figuritas_Jugadores ORDER BY IDFigurita DESC");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    FiguritaJugador figuritaJugador = new FiguritaJugador();
                    figuritaJugador.ID = (int)datos.Lector["ID"];
                    figuritaJugador.IDFigurita = (int)datos.Lector["IDFigurita"];
                    figuritaJugador.Jugador = new Jugador();
                    figuritaJugador.Jugador.IDJugador = (int)datos.Lector["IDJugador"];
                    figuritaJugador.Jugador = jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador);
                    figuritaJugador.TipoDeFigurita = new TipoDeFigurita();
                    //figuritaJugador.TipoDeFigurita.Id = (byte)datos.Lector["Tipo"];
                    figuritas.Add(figuritaJugador);
                }
                return figuritas;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
