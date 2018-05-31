using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmUsuario
{
    public partial class FormUsuario : Form
    {
        public List<string> roles;
        public void Actualizar()
        {
            comboBox1.Items.Clear();
            codhotelT.Text = Globals.codHotel.ToString();
            roles = AbmRol.funcionesRol.RolesActivos();
            foreach (string rol in roles)
            {
                comboBox1.Items.Add(rol);
            }
        }
        
        
        public FormUsuario()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DELusuario nuevo = new DELusuario();
            nuevo.username = usernameT.Text;
            nuevo.password = passwordT.Text;
            nuevo.cod_Rol = AbmRol.funcionesRol.BuscarCodigo(comboBox1.SelectedItem.ToString());
            nuevo.nombre = nombreT.Text;
            nuevo.apellido = apellidoT.Text;
            nuevo.tipoD = tipoDT.Text;
            nuevo.numeroD = Convert.ToInt32(numeroDT.Text);
            nuevo.mail = mailT.Text;
            nuevo.telefono = telefonoT.Text;
            nuevo.direccion = direccionT.Text;
            nuevo.fechaNac = masked.Text;
            int exito = funcionesUsuario.agregarUsuario(nuevo);
            if (exito > 0)
            {
                int x = funcionesUsuario.agregarUsuarioHotel(nuevo.username, Globals.codHotel);
                MessageBox.Show("Guardado con Exito");
            }
        }

        private void label13_Click(object sender, EventArgs e)
        {

        }
    }
}
