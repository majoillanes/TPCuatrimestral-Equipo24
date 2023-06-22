﻿using dominio2;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test
{
    public class PosicionNegocio
    {
        public List<Posicion> listar()
        {
            List<Posicion> posiciones = new List<Posicion>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select Codigo, Descripcion from Posiciones");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Posicion posicion = new Posicion();
                    posicion.Codigo = (string)datos.Lector["Codigo"];
                    posicion.Descripcion = (string)datos.Lector["Descripcion"];
                    posiciones.Add(posicion);
                }
                return posiciones;
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
