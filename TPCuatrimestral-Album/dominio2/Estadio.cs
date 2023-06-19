using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio2
{
    public class Estadio
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Alias { get; set; }
        public int Capacidad { get; set; }
        public string Barrio { get; set; }
        public string Calle { get; set; }
        public string Imagen { get; set; }
        public bool Activo { get; set; }
    }
}
//ID SMALLINT PRIMARY KEY IDENTITY(1,1),
//Nombre VARCHAR(100) NOT NULL,
//Alias VARCHAR(50),
//Capacidad VARCHAR(5) NOT NULL CHECK (Capacidad LIKE '%[0-9]%'),
//Barrio VARCHAR(50),
//Calle VARCHAR(150),
//Imagen VARCHAR(250),
//Activo BIT DEFAULT 1