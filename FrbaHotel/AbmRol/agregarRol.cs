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
    public partial class agregarRol : Form
    {
        public agregarRol()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string nombreRol = textNombre.Text;
            List<int> funciones = new List<int>();
            if (checkBox1.Checked)
            {
                funciones.Add(1);
            }

            if (checkBox2.Checked)
            {
                funciones.Add(2);
            }
            if (checkBox3.Checked)
            {
                funciones.Add(3);
            }
            if (checkBox4.Checked)
            {
                funciones.Add(4);
            }
            if (checkBox5.Checked)
            {
                funciones.Add(5);
            }
            if (checkBox6.Checked)
            {
                funciones.Add(6);
            }
            if (checkBox7.Checked)
            {
                funciones.Add(7);
            }
            if (checkBox8.Checked)
            {
                funciones.Add(8);
            }
            if (checkBox9.Checked)
            {
                funciones.Add(9);
            }
            if (checkBox10.Checked)
            {
                funciones.Add(10);
            }
            if (checkBox11.Checked)
            {
                funciones.Add(11);
            }
            if (checkBox12.Checked)
            {
                funciones.Add(12);
            }
            if (checkBox13.Checked)
            {
                funciones.Add(13);
            }
            funciones.Add(0);
            int resultado = funcionesRol.addR(nombreRol);
            int resultado1 = funcionesRol.addRxF(nombreRol, funciones);
          

           
        }
       
    }
}
