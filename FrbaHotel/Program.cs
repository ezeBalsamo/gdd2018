using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace FrbaHotel
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Inicio());
        }
    }
    public static class Globals
    {
        public static int tipoRol = 0;
        public static string usuario = " ";
    }

    public class Operaciones
    {
        public static SqlConnection Con = new SqlConnection("Data Source=(local)\\SQLSERVER2012;Initial Catalog=GD1C2018;User ID=gdHotel2018;Password=gd2018");
                                                                        
        public static DataSet SelectQuery(string cmd)
        {

            Con.Open();

            DataSet DS = new DataSet();
            SqlDataAdapter DP = new SqlDataAdapter(cmd,Con);
            DP.Fill(DS);

            Con.Close();

            return DS;
        }

        public static int InsertQuery(string query)
        {
            Con.Open();
            SqlCommand command = new SqlCommand(query, Con);
            int resultado = command.ExecuteNonQuery();
            Con.Close();
            return resultado;
        }
}
}