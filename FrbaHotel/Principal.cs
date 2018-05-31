using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel
{
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var pRoles = new AbmRol.Roles();
            pRoles.Show();
            pRoles.ActualizarListas();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (Globals.tipoRol != 0)
            {
                var newForm = new Login.Login();
                newForm.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Acceso restringido");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var pUsuario = new AbmUsuario.FormUsuario();
            pUsuario.Show();
            pUsuario.Actualizar();


        }

        
    }
}
