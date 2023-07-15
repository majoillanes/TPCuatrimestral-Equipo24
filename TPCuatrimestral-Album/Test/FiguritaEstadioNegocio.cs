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
        public void Agregar(FiguritaEstadio figuritaEstadio, Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Figuritas_Estadios VALUES ({figuritaEstadio.IDFigurita}, {figuritaEstadio.Estadio.ID}); Update Figuritas SET Ubicacion ={figuritaEstadio.Ubicacion} WHERE IDFigurita = {figuritaEstadio.IDFigurita} ; insert into Usuarios_X_Figuritas values ({usuario.Id},{figuritaEstadio.IDFigurita})");
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
        public int ListarIDPorIDFigurita(int IDFigurita)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idFiguritaEstadio = new int();
                accesoDatos.setearConsulta($"SELECT ID FROM Figuritas_Estadios WHERE IDFigurita = {IDFigurita}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idFiguritaEstadio = (int)accesoDatos.Lector["ID"];
                }
                return idFiguritaEstadio;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
        public int ListarIDEstadioPorID(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idEstadio = new int();
                accesoDatos.setearConsulta($"SELECT IDEstadios FROM Figuritas_Estadios WHERE ID = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idEstadio = (Int16)accesoDatos.Lector["IDEstadios"];
                }
                return idEstadio;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
        public bool EsEstadio(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idEstadio = -1;
                accesoDatos.setearConsulta($"SELECT IDEstadio FROM Figuritas_Estadios WHERE IDFigurita = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idEstadio = (int)accesoDatos.Lector["IDEstadio"];
                }
                if (idEstadio == -1)
                    return false;
                else
                    return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public List<FiguritaEstadio> filtrar(int idUsuario, string campo, string criterio)
        {
            List<FiguritaEstadio> figuritas = new List<FiguritaEstadio>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = $"select f.Pegada, f.Ubicacion, E.Nombre, E.Alias,E.Capacidad, E.Barrio, E.Calle, E.Imagen\r\nfrom Usuarios_X_Figuritas UxF\r\nInner join Figuritas f ON f.IDFigurita= UxF.IDFigurita\r\nInner join Figuritas_Estadios fe ON f.IDFigurita=fe.IDFigurita\r\nInner join Estadios E on fe.IDEstadios = E.ID \r\nInner join Equipos Eq on Eq.Estadio = E.ID\r\nWHERE UxF.IDUsuario = \r\n {idUsuario} and f.Pegada = 0 and ";
                if (campo == "Equipo")
                    consulta += $"Eq.ID = {criterio}";
                else
                    consulta += $"P.Codigo = '{criterio}'";

                datos.setearConsulta(consulta);
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
