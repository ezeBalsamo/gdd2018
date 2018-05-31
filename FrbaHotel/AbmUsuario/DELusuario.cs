using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FrbaHotel.AbmUsuario
{
    public class DELusuario
    {

        public string username { get; set; }
        public string password { get; set; }
        public int cod_Rol { get; set; }
        public string nombre {get; set;}
        public string apellido {get; set;}
        public string tipoD {get; set;}
        public int numeroD {get; set;}
        public string mail {get; set;}
        public string telefono {get; set;}
        public string direccion {get; set;}
        public string fechaNac {get; set;}


        public DELusuario() { }
        public DELusuario(string pusername, string ppassword, int pcod_Rol, string pnombre, string papellido, string ptipoD, int pnumeroD, string pmail, string ptelefono, string pdireccion, string pfechaNac)
        {
            this.username = pusername;
            this.password = ppassword;
            this.cod_Rol = pcod_Rol;
            this.nombre = pnombre;
            this.apellido = papellido;
            this.tipoD = ptipoD;
            this.numeroD = pnumeroD;
            this.mail = pmail;
            this.telefono = ptelefono;
            this.direccion = pdireccion;
            this.fechaNac = pfechaNac;
            
        }
    }
}
