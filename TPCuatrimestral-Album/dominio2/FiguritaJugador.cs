using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio2
{
    public class FiguritaJugador : Figurita
    {
        public int ID { get; set; }
        public int IDJugador { get; set; }
        public int Ubicacion { get; set; }
        public Jugador Jugador { get; set; }
    }
}
