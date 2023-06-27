using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class EquipoNegocio
    {
        public List<Equipo> listar()
        {
            List<Equipo> equipos = new List<Equipo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select E.ID, E.Nombre, E.Ciudad, E.Imagen, E.Alias, E.Fundacion, E.Estadio, E.Imagen, E.Activo from Equipos E");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Equipo equipo = new Equipo();
                    equipo.ID = (Int16)datos.Lector["ID"];
                    equipo.Nombre = (string)datos.Lector["Nombre"];
                    equipo.Ciudad = (string)datos.Lector["Ciudad"];
                    equipo.Imagen = (string)datos.Lector["Imagen"];
                    equipo.IDEstadio = (Int16)datos.Lector["Estadio"];
                    equipo.Fundacion = (string)datos.Lector["Fundacion"];
                    equipo.Alias = datos.Lector["Alias"] is DBNull ? "-" : (string)datos.Lector["Alias"];
                    equipo.Activo = (bool)datos.Lector["Activo"];
                    equipos.Add(equipo);
                }
                return equipos;
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
        public Equipo listar(string id)
        {
            Equipo equipo= new Equipo();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select E.ID, E.Nombre, E.Ciudad, E.Imagen, E.Alias, E.Fundacion, E.Estadio, E.Imagen, E.Activo from Equipos E WHERE E.ID='{id}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    equipo.ID = (Int16)datos.Lector["ID"];
                    equipo.Nombre = (string)datos.Lector["Nombre"];
                    equipo.Ciudad = (string)datos.Lector["Ciudad"];
                    equipo.Imagen = (string)datos.Lector["Imagen"];
                    equipo.IDEstadio = (Int16)datos.Lector["Estadio"];
                    equipo.Fundacion = (string)datos.Lector["Fundacion"];
                    equipo.Alias = (string)datos.Lector["Alias"];
                    equipo.Activo = (bool)datos.Lector["Activo"];
                }
                return equipo;
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
        public void modificar(Equipo equipo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE Equipos SET Nombre = '{equipo.Nombre}', Alias = '{equipo.Alias}', Ciudad = '{equipo.Ciudad}', Fundacion = {equipo.Fundacion}, Estadio = {equipo.IDEstadio}, Imagen = '{equipo.Imagen}' WHERE ID = {equipo.ID}\r\n");
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
        public void agregar(Equipo equipo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Equipos(Nombre, Alias, Ciudad, Fundacion, Estadio, Imagen, Activo )\r\nvalues('{equipo.Nombre}', '{equipo.Alias}','{equipo.Ciudad}','{equipo.Fundacion}', {equipo.IDEstadio},'{equipo.Imagen}',1)");
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
        public void eliminar(string id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE Equipos SET Activo = 0 WHERE ID ='{id}'");
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
