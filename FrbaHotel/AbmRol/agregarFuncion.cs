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
    public partial class agregarFuncion : Form
    {
        public string nombreRol;
        public List<string> funcionesDisponibles;
        public List<string> funcionesActivas;
        
        
        public void ActualizarListas()
        {
            comboBox1.Items.Clear();
            comboBox2.Items.Clear();
            List<string> funcionesDisponibles = funcionesRol.listarFunciones(nombreRol);
            List<string> funcionesActivas = funcionesRol.listaInversa(nombreRol);
            foreach (string funcion1 in funcionesDisponibles)
            {
                comboBox1.Items.Add(funcion1);
            }
            foreach (string funcion2 in funcionesActivas)
            {
                comboBox2.Items.Add(funcion2);
            }
            textBox1.Text = nombreRol;
        }

        public agregarFuncion()
        {
            InitializeComponent();
            
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex > -1)
            {
                string nuevaFuncion = comboBox1.SelectedItem.ToString();
                int retorno = funcionesRol.eliminarFuncion(nuevaFuncion, nombreRol);
                if (retorno > 0)
                {
                    MessageBox.Show("Exito al eliminar funcion");
                    ActualizarListas();
                }

            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(textBox1.Text))
            {
                string nuevoNombre = textBox1.Text;
                int retorno = funcionesRol.CambiarNombre(nombreRol, nuevoNombre);
                if (retorno > 0)
                {
                    MessageBox.Show("Exito al Cambiar nombre");
                    nombreRol = nuevoNombre;
                    ActualizarListas();
                }
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (comboBox2.SelectedIndex > -1)
            {
                string nuevaFuncion = comboBox2.SelectedItem.ToString();
                int retorno = funcionesRol.agregarFuncion(nuevaFuncion, nombreRol);
                if (retorno > 0)
                {
                    MessageBox.Show("Exito al insertar funcion");
                    ActualizarListas();
                }

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
            this.Hide();
        }
    }
}
