using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio2
{
    public class Equipo
    {
        public Int16 ID { get; set; }
        public string Nombre { get; set; }
        public string Imagen { get; set; }
        public string Ciudad { get; set; }
        public  Int16 IDEstadio { get; set; }
        public Int16 Fundacion { get; set; }
        public string Alias { get; set; }
        public bool Activo { get; set; }
    }
}
