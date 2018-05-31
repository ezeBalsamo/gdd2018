using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace FrbaHotel
{
    public class BD
    {
        public static SqlConnection ObtenerConexion()
        {
            SqlConnection Con = new SqlConnection("Data source=(local)\\SQLSERVER2012; Initial Catalog=GD1C2018; User Id=sa; Password=gestiondedatos");
            Con.Open();
            return Con;
        }
    }
}
