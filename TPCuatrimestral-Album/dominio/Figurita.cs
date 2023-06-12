using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Figurita
    {
        public int IdFigurita { get; set; }
        public TipoDeFigurita TipoDeFigurita { get; set; }
        public Album Album { get; set; }
        public bool Pegada { get; set; }
        public bool Activo { get; set; }
    }
}
