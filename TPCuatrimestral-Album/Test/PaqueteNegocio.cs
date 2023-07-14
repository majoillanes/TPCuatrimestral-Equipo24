using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class PaqueteNegocio
    {
        enum Tipo
        {
            Jugador,
            Equipo,
            Estadio
        }
        public void GenerarFiguritas(Usuario usuario)
        {
            FiguritaNegocio figuritaNegocio = new FiguritaNegocio();
            Figurita figurita = new Figurita();
            figurita.TipoDeFigurita = new TipoDeFigurita();
            //figurita.TipoDeFigurita.Id = 3;
            FiguritaJugador figuritaJugador = new FiguritaJugador();
            //List<Figurita> listaFiguritas = new List<Figurita>();
            JugadorNegocio jugadorNegocio = new JugadorNegocio();
            FiguritaJugadorNegocio figuritaJugadorNegocio = new FiguritaJugadorNegocio();
            Random random = new Random();
            //int numRandom;

            for (int i = 0; i < 5; i++)
            {
                //numRandom = random.Next(9);
                //figuritaNegocio.Agregar(figurita); // Crea las 5 figuritas
                //figuritaJugador.Jugador = new Jugador();
                //figuritaJugador.Jugador.IDJugador = random.Next(1, 308);
                //figuritaJugador.Jugador = jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador);
                //figuritaJugador.IDFigurita = figuritaNegocio.Listar().Last().IDFigurita;
                //figuritaJugador.TipoDeFigurita = new TipoDeFigurita();
                //figuritaJugador.TipoDeFigurita.Id = 3;
                //figuritaJugador.Ubicacion = (Int16)(figuritaJugador.Jugador.IDJugador + 2 * jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador).Equipo.ID);
                //figuritaNegocio.ActualizarUbicacion(figuritaJugador);
                //listaFiguritas.Add(figuritaJugador);
                GeneracionTIpoRandom(random.Next(9), usuario);
                //figuritaJugadorNegocio.Agregar(figuritaJugador, usuario);
            }

            //return listaFiguritas;

            // Ubicacion = ID + 2 * equipo
        }

        public List<Figurita> MasRecientes()
        {
            AccesoDatos datos = new AccesoDatos();
            JugadorNegocio jugadorNegocio = new JugadorNegocio();

            List<Figurita> figuritas = new List<Figurita>();
            try
            {
                //datos.setearConsulta("SELECT TOP 5 ID, IDFigurita, IDJugador FROM Figuritas_Jugadores ORDER BY IDFigurita DESC");
                datos.setearConsulta("SELECT TOP 5 F.IDFigurita, FEQ.IDEquipo, FES.IDEstadios, FJ.IDJugador FROM Figuritas F LEFT JOIN Figuritas_Equipos FEQ ON FEQ.IDFigurita = F.IDFigurita LEFT JOIN Figuritas_Estadios FES ON FES.IDFigurita = F.IDFigurita LEFT JOIN Figuritas_Jugadores FJ ON FJ.IDFigurita = F.IDFigurita ORDER BY F.IDFigurita DESC");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    FiguritaJugador figuritaJugador = new FiguritaJugador();
                    FiguritaEquipo figuritaEquipo = new FiguritaEquipo();
                    FiguritaEstadio figuritaEstadio = new FiguritaEstadio();
                    Tipo tipo = new Tipo();
                    if (!(datos.Lector["IDJugador"] is DBNull))
                        tipo = Tipo.Jugador;
                    else if (!(datos.Lector["IDEquipo"] is DBNull))
                        tipo = Tipo.Equipo;
                    else
                        tipo = Tipo.Estadio;
                    switch (tipo)
                    {
                        case Tipo.Jugador:
                            FiguritaJugadorNegocio figuritaJugadorNegocio = new FiguritaJugadorNegocio();
                            figuritaJugador.IDFigurita = (int)datos.Lector["IDFigurita"];
                            figuritaJugador.ID = figuritaJugadorNegocio.ListarIDPorIDFigurita(figuritaJugador.IDFigurita);
                            figuritaJugador.Jugador = new Jugador();
                            figuritaJugador.Jugador.IDJugador = figuritaJugadorNegocio.ListarIDJugadorPorID(figuritaJugador.ID);
                            figuritaJugador.Jugador = jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador);
                            figuritaJugador.TipoDeFigurita = new TipoDeFigurita();
                            //figuritaJugador.TipoDeFigurita.Id = (byte)datos.Lector["Tipo"];
                            figuritas.Add(figuritaJugador);
                            break;
                        case Tipo.Equipo:
                            FiguritaEquipoNegocio figuritaEquipoNegocio = new FiguritaEquipoNegocio();
                            EquipoNegocio equipoNegocio = new EquipoNegocio();
                            figuritaEquipo.IDFigurita = (int)datos.Lector["IDFigurita"];
                            figuritaEquipo.ID = figuritaEquipoNegocio.ListarIDPorIDFigurita(figuritaEquipo.IDFigurita);
                            figuritaEquipo.Equipo = new Equipo();
                            figuritaEquipo.Equipo.ID = (Int16)figuritaEquipoNegocio.ListarIDEquipoPorID(figuritaEquipo.ID);
                            figuritaEquipo.Equipo = equipoNegocio.listar(figuritaEquipo.Equipo.ID);
                            figuritaEquipo.TipoDeFigurita = new TipoDeFigurita();
                            figuritas.Add(figuritaEquipo);
                            break;
                        case Tipo.Estadio:
                            FiguritaEstadioNegocio figuritaEstadioNegocio = new FiguritaEstadioNegocio();
                            EstadioNegocio estadioNegocio = new EstadioNegocio();
                            figuritaEstadio.IDFigurita = (int)datos.Lector["IDFigurita"];
                            figuritaEstadio.ID = figuritaEstadioNegocio.ListarIDPorIDFigurita(figuritaEstadio.IDFigurita);
                            figuritaEstadio.Estadio = new Estadio();
                            figuritaEstadio.Estadio.ID = (Int16)figuritaEstadioNegocio.ListarIDEstadioPorID(figuritaEstadio.ID);
                            figuritaEstadio.Estadio = estadioNegocio.listar(figuritaEstadio.Estadio.ID);
                            figuritaEstadio.TipoDeFigurita = new TipoDeFigurita();
                            figuritas.Add(figuritaEstadio);
                            break;
                        default:
                            break;
                    }
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
        public Figurita GeneracionTIpoRandom(int random, Usuario usuario)
        {
            FiguritaNegocio figuritaNegocio = new FiguritaNegocio();
            Figurita figurita = new Figurita();
            figurita.TipoDeFigurita = new TipoDeFigurita();
            if (random < 1)
                figurita.TipoDeFigurita.Id = 1;
            else if (random < 5)
                figurita.TipoDeFigurita.Id = 2;
            else
                figurita.TipoDeFigurita.Id = 3;

            Random r = new Random();
            random = r.Next(9);
            Tipo tipo;
            switch (figurita.TipoDeFigurita.Id)
            {
                case 1:
                    tipo = Tipo.Jugador;
                    break;
                case 2:
                    if (random > 2)
                        tipo = Tipo.Jugador;
                    else
                        tipo = Tipo.Equipo;
                    break;
                default:
                    if (random > 2)
                        tipo = Tipo.Jugador;
                    else
                        tipo = Tipo.Estadio;
                    break;
            }

            figuritaNegocio.Agregar(figurita);

            switch (tipo)
            {
                case Tipo.Jugador:
                    FiguritaJugador figuritaJugador = new FiguritaJugador();
                    FiguritaJugadorNegocio figuritaJugadorNegocio = new FiguritaJugadorNegocio();
                    JugadorNegocio jugadorNegocio = new JugadorNegocio();
                    figuritaJugador.Jugador = new Jugador();
                    figuritaJugador.Jugador.IDJugador = jugadorNegocio.RandomSegunTipo(figurita.TipoDeFigurita.Id);
                    figuritaJugador.Jugador = jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador);
                    figuritaJugador.IDFigurita = figuritaNegocio.Listar().Last().IDFigurita;
                    figuritaJugador.TipoDeFigurita = new TipoDeFigurita();
                    figuritaJugador.TipoDeFigurita.Id = figurita.TipoDeFigurita.Id;
                    figuritaJugador.Ubicacion = (Int16)(figuritaJugador.Jugador.IDJugador + 2 * jugadorNegocio.listar(figuritaJugador.Jugador.IDJugador).Equipo.ID);
                    figuritaNegocio.ActualizarUbicacion(figuritaJugador);
                    figuritaJugadorNegocio.Agregar(figuritaJugador, usuario);
                    return figuritaJugador;
                    break;
                case Tipo.Equipo:
                    FiguritaEquipo figuritaEquipo = new FiguritaEquipo();
                    EquipoNegocio equipoNegocio = new EquipoNegocio();
                    FiguritaEquipoNegocio figuritaEquipoNegocio = new FiguritaEquipoNegocio();
                    figuritaEquipo.Equipo = new Equipo();
                    figuritaEquipo.Equipo.ID = (short)r.Next(1, 28);
                    figuritaEquipo.Equipo = equipoNegocio.listar(figuritaEquipo.Equipo.ID);
                    figuritaEquipo.IDFigurita = figuritaNegocio.Listar().Last().IDFigurita;
                    figuritaEquipo.TipoDeFigurita = new TipoDeFigurita();
                    figuritaEquipo.TipoDeFigurita.Id = figurita.TipoDeFigurita.Id;
                    figuritaEquipo.Ubicacion = (short)(13 * (figuritaEquipo.Equipo.ID - 1) + 1);
                    figuritaNegocio.ActualizarUbicacion(figuritaEquipo);
                    figuritaEquipoNegocio.Agregar(figuritaEquipo, usuario);
                    return figuritaEquipo;
                    break;
                default:
                    FiguritaEstadio figuritaEstadio = new FiguritaEstadio();
                    EstadioNegocio estadioNegocio = new EstadioNegocio();
                    FiguritaEstadioNegocio figuritaEstadioNegocio = new FiguritaEstadioNegocio();
                    figuritaEstadio.Estadio = new Estadio();
                    figuritaEstadio.Estadio.ID = r.Next(1, 28);
                    figuritaEstadio.Estadio = estadioNegocio.listar(figuritaEstadio.Estadio.ID);
                    figuritaEstadio.IDFigurita = figuritaNegocio.Listar().Last().IDFigurita;
                    figuritaEstadio.TipoDeFigurita = new TipoDeFigurita();
                    figuritaEstadio.TipoDeFigurita.Id = figurita.TipoDeFigurita.Id;
                    figuritaEstadio.Ubicacion = (short)(13 * (figuritaEstadio.Estadio.ID - 1) + 2);
                    figuritaEstadioNegocio.Agregar(figuritaEstadio, usuario);
                    return figuritaEstadio;
                    break;
            }


            //listaFiguritas.Add(figuritaJugador);
            //figuritaJugadorNegocio.Agregar(figuritaJugador, usuario);
        }


    }
}
