using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using dominio2;

namespace Test
{
    public class FiguritaNegocio
    {
        public List<Figurita> listar()
        {
            List<Figurita> figuritas = new List<Figurita>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select F.IDFigurita, F.Activo, F.Pegada,F.IDJugador, J.Nombres, J.Apellidos, J.Imagen, J.FechaDeNacimiento, N.GENTILICIO_NAC, E.Nombre,P.Descripcion From Figuritas F\r\nINNER JOIN Jugadores J ON F.IDJugador = J.ID\r\nINNER JOIN Nacionalidad N ON N.ISO_NAC = J.Nacionalidad\r\nINNER JOIN Equipos E ON E.ID = J.Equipo\r\nINNER JOIN Posiciones P ON P.Codigo = J.Posicion");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Figurita figurita = new Figurita();
                    figurita.IDFigurita = (int)datos.Lector["IDFigurita"];
                    figurita.TipoDeFigurita = new TipoDeFigurita();
                    figurita.TipoDeFigurita.Id = (byte)datos.Lector["Tipo"];
                    //figurita.Ubicacion = datos.Lector["Ubicacion"] is DBNull ? 0 : (Int16)datos.Lector["Ubicacion"];
                    figurita.Activo = (bool)datos.Lector["Activo"];
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    //figurita.Jugador = new Jugador();
                    //figurita.Jugador.IDJugador = (int)datos.Lector["IDJugador"];
                    //figurita.Jugador.Nombres = (string)datos.Lector["Nombres"];
                    //figurita.Jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    //figurita.Jugador.Imagen = (string)datos.Lector["Imagen"];
                    //figurita.Jugador.FechaDeNacimiento = ((DateTime)datos.Lector["FechaDeNacimiento"]).Date;
                    //figurita.Jugador.Nacionalidad = new Nacionalidad();
                    //figurita.Jugador.Nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
                    //figurita.Jugador.Equipo = new Equipo();
                    //figurita.Jugador.Equipo.Nombre = (string)datos.Lector["Nombre"];
                    //figurita.Jugador.Posicion = new Posicion();
                    //figurita.Jugador.Posicion.Descripcion = (string)datos.Lector["Descripcion"];

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
        public List<Figurita> Listar()
        {
            List<Figurita> figuritas = new List<Figurita>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("SELECT IDFigurita, Tipo, Ubicacion, Pegada, Activo FROM Figuritas");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    Figurita figurita = new Figurita();
                    figurita.IDFigurita = (int)accesoDatos.Lector["IDFigurita"];
                    figurita.TipoDeFigurita = new TipoDeFigurita();
                    figurita.TipoDeFigurita.Id = (byte)accesoDatos.Lector["Tipo"];
                    figurita.Ubicacion = accesoDatos.Lector["Ubicacion"] is DBNull ? 0 : (Int16)accesoDatos.Lector["Ubicacion"];
                    figurita.Pegada = (bool)accesoDatos.Lector["Pegada"];
                    figurita.Activo = (bool)accesoDatos.Lector["Activo"];

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
                accesoDatos.cerrarConexion();
            }
        }
        public void Agregar(Figurita figurita)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta($"INSERT INTO Figuritas (Tipo) VALUES ({figurita.TipoDeFigurita.Id})");
                accesoDatos.ejecutarAccion();
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
