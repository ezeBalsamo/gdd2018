using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FrbaHotel.AbmRol
{
    public class RolTipo
    {
        public int idRol {get; set;}
        public string nombreRol { get; set; }
        public string estado { get; set; }

        public RolTipo() { }
        public RolTipo(int pidRol, string pnombreRol, string pestado)
        {
            this.idRol = pidRol;
            this.nombreRol = pnombreRol;
            this.estado = pestado;
        }

    }
}
