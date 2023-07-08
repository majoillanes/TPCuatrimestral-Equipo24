using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio2
{
    public class FiguritaEstadio : Figurita
    {
        public int ID { get; set; }
        public Estadio Estadio { get; set; }
    }
}
