using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FrbaHotel.AmbHotel
{
    
    public class Hotel
    {
        public int codHotel { get; set; }
        public string nombre { get; set; }
        public string ciudad { get; set; }
        public string direccion { get; set; }

        public Hotel() { }
        public Hotel(int pcodHotel, string pnombre, string pciudad, string pdireccion)
        {
            this.codHotel = pcodHotel;
            this.nombre = pnombre;
            this.ciudad = pciudad;
            this.direccion = pdireccion;
        }

    }
}
