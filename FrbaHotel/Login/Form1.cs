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
        int intentosFallidos { get; set; }
        
        public Login()
        {
            InitializeComponent();
            intentosFallidos = 0;
        }
        public void fallar()
        {
            intentosFallidos++;
        }
        public void restaurar()
        {
            intentosFallidos = 0;
        }
               
        


    

        private void button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(usuario.Text))
            {
                if (!string.IsNullOrWhiteSpace(password.Text))
                {
                    int registro = funcionesLogin.logearse(usuario.Text, password.Text);
                    if (registro == 0)
                    {
                        fallar();

                        MessageBox.Show("Login incorrecto");
                        if (intentosFallidos > 2)
                        {
                            MessageBox.Show("Intentos Agotados, no podra acceder");
                            Globals.tipoRol = 0;
                            this.Hide();
                        }

                    }
                    else
                    {
                        restaurar();
                        Globals.tipoRol = funcionesLogin.obtenerRol(usuario.Text);
                        var photelesUsuario = new hotelesUsuario();
                        photelesUsuario.usuario = usuario.Text;
                        photelesUsuario.inicializarTabla();
                        photelesUsuario.Show();
                        this.Hide();
                    }
                }
            }

                        
        }

        private void usuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
