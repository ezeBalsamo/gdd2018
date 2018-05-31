using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Login
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
                      
        //    string query = string.Format("Select FOUR_STARS.Login('{0}', '{1}')",
          //                                    usuario.Text,
            //                                  password.Text);

            //DataSet correcto = Operaciones.SelectQuery(query);
            //bool correctoValor = correcto.Tables[0].Rows[0][0].ToString();
            // if ( == true)
             //{

//                 Globals.usuario = usuario.Text;
  //               string query2 = string.Format("Select cod_Rol from FOUR_STARS.Usuario where username = '{0}'", Globals.usuario);
    //             DataSet BuscarRol = Operaciones.SelectQuery(query2);
      //           string RolNumero = BuscarRol.Tables[0].Rows[0][0].ToString();
        //         Globals.tipoRol = Int32.Parse(RolNumero);
          //       var newForm = new Principal();
            //     newForm.Show();
              //   this.Hide();
             //}
 //            else MessageBox.Show("Error");
                        
        }

        private void usuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
