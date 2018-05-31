using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace FrbaHotel.AbmRol
{
    public class Funciones_Roles
    {
        public static int addRxF1(int rol, int funcion)
        {
            int regreso = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando1 = new SqlCommand(string.Format("execute FOUR_STARS.Insertar_Funcion_Por_Rol '{0}', '{1}'", rol, funcion), Con);
                regreso = Comando1.ExecuteNonQuery();
                Con.Close();
            }


            return regreso;
        }
    }
}
