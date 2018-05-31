﻿using System;
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
    public partial class Inicio : Form
    {
        public Inicio()
        {
            InitializeComponent();
            Globals.tipoRol = 3;
        }

        private void button1_Click(object sender, EventArgs e)
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

        private void button2_Click(object sender, EventArgs e)
        {
            var newForm = new Principal();
            Globals.tipoRol = 3;
            newForm.Show();
            
            this.Hide();
        }
    }
}
