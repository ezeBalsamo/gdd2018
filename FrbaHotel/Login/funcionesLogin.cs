using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace FrbaHotel.Login
{
    class funcionesLogin
    {
        public static int logearse(string nombre, string pass)
        {
            int retorno = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("Select FOUR_STARS.Login('{0]', '{1}')", nombre, pass), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                reader.Read();
                bool resultado = reader.GetBoolean(0);
                Con.Close();
                if (resultado == true)
                {
                    retorno = 1;
                }

            }
            return retorno;
        }
        public static int obtenerRol(string usuario)
        {
            int rol;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select cod_Rol from FOUR_STARS.Usuario where username = '{0}'", usuario), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                reader.Read();
                rol = reader.GetInt32(0);
                Con.Close();
            }
            return rol;

        }

        public static List<AmbHotel.Hotel> BuscarHoteles(string usuario)
        {
            List<AmbHotel.Hotel> Lista = new List<AmbHotel.Hotel>();
             using (SqlConnection Con = BD.ObtenerConexion())
             {
                  SqlCommand Comando = new SqlCommand(string.Format("select h.codHotel, h.nombre, h.ciudad, h.direccion FROM FOUR_STARS.Usuario_Por_Hotel u join FOUR_STARS.Hotel h on (u.codHotel = h.codHotel) where u.username = '{0}' ", usuario), Con);
                  SqlDataReader reader = Comando.ExecuteReader();
                while(reader.Read())
                {
                    AmbHotel.Hotel photel = new AmbHotel.Hotel();
                    photel.codHotel = reader.GetInt32(0);
                    photel.nombre = reader.GetString(1);
                    photel.ciudad = reader.GetString(2);
                    photel.direccion = reader.GetString(3);
                    Lista.Add(photel);
                }


                 Con.Close();
             }
            return Lista;
         
        }


    }
}
