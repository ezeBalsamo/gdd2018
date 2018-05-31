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

        public static List<string> RolesActivos()
        {
            List<string> Lista = new List<string>();
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select rol_nombre from FOUR_STARS.Roles where estado = 1"), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    Lista.Add(reader.GetString(0));
                }
                Con.Close();
                return Lista;
            }

        }
        public static List<string> RolesInactivos()
        {
            List<string> Lista = new List<string>();
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select rol_nombre from FOUR_STARS.Roles where estado = 0"), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    Lista.Add(reader.GetString(0));
                }
                Con.Close();
                return Lista;
            }

        }

        public static List<string> listarFunciones(string nombre)
        {
            List<string> Lista = new List<string>();
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select f.funcion_nombre from FOUR_STARS.Rol_Por_Funcion r join FOUR_STARS.Funciones f on (r.cod_Funcion = f.cod_Funcion) where r.cod_Rol = (select FOUR_STARS.EncontrarID_Rol('{0}'))", nombre), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    Lista.Add(reader.GetString(0));
                }
                Con.Close();
                return Lista;
            }
        
        }
        public static int eliminarFuncion(string nombreFuncion, string rol)
        {
            int retorno = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("delete FOUR_STARS.Rol_Por_Funcion where cod_Funcion = (select FOUR_STARS.EncontrarID_Funcion('{0}')) and cod_Rol = (select FOUR_STARS.EncontrarID_Rol('{1}'))", nombreFuncion, rol), Con);
                retorno = Comando.ExecuteNonQuery();
                Con.Close();
            }
            return retorno;
        }
        public static int agregarFuncion(string nombreFuncion, string rol)
        {
            int retorno = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("insert into FOUR_STARS.Rol_Por_Funcion (cod_Rol, cod_Funcion) values ((select FOUR_STARS.EncontrarID_Rol('{0}')), (select FOUR_STARS.EncontrarID_Funcion('{1}')))", rol, nombreFuncion), Con);
                retorno = Comando.ExecuteNonQuery();
                Con.Close();
            }
            return retorno;
        }

        public static string conseguirRol(int codigo)
        {
            string nombre;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select rol_nombre from FOUR_STARS.Roles where cod_Rol = {0}", codigo), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                reader.Read();
                nombre = reader.GetString(0);
                Con.Close();
            }
            return nombre;
        }

        public static List<string> listaInversa(string nombre)
        {
            List<string> Lista = new List<string>();
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("select funcion_nombre from FOUR_STARS.Funciones EXCEPT select f.funcion_nombre from FOUR_STARS.Rol_Por_Funcion r join FOUR_STARS.Funciones f on (r.cod_Funcion = f.cod_Funcion) join FOUR_STARS.Roles r1 on (r1.cod_Rol = r.cod_Rol) where r1.rol_nombre = '{0}'", nombre), Con);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    Lista.Add(reader.GetString(0));
                }
                Con.Close();
                return Lista;
            }

        }
        public static int DesactivarRol(string rol)
        {
            int resultado = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("update FOUR_STARS.Roles set estado = 0 where rol_nombre = '{0}'", rol), Con);
                resultado = Comando.ExecuteNonQuery();
                Con.Close();
            }
            return resultado;
        }
        public static int ActivarRol(string rol)
        {
            int resultado = 0;
            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("update FOUR_STARS.Roles set estado = 1 where rol_nombre = '{0}'", rol), Con);
                resultado = Comando.ExecuteNonQuery();
                Con.Close();
            }
            return resultado;
        }

        public static int CambiarNombre(string nombreRol, string nuevoNombre)
        {
            int resultado = 0;
             using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("update FOUR_STARS.Roles set rol_nombre = '{0}' where rol_nombre = '{1}'", nuevoNombre, nombreRol), Con);
                resultado = Comando.ExecuteNonQuery();
                Con.Close();
            }
            return resultado;
        }
        
       
    
}
}
