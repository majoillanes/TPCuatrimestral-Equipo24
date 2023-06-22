using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class JugadorNegocio
    {
        public List<Jugador> listar()
        {
            List<Jugador> jugadores = new List<Jugador>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT J.ID, J.Nombres, J.Apellidos, J.FechaDeNacimiento, J.Imagen, J.Activo, N.GENTILICIO_NAC, E.Nombre, P.Descripcion FROM Jugadores J\r\nINNER JOIN Nacionalidad N ON N.ISO_NAC = J.Nacionalidad\r\nINNER JOIN Equipos E ON E.ID = J.Equipo\r\nINNER JOIN Posiciones P ON P.Codigo = J.Posicion");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Jugador jugador = new Jugador();
                    jugador.IDJugador = (int)datos.Lector["ID"];
                    jugador.Nombres = (string)datos.Lector["Nombres"];
                    jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    jugador.FechaDeNacimiento = (DateTime)datos.Lector["FechaDeNacimiento"];
                    jugador.Imagen = (string)datos.Lector["Imagen"];
                    jugador.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                    jugador.Nacionalidad = new Nacionalidad();
                    jugador.Nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
                    jugador.Equipo = new Equipo();
                    jugador.Equipo.Nombre = (string)datos.Lector["Nombre"];
                    jugador.Posicion = new Posicion();
                    jugador.Posicion.Descripcion = (string)datos.Lector["Descripcion"];
                    jugadores.Add(jugador);
                }
                return jugadores;
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
        public Jugador listar(string id)
        {
            Jugador jugador = new Jugador();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"SELECT J.ID, J.Nombres, J.Apellidos, J.FechaDeNacimiento, J.Imagen, J.Activo, N.ISO_NAC, E.ID as IDE, P.Codigo FROM Jugadores J\r\nINNER JOIN Nacionalidad N ON N.ISO_NAC = J.Nacionalidad\r\nINNER JOIN Equipos E ON E.ID = J.Equipo\r\nINNER JOIN Posiciones P ON P.Codigo = J.Posicion WHERE J.ID={id}");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    jugador.IDJugador = (int)datos.Lector["ID"];
                    jugador.Nombres = (string)datos.Lector["Nombres"];
                    jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    jugador.FechaDeNacimiento = (DateTime)datos.Lector["FechaDeNacimiento"];
                    jugador.Imagen = (string)datos.Lector["Imagen"];
                    jugador.Nacionalidad = new Nacionalidad();
                    jugador.Nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    jugador.Equipo = new Equipo();
                    jugador.Equipo.ID = (Int16)datos.Lector["IDE"];
                    jugador.Posicion = new Posicion();
                    jugador.Posicion.Codigo= (string)datos.Lector["Codigo"];
                }
                return jugador;
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

        public void modificar(Jugador jugador)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE Jugadores SET Nombres = '{jugador.Nombres}', Apellidos = '{jugador.Apellidos}', FechaDeNacimiento = '{jugador.FechaDeNacimiento.ToString("yyyy-MM-dd")}', Nacionalidad = '{jugador.Nacionalidad.ISO}', Equipo = {jugador.Equipo.ID}, Imagen = '{jugador.Imagen}', Posicion = '{jugador.Posicion.Codigo}' WHERE ID = {jugador.IDJugador}\r\n");
                datos.ejecutarLectura();
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
        public void agregar(Jugador jugador)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)\r\nvalues ('{jugador.Nombres}', '{jugador.Apellidos}', '{jugador.FechaDeNacimiento.ToString("yyyy-MM-dd")}', '{jugador.Nacionalidad.ISO}',{jugador.Equipo.ID}, '{jugador.Posicion.Codigo}', '{jugador.Imagen}',1)");
                datos.ejecutarAccion();
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
        public void eliminar(string ID)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE Jugadores set Activo = 0 WHERE ID ='{ID}'");
                datos.ejecutarAccion();
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
