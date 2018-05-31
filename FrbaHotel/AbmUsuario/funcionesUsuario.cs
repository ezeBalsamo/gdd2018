using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace FrbaHotel.AbmUsuario
{
    public class funcionesUsuario
    {
        public static int agregarUsuario(DELusuario nuevo)
        {
            int retorno = 0;

            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("execute FOUR_STARS.IngresarUsuarios '{0}', '{1}', {2}, '{3}', '{4}', '{5}', {6}, '{7}', '{8}', '{9}', (select cast('{10}' as datetime)) ", nuevo.username, nuevo.password, nuevo.cod_Rol, nuevo.nombre, nuevo.apellido, nuevo.tipoD, nuevo.numeroD, nuevo.mail, nuevo.telefono, nuevo.direccion, nuevo.fechaNac), Con);
                retorno = Comando.ExecuteNonQuery();
                Con.Close();

            }
            return retorno;
            
        }

        public static int agregarUsuarioHotel(string username, int codHotel)
        {
            int retorno = 0;

            using (SqlConnection Con = BD.ObtenerConexion())
            {
                SqlCommand Comando = new SqlCommand(string.Format("insert into FOUR_STARS.Usuario_Por_Hotel (codHotel, username) values({0}, '{1}') ", codHotel, username), Con);
                retorno = Comando.ExecuteNonQuery();
                Con.Close();

            }
            return retorno;
        }

    }
}
