using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class EstadioNegocio
    {
        public List<Estadio> listar()
        {
            List<Estadio> estadios = new List<Estadio>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT ID, Nombre, Alias, Capacidad, Barrio, Calle, Imagen, Activo FROM Estadios");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Estadio estadio = new Estadio();
                    estadio.ID = (Int16)datos.Lector["ID"];
                    estadio.Nombre = (string)datos.Lector["Nombre"];
                    estadio.Alias = datos.Lector["Alias"] is DBNull ? "-" : (string)datos.Lector["Alias"];
                    estadio.Capacidad = (string)datos.Lector["Capacidad"];
                    estadio.Barrio = (string)datos.Lector["Barrio"];
                    estadio.Calle = (string)datos.Lector["Calle"];
                    estadio.Imagen = (string)datos.Lector["Imagen"];
                    estadio.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                    estadios.Add(estadio);
                }
                return estadios;
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

        public List<Estadio> listarDisponibles()
        {
            List<Estadio> estadios = new List<Estadio>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT Es.ID, Es.Nombre FROM Estadios Es\r\nLEFT JOIN Equipos Eq ON Eq.Estadio = Es.ID\r\nWHERE Eq.ID IS NULL AND Es.Activo = 1");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Estadio estadio = new Estadio();
                    estadio.ID = (Int16)datos.Lector["ID"];
                    estadio.Nombre = (string)datos.Lector["Nombre"];
                    estadios.Add(estadio);
                }
                return estadios;
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
        public Estadio listar(string ID)
        {
            Estadio estadio = new Estadio();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"SELECT ID, Nombre, Alias, Capacidad, Barrio, Calle, Imagen,Activo FROM Estadios WHERE ID ='{ID}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    estadio.ID = (Int16)datos.Lector["ID"];
                    estadio.Nombre = (string)datos.Lector["Nombre"];
                    estadio.Alias = datos.Lector["Alias"] is DBNull ? "-" : (string)datos.Lector["Alias"];
                    estadio.Capacidad = (string)datos.Lector["Capacidad"];
                    estadio.Barrio = (string)datos.Lector["Barrio"];
                    estadio.Calle = (string)datos.Lector["Calle"];
                    estadio.Imagen = (string)datos.Lector["Imagen"];
                    estadio.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                }
                return estadio;
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
        public Estadio listarddl(Int16 ID)
        {
            Estadio estadio = new Estadio();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"SELECT ID, Nombre FROM Estadios WHERE ID ='{ID}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    estadio.ID = (Int16)datos.Lector["ID"];
                    estadio.Nombre = (string)datos.Lector["Nombre"];
                }
                return estadio;
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
        public Estadio modificar(Estadio estadio)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE ESTADIOS SET Nombre = '{estadio.Nombre}', Alias = '{estadio.Alias}', Capacidad = '{estadio.Capacidad}', Barrio = '{estadio.Barrio}', Calle = '{estadio.Calle}', Imagen = '{estadio.Imagen}' FROM Estadios WHERE ID = '{estadio.ID}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    estadio.ID = (int)datos.Lector["ID"];
                    estadio.Nombre = (string)datos.Lector["Nombre"];
                    estadio.Alias = datos.Lector["Alias"] is DBNull ? "-" : (string)datos.Lector["Alias"];
                    estadio.Capacidad = (string)datos.Lector["Capacidad"];
                    estadio.Barrio = (string)datos.Lector["Barrio"];
                    estadio.Calle = (string)datos.Lector["Calle"];
                    estadio.Imagen = (string)datos.Lector["Imagen"];
                }
                return estadio;
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
        public void agregar(Estadio estadio)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO ESTADIOS (Nombre, Alias, Capacidad, Barrio, Calle, Imagen) VALUES('{estadio.Nombre}','{estadio.Alias}','{estadio.Capacidad}','{estadio.Barrio}','{estadio.Calle}','{estadio.Imagen}')");
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
        public void eliminar(string ID, bool activo = false)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                int activoInt = activo ? 1 : 0;
                datos.setearConsulta($"UPDATE Estadios SET Activo = {activoInt} WHERE ID ='{ID}'");
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
