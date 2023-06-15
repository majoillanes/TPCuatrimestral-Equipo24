using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Jugador
    {
        public int IDJugador { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public DateTime FechaDeNacimiento { get; set; }
        public string Nacionalidad { get; set; }
        public string Equipo { get; set; }
        public string Posicion { get; set; }
        public string Imagen { get; set; }
        public bool Activo { get; set; }
    }
}
