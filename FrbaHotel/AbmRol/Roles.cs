using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.AbmRol
{
    public partial class Roles : Form
    {

        public List<string> rolesActivos;
        public List<string> rolesInactivos;
        public void ActualizarListas()
        {
            comboBox1.Items.Clear();
            comboBox2.Items.Clear();
            
            List<string> rolesActivos = funcionesRol.RolesActivos();
            List<string> rolesInactivos = funcionesRol.RolesInactivos();
            foreach (string rol in rolesActivos)
            {
                comboBox1.Items.Add(rol);
            }
            foreach (string rol in rolesInactivos)
            {
                comboBox2.Items.Add(rol);
            }

        }
        public Roles()
        {
            InitializeComponent();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(textBox1.Text))
            {
            string nombreRol = textBox1.Text;
            int resultado = funcionesRol.addR(nombreRol);

            if (resultado > 0)
            {
                ActualizarListas();
                MessageBox.Show("Rol agregado con exito");
            }
             
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex > -1)
            {
                string rolSellecionado = comboBox1.SelectedItem.ToString();
                int resultado = funcionesRol.DesactivarRol(rolSellecionado);
                if (resultado > 0)
                {
                    MessageBox.Show("Rol eliminado");
                    ActualizarListas();
                }
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (comboBox2.SelectedIndex > -1)
            {
                string rolSellecionado = comboBox2.SelectedItem.ToString();
                int resultado = funcionesRol.ActivarRol(rolSellecionado);
                if (resultado > 0)
                {
                    MessageBox.Show("Rol Restaurado");
                    ActualizarListas();
                }
            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex > -1)
            {
                string rolSellecionado = comboBox1.SelectedItem.ToString();
                var pagregarFunciones = new agregarFuncion();
                pagregarFunciones.Show();
                pagregarFunciones.nombreRol = rolSellecionado;
                pagregarFunciones.ActualizarListas();
                this.Hide();
               
            }
        }

     

       
    }
}
