﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio2
{
    public class Album
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public List<Figurita> Figuritas { get; set; }
    }
}
