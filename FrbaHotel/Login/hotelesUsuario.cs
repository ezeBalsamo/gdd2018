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
    public partial class hotelesUsuario : Form
    {

        public List<AmbHotel.Hotel> hoteles;
        public string usuario { get; set; }

        public void inicializarTabla() 
        { 
            hoteles = funcionesLogin.BuscarHoteles(usuario);
            dataGridView1.DataSource = hoteles;
        }
        
        public hotelesUsuario()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 1)
            {
                int codigo = Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value);
                Globals.usuario = usuario;
                Globals.codHotel = codigo;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var plogin = new Login();
            plogin.Show();
            this.Hide();
        }
    }
}
