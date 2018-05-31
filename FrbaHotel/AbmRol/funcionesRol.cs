using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace FrbaHotel.AbmRol
{
    public class funcionesRol
    {
        public static int addR(string nombreRol)
        {
            int retorno = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("execute FOUR_STARS.Insertar_Roles '{0}'", nombreRol), Con);
                retorno = Comando.ExecuteNonQuery();
                Con.Close();
            }
            return retorno;
        }
        public static int addRxF(string nombreRol, List<int> funciones) 
        {
            int retorno1 = 0;
            int rolId = 0;
            int funcionId = 0;
            int lista = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select FOUR_STARS.EncontrarID_Rol('{0}')", nombreRol), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                reader.Read();
                rolId = reader.GetInt32(0);
                Con.Close();
                
            
            while (funciones[lista] != 0)
            {   
                
                funcionId = funciones[lista];
                retorno1 = Funciones_Roles.addRxF1(rolId, funcionId);
                lista++;            
            }
                
            }
            return retorno1;
    }
    
}
}
