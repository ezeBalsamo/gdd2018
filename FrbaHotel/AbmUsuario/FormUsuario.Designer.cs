namespace FrbaHotel.AbmUsuario
{
    partial class FormUsuario
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.usernameT = new System.Windows.Forms.TextBox();
            this.passwordT = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.nombreT = new System.Windows.Forms.TextBox();
            this.apellidoT = new System.Windows.Forms.TextBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.numeroDT = new System.Windows.Forms.TextBox();
            this.tipoDT = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.direccionT = new System.Windows.Forms.TextBox();
            this.telefonoT = new System.Windows.Forms.TextBox();
            this.mailT = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.masked = new System.Windows.Forms.MaskedTextBox();
            this.codhotelT = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Username";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.codhotelT);
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Controls.Add(this.passwordT);
            this.groupBox1.Controls.Add(this.usernameT);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(34, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(431, 100);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(193, 29);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(23, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Rol";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(7, 60);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(53, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Password";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(193, 63);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "Codigo Hotel";
            // 
            // usernameT
            // 
            this.usernameT.Location = new System.Drawing.Point(75, 29);
            this.usernameT.Name = "usernameT";
            this.usernameT.Size = new System.Drawing.Size(100, 20);
            this.usernameT.TabIndex = 4;
            // 
            // passwordT
            // 
            this.passwordT.Location = new System.Drawing.Point(75, 60);
            this.passwordT.Name = "passwordT";
            this.passwordT.Size = new System.Drawing.Size(100, 20);
            this.passwordT.TabIndex = 6;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.apellidoT);
            this.groupBox2.Controls.Add(this.nombreT);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Location = new System.Drawing.Point(34, 146);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(431, 81);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Nombres";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 37);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(44, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "Nombre";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(193, 37);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 13);
            this.label6.TabIndex = 1;
            this.label6.Text = "Apellido";
            // 
            // nombreT
            // 
            this.nombreT.Location = new System.Drawing.Point(75, 37);
            this.nombreT.Name = "nombreT";
            this.nombreT.Size = new System.Drawing.Size(100, 20);
            this.nombreT.TabIndex = 2;
            // 
            // apellidoT
            // 
            this.apellidoT.Location = new System.Drawing.Point(276, 37);
            this.apellidoT.Name = "apellidoT";
            this.apellidoT.Size = new System.Drawing.Size(121, 20);
            this.apellidoT.TabIndex = 3;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.numeroDT);
            this.groupBox3.Controls.Add(this.tipoDT);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.label8);
            this.groupBox3.Location = new System.Drawing.Point(34, 256);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(431, 81);
            this.groupBox3.TabIndex = 3;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Documento";
            // 
            // numeroDT
            // 
            this.numeroDT.Location = new System.Drawing.Point(276, 34);
            this.numeroDT.Name = "numeroDT";
            this.numeroDT.Size = new System.Drawing.Size(121, 20);
            this.numeroDT.TabIndex = 3;
            // 
            // tipoDT
            // 
            this.tipoDT.Location = new System.Drawing.Point(75, 37);
            this.tipoDT.Name = "tipoDT";
            this.tipoDT.Size = new System.Drawing.Size(100, 20);
            this.tipoDT.TabIndex = 2;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(193, 37);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(44, 13);
            this.label7.TabIndex = 1;
            this.label7.Text = "Número";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(7, 37);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(28, 13);
            this.label8.TabIndex = 0;
            this.label8.Text = "Tipo";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.masked);
            this.groupBox4.Controls.Add(this.direccionT);
            this.groupBox4.Controls.Add(this.telefonoT);
            this.groupBox4.Controls.Add(this.mailT);
            this.groupBox4.Controls.Add(this.label9);
            this.groupBox4.Controls.Add(this.label10);
            this.groupBox4.Controls.Add(this.label11);
            this.groupBox4.Controls.Add(this.label12);
            this.groupBox4.Location = new System.Drawing.Point(34, 372);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(431, 100);
            this.groupBox4.TabIndex = 4;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Otros Datos";
            // 
            // direccionT
            // 
            this.direccionT.Location = new System.Drawing.Point(75, 60);
            this.direccionT.Name = "direccionT";
            this.direccionT.Size = new System.Drawing.Size(100, 20);
            this.direccionT.TabIndex = 6;
            // 
            // telefonoT
            // 
            this.telefonoT.Location = new System.Drawing.Point(307, 29);
            this.telefonoT.Name = "telefonoT";
            this.telefonoT.Size = new System.Drawing.Size(100, 20);
            this.telefonoT.TabIndex = 5;
            // 
            // mailT
            // 
            this.mailT.Location = new System.Drawing.Point(75, 29);
            this.mailT.Name = "mailT";
            this.mailT.Size = new System.Drawing.Size(100, 20);
            this.mailT.TabIndex = 4;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(193, 59);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(108, 13);
            this.label9.TabIndex = 3;
            this.label9.Text = "Fecha de Nacimiento";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(7, 60);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(52, 13);
            this.label10.TabIndex = 2;
            this.label10.Text = "Direccion";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(193, 29);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(49, 13);
            this.label11.TabIndex = 1;
            this.label11.Text = "Telefono";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(6, 29);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(26, 13);
            this.label12.TabIndex = 0;
            this.label12.Text = "Mail";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(276, 26);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 8;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(109, 478);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(90, 27);
            this.button1.TabIndex = 5;
            this.button1.Text = "Guardar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // masked
            // 
            this.masked.Location = new System.Drawing.Point(307, 60);
            this.masked.Mask = "00/00/0000";
            this.masked.Name = "masked";
            this.masked.Size = new System.Drawing.Size(100, 20);
            this.masked.TabIndex = 7;
            this.masked.ValidatingType = typeof(System.DateTime);
            // 
            // codhotelT
            // 
            this.codhotelT.Enabled = false;
            this.codhotelT.Location = new System.Drawing.Point(276, 60);
            this.codhotelT.Name = "codhotelT";
            this.codhotelT.Size = new System.Drawing.Size(121, 20);
            this.codhotelT.TabIndex = 6;
            // 
            // FormUsuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(539, 538);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormUsuario";
            this.Text = "Abm Usuario";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.TextBox passwordT;
        private System.Windows.Forms.TextBox usernameT;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox apellidoT;
        private System.Windows.Forms.TextBox nombreT;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox numeroDT;
        private System.Windows.Forms.TextBox tipoDT;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox direccionT;
        private System.Windows.Forms.TextBox telefonoT;
        private System.Windows.Forms.TextBox mailT;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.MaskedTextBox masked;
        private System.Windows.Forms.TextBox codhotelT;
    }
}