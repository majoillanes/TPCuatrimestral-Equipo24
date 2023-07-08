using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class FiguritaEstadioNegocio
    {
        public List<FiguritaEstadio> listar(int idUsuario)
        {
            List<FiguritaEstadio> figuritas = new List<FiguritaEstadio>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select f.Pegada, f.Ubicacion, E.Nombre, E.Alias,E.Capacidad, E.Barrio, E.Calle, E.Imagen\r\nfrom Usuarios_X_Figuritas UxF\r\nInner join Figuritas f ON f.IDFigurita= UxF.IDFigurita\r\nInner join Figuritas_Estadios fe ON f.IDFigurita=fe.IDFigurita\r\nInner join Estadios E on fe.IDEstadios = E.ID \r\nWHERE UxF.IDUsuario = {idUsuario}");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    FiguritaEstadio figurita = new FiguritaEstadio();
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    figurita.Ubicacion = (Int16)datos.Lector["Ubicacion"];
                    figurita.Estadio = new Estadio();
                    figurita.Estadio.Nombre = (string)datos.Lector["Nombre"];
                    figurita.Estadio.Alias = datos.Lector["Alias"] is DBNull ? " " : (string)datos.Lector["Alias"];
                    //figurita.Ubicacion = accesoDatos.Lector["Ubicacion"] is DBNull ? 0 : (Int16)accesoDatos.Lector["Ubicacion"];
                    figurita.Estadio.Capacidad = (string)datos.Lector["Capacidad"];
                    figurita.Estadio.Barrio = (string)datos.Lector["Barrio"];
                    figurita.Estadio.Calle = (string)datos.Lector["Calle"];
                    figurita.Estadio.Imagen = (string)datos.Lector["Imagen"];
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
