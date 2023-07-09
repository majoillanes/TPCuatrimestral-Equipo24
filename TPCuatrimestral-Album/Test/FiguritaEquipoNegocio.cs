using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class FiguritaEquipoNegocio
    {
        public List<FiguritaEquipo> listar(int idUsuario)
        {
            List<FiguritaEquipo> figuritas = new List<FiguritaEquipo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select f.Pegada, f.Ubicacion, E.Nombre, E.Alias,E.Ciudad, E.Fundacion, E.Imagen\r\nfrom Usuarios_X_Figuritas UxF\r\nInner join Figuritas f ON f.IDFigurita= UxF.IDFigurita\r\nInner join Figuritas_Equipos fe ON f.IDFigurita=fe.IDFigurita\r\nInner join Equipos E on fe.IDEquipo = E.ID \r\nWHERE UxF.IDUsuario = {idUsuario}");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    FiguritaEquipo figurita = new FiguritaEquipo();
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    figurita.Ubicacion = (Int16)datos.Lector["Ubicacion"];
                    figurita.Equipo = new Equipo();
                    figurita.Equipo.Nombre = (string)datos.Lector["Nombre"];
                    figurita.Equipo.Alias = (string)datos.Lector["Alias"];
                    figurita.Equipo.Ciudad = (string)datos.Lector["Ciudad"];
                    figurita.Equipo.Fundacion = (string)datos.Lector["Fundacion"];
                    figurita.Equipo.Imagen = (string)datos.Lector["Imagen"];
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
