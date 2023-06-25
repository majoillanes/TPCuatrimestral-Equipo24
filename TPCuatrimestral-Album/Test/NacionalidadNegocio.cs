using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio2;

namespace Test
{
    public class NacionalidadNegocio
    {
        public List<Nacionalidad> listar()
        {
            List<Nacionalidad> nacionalidades = new List<Nacionalidad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select N.ISO_NAC, N.PAIS_NAC, N.GENTILICIO_NAC, N.Activo from Nacionalidad N");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Nacionalidad nacionalidad = new Nacionalidad();
                    nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    nacionalidad.Pais = (string)datos.Lector["PAIS_NAC"];
                    nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
                    nacionalidad.Activo = (bool)datos.Lector["Activo"];
                    nacionalidades.Add(nacionalidad);
                }
                return nacionalidades;
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
        public List<Nacionalidad> listarDisponilbes()
        {
            List<Nacionalidad> nacionalidades = new List<Nacionalidad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select N.ISO_NAC, N.PAIS_NAC, N.GENTILICIO_NAC, N.Activo from Nacionalidad N WHERE N.Activo = 1 ");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Nacionalidad nacionalidad = new Nacionalidad();
                    nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    nacionalidad.Pais = (string)datos.Lector["PAIS_NAC"];
                    nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
                    nacionalidad.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                    nacionalidades.Add(nacionalidad);
                }
                return nacionalidades;
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
        public Nacionalidad listar(string iso)
        {
            Nacionalidad nacionalidad = new Nacionalidad();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select N.ISO_NAC, N.PAIS_NAC, N.GENTILICIO_NAC, N.Activo from Nacionalidad N WHERE N.ISO_NAC='{iso}'" );
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    nacionalidad.Pais = (string)datos.Lector["PAIS_NAC"];
                    nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
                    nacionalidad.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                }
                return nacionalidad;
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
        public void modificar(Nacionalidad nacionalidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE NACIONALIDAD SET PAIS_NAC = '{nacionalidad.Pais}', GENTILICIO_NAC = '{nacionalidad.Gentilicio}' WHERE ISO_NAC = '{nacionalidad.ISO}'");
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
        public void agregar(Nacionalidad nacionalidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO NACIONALIDAD (ISO_NAC ,PAIS_NAC,GENTILICIO_NAC, ACTIVO) VALUES('{nacionalidad.ISO}','{nacionalidad.Pais}','{nacionalidad.Gentilicio}', 1)");
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
        public void inactivar(string iso, bool activo = false)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                int activoInt = activo ? 1 : 0;
                datos.setearConsulta($"UPDATE Nacionalidad SET Activo = {activoInt} WHERE ISO_NAC ='{iso}'");
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
