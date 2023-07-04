using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using dominio2;

namespace Test
{
    public class FiguritaJugadorNegocio
    {
        public List<FiguritaJugador> listar(int idUsuario)
        {
            List<FiguritaJugador> figuritas = new List<FiguritaJugador>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select f.Pegada, fj.Ubicacion, j.Nombres, j.Apellidos from Figuritas f\r\nInner join Figuritas_Jugadores fj ON f.IDFigurita=fj.IDFigurita\r\nInner join Jugadores j on fj.IDJugador = j.ID\r\nWHERE fj.IDUsuario = {idUsuario}");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    FiguritaJugador figurita = new FiguritaJugador();
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    figurita.Ubicacion = (int)datos.Lector["Ubicacion"];
                    figurita.Jugador = new Jugador();
                    figurita.Jugador.Nombres = (string)datos.Lector["Nombres"];
                    figurita.Jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    figuritas.Add(figurita);
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
