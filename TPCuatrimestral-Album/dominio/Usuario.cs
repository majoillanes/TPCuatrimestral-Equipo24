using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Clave { get; set; }
        public decimal Monedas { get; set; }
        public Nivel Nivel  { get; set; }
        public List<Album> Albumes { get; set; }
        public List<Figurita> Figuritas { get; set; }
    }
}
