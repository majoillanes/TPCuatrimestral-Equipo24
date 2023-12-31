﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using dominio2;

namespace Test
{
    public class FiguritaJugadorNegocio
    {
        public List<FiguritaJugador> listar(int idUsuario)
        {
            List<FiguritaJugador> figuritas = new List<FiguritaJugador>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select f.Pegada, f.Ubicacion,j.Imagen, j.Nombres, j.Apellidos, j.FechaDeNacimiento, p.Descripcion, e.Nombre,n.GENTILICIO_NAC from Usuarios_X_Figuritas UxF \r\ninner join Figuritas f ON f.IDFigurita= UxF.IDFigurita\r\nInner join Figuritas_Jugadores fj ON f.IDFigurita=fj.IDFigurita\r\nInner join Jugadores j on fj.IDJugador = j.ID \r\nInner join Posiciones p on p.Codigo = j.Posicion\r\nInner join Nacionalidad n on n.ISO_NAC = j.Nacionalidad\r\ninner join Equipos e on e.ID = j.Equipo\r\nWHERE UxF.IDUsuario = {idUsuario}");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    FiguritaJugador figurita = new FiguritaJugador();
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    figurita.Ubicacion = (Int16)datos.Lector["Ubicacion"];
                    figurita.Jugador = new Jugador();
                    figurita.Jugador.Nombres = (string)datos.Lector["Nombres"];
                    figurita.Jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    figurita.Jugador.Imagen = (string)datos.Lector["Imagen"];
                    figurita.Jugador.FechaDeNacimiento = (DateTime)datos.Lector["FechaDeNacimiento"];
                    figurita.Jugador.Posicion = new Posicion();
                    figurita.Jugador.Posicion.Codigo = (string)datos.Lector["Descripcion"];
                    figurita.Jugador.Equipo = new Equipo();
                    figurita.Jugador.Equipo.Nombre = (string)datos.Lector["Nombre"];
                    figurita.Jugador.Nacionalidad = new Nacionalidad();
                    figurita.Jugador.Nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
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
        public void Agregar(FiguritaJugador figuritaJugador, Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"INSERT INTO Figuritas_Jugadores VALUES ({figuritaJugador.IDFigurita}, {figuritaJugador.Jugador.IDJugador}); Update Figuritas SET Ubicacion ={figuritaJugador.Ubicacion} WHERE IDFigurita = {figuritaJugador.IDFigurita} ; insert into Usuarios_X_Figuritas values ({usuario.Id},{figuritaJugador.IDFigurita})");
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

        public FiguritaJugador listarUbicacion(int ubicacion)
        {
            FiguritaJugador figurita = new FiguritaJugador();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta($"select f.Pegada, f.Ubicacion,j.Imagen, j.Nombres, j.Apellidos, j.FechaDeNacimiento, p.Descripcion, e.Nombre,n.GENTILICIO_NAC from Usuarios_X_Figuritas UxF \r\ninner join Figuritas f ON f.IDFigurita= UxF.IDFigurita\r\nInner join Figuritas_Jugadores fj ON f.IDFigurita=fj.IDFigurita\r\nInner join Jugadores j on fj.IDJugador = j.ID \r\nInner join Posiciones p on p.Codigo = j.Posicion\r\nInner join Nacionalidad n on n.ISO_NAC = j.Nacionalidad\r\ninner join Equipos e on e.ID = j.Equipo\r\nWHERE f.Ubicacion = {ubicacion}");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    figurita.Ubicacion = (Int16)datos.Lector["Ubicacion"];
                    figurita.Jugador = new Jugador();
                    figurita.Jugador.Nombres = (string)datos.Lector["Nombres"];
                    figurita.Jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    figurita.Jugador.Imagen = (string)datos.Lector["Imagen"];
                    figurita.Jugador.FechaDeNacimiento = (DateTime)datos.Lector["FechaDeNacimiento"];
                    figurita.Jugador.Posicion = new Posicion();
                    figurita.Jugador.Posicion.Codigo = (string)datos.Lector["Descripcion"];
                    figurita.Jugador.Equipo = new Equipo();
                    figurita.Jugador.Equipo.Nombre = (string)datos.Lector["Nombre"];
                    figurita.Jugador.Nacionalidad = new Nacionalidad();
                    figurita.Jugador.Nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
                }
                return figurita;
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
                int idFiguritaJugador = new int();
                accesoDatos.setearConsulta($"SELECT ID FROM Figuritas_Jugadores WHERE IDFigurita = {IDFigurita}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idFiguritaJugador = (int)accesoDatos.Lector["ID"];

                }
                return idFiguritaJugador;
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
        public int ListarIDJugadorPorID(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idJugador = new int();
                accesoDatos.setearConsulta($"SELECT IDJugador FROM Figuritas_Jugadores WHERE ID = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idJugador = (int)accesoDatos.Lector["IDJugador"];
                }
                return idJugador;
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
        public int EsJugador(int ID)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                int idJugador = -1;
                accesoDatos.setearConsulta($"SELECT ID FROM Figuritas_Jugadores WHERE IDFigurita = {ID}");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    idJugador = (int)accesoDatos.Lector["ID"];
                }
                return idJugador;
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
        public List<FiguritaJugador> filtrar(int idUsuario, string campo, string criterio)
        {
            List<FiguritaJugador> figuritas = new List<FiguritaJugador>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = $"select f.Pegada, f.Ubicacion,j.Imagen, j.Nombres, j.Apellidos, j.FechaDeNacimiento, p.Descripcion, e.Nombre, e.Id,n.GENTILICIO_NAC from Usuarios_X_Figuritas UxF \r\ninner join Figuritas f ON f.IDFigurita = UxF.IDFigurita\r\nInner join Figuritas_Jugadores fj ON f.IDFigurita = fj.IDFigurita\r\nInner join Jugadores j on fj.IDJugador = j.ID \r\nInner join Posiciones p on p.Codigo = j.Posicion\r\nInner join Nacionalidad n on n.ISO_NAC = j.Nacionalidad\r\ninner join Equipos e on e.ID = j.Equipo\r\nWHERE UxF.IDUsuario = { idUsuario} and f.Pegada = 0 and ";
                
                if (campo == "Equipo")
                    consulta += $"E.ID = {criterio}";
                else
                    consulta += $"P.Codigo = '{criterio}'";
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {

                    FiguritaJugador figurita = new FiguritaJugador();
                    figurita.Pegada = (bool)datos.Lector["Pegada"];
                    figurita.Ubicacion = (Int16)datos.Lector["Ubicacion"];
                    figurita.Jugador = new Jugador();
                    figurita.Jugador.Nombres = (string)datos.Lector["Nombres"];
                    figurita.Jugador.Apellidos = (string)datos.Lector["Apellidos"];
                    figurita.Jugador.Imagen = (string)datos.Lector["Imagen"];
                    figurita.Jugador.FechaDeNacimiento = (DateTime)datos.Lector["FechaDeNacimiento"];
                    figurita.Jugador.Posicion = new Posicion();
                    figurita.Jugador.Posicion.Codigo = (string)datos.Lector["Descripcion"];
                    figurita.Jugador.Equipo = new Equipo();
                    figurita.Jugador.Equipo.Nombre = (string)datos.Lector["Nombre"];
                    figurita.Jugador.Nacionalidad = new Nacionalidad();
                    figurita.Jugador.Nacionalidad.Gentilicio = (string)datos.Lector["GENTILICIO_NAC"];
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
