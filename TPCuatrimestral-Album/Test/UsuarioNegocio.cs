using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class UsuarioNegocio
    {
        public bool ingresar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta($"select u.ID,u.Nombre, n.Nombre as NombreNivel from Usuarios U Inner join Niveles N on n.ID = u.Nivel WHERE u.Email = '{usuario.Email}' and u.Clave = '{usuario.Clave}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["ID"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Nivel = new Nivel();
                    usuario.Nivel.Nombre = (string)datos.Lector["NombreNivel"];
                    return true;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return false;
        }
        public void crearUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Usuarios values ('{usuario.Nombre}','{usuario.Apellido}','{usuario.Email}','{usuario.Clave}',0,2)");
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
