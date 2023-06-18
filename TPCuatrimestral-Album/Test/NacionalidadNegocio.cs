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
                datos.setearConsulta("select N.ISO_NAC, N.PAIS_NAC, N.GENTILICIO_NAC from Nacionalidad N");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Nacionalidad nacionalidad = new Nacionalidad();
                    nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    nacionalidad.Pais = (string)datos.Lector["PAIS_NAC"];
                    nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
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
                datos.setearConsulta($"select N.ISO_NAC, N.PAIS_NAC, N.GENTILICIO_NAC from Nacionalidad N WHERE N.ISO_NAC='{iso}'" );
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    nacionalidad.Pais = (string)datos.Lector["PAIS_NAC"];
                    nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
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
        public Nacionalidad modificar(Nacionalidad nacionalidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"UPDATE NACIONALIDAD SET PAIS_NAC = '{nacionalidad.Pais}', GENTILICIO_NAC = '{nacionalidad.Gentilicio}' WHERE ISO_NAC = '{nacionalidad.ISO}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    nacionalidad.ISO = (string)datos.Lector["ISO_NAC"];
                    nacionalidad.Pais = (string)datos.Lector["PAIS_NAC"];
                    nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
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
        public void agregar(Nacionalidad nacionalidad)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO NACIONALIDAD (ISO_NAC ,PAIS_NAC,GENTILICIO_NAC) VALUES('{nacionalidad.ISO}','{nacionalidad.Pais}','{nacionalidad.Gentilicio}')");
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
        public void eliminar(string iso)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"DELETE FROM NACIONALIDAD WHERE ISO_NAC ='{iso}'");
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
