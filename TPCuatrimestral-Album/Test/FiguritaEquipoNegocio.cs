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
        public void Agregar(FiguritaEquipo figuritaEquipo, Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Figuritas_Equipos VALUES ({figuritaEquipo.IDFigurita}, {figuritaEquipo.Equipo.ID}); Update Figuritas SET Ubicacion ={figuritaEquipo.Ubicacion} WHERE IDFigurita = {figuritaEquipo.IDFigurita} ; insert into Usuarios_X_Figuritas values ({usuario.Id},{figuritaEquipo.IDFigurita})");
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
                int idFiguritaEquipo = new int();
                accesoDatos.setearConsulta($"SELECT ID FROM Figuritas_Equipos WHERE IDFigurita = {IDFigurita}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idFiguritaEquipo = (int)accesoDatos.Lector["ID"];
                }
                return idFiguritaEquipo;
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
        public bool EsEquipo(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idEquipo = -1;
                accesoDatos.setearConsulta($"SELECT IDEquipo FROM Figuritas_Equipos WHERE IDFigurita = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idEquipo = (int)accesoDatos.Lector["IDEquipo"];
                }
                if (idEquipo == -1)
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
        public int ListarIDEquipoPorID(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idEquipo = new int();
                accesoDatos.setearConsulta($"SELECT IDEquipo FROM Figuritas_Equipos WHERE ID = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idEquipo = (Int16)accesoDatos.Lector["IDEquipo"];
                }
                return idEquipo;
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

        public List<FiguritaEquipo> filtrar(int idUsuario, string campo, string criterio)
        {
            List<FiguritaEquipo> figuritas = new List<FiguritaEquipo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = $"select f.Pegada, f.Ubicacion, E.Nombre, E.Alias,E.Ciudad, E.Fundacion, E.Imagen\r\nfrom Usuarios_X_Figuritas UxF\r\nInner join Figuritas f ON f.IDFigurita= UxF.IDFigurita\r\nInner join Figuritas_Equipos fe ON f.IDFigurita=fe.IDFigurita\r\nInner join Equipos E on fe.IDEquipo = E.ID \r\nWHERE UxF.IDUsuario = {idUsuario} and f.Pegada = 0 and ";

                if (campo == "Equipo")
                    consulta += $"E.ID = {criterio}";
                else
                    consulta += $"P.Codigo = '{criterio}'";
                datos.setearConsulta(consulta);
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
