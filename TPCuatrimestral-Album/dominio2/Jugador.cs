﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio2
{
    public class Jugador
    {
        public int IDJugador { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public DateTime FechaDeNacimiento { get; set; }
        public Nacionalidad Nacionalidad { get; set; }
        public Equipo Equipo { get; set; }
        public Posicion Posicion { get; set; }
        public string Imagen { get; set; }
        public bool Activo { get; set; }
    }
}
