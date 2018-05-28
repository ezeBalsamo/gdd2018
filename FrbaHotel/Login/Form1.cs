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
            string query = string.Format("Select FOUR_STARS.Login ('{0}','{1}')",
                                              usuario.Text,
                                              password.Text);
                                              
             int status = Operaciones.InsertQuery(query);
             if (status == 1)
             {

                 Globals.usuario = usuario.Text;
                 string query2 = string.Format("Select cod_Rol from FOUR_STARS.Usuario where username = '{0}'", Globals.usuario);
                 Globals.tipoRol = Operaciones.InsertQuery(query2);
                 var newForm = new Principal();
                 newForm.Show();
                 this.Hide();
             }
             else this.Hide();
                        
        }
    }
}
