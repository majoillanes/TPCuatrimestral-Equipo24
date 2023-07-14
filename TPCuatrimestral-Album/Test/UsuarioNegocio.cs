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
                datos.setearConsulta($"select u.ID,u.Nombre,u.Monedas, n.Nombre as NombreNivel from Usuarios U Inner join Niveles N on n.ID = u.Nivel WHERE u.Email = '{usuario.Email}' and u.Clave = '{usuario.Clave}'");
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["ID"];
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Monedas = (int)datos.Lector["Monedas"];
                    usuario.Nivel = new Nivel();
                    usuario.Nivel.Nombre = (string)datos.Lector["NombreNivel"];
                    return true;
                }
                return false;
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
        public void crearUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Usuarios(Nombre, Apellido, Email, Clave, Monedas, Nivel) values ('{usuario.Nombre}','{usuario.Apellido}','{usuario.Email}','{usuario.Clave}',0,2)");
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

        public DateTime consultarUltimoPaquete(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            DateTime ultimoPaquete = new DateTime();
            try
            {
                datos.setearConsulta($"SELECT ISNULL(UltimoPaquete, '0001-01-01') AS UltimoPaquete FROM Usuarios WHERE ID = {usuario.Id}");

                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    ultimoPaquete = (DateTime)datos.Lector["UltimoPaquete"];
                }
                return ultimoPaquete;
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

        public void actualizarFechaPaquete(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"update Usuarios set UltimoPaquete = GETDATE() WHERE ID = {usuario.Id}");
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
