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
                datos.setearConsulta($"select u.ID, n.Nombre from Usuarios U Inner join Niveles N on n.ID = u.Nivel WHERE u.Email = '{usuario.Email}' and u.Clave = '{usuario.Clave}'");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Nivel = new Nivel();
                    usuario.Nivel.Nombre = (string)datos.Lector["Nombre"];
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
    }
}
