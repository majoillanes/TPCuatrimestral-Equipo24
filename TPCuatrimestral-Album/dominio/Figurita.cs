﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Figurita
    {
        public int IDFigurita { get; set; }
        public TipoDeFigurita TipoDeFigurita { get; set; }
        public int IDAlbum { get; set; }
       // public int PrecioVenta { get; set; }
        public bool Pegada { get; set; }
        public bool Activo { get; set; }
        public Jugador  Jugador { get; set; }
    }
}
