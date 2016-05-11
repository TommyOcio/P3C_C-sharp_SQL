using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.Data.SqlClient;

namespace P3C_C_sharp_SQL
{
    public partial class Autentificacion : Form
    {
        private static string Key = "dofkrfaosrdedofkrfaosrdedofkrfao";//dofkrfaosrdedofkrfaosrdedofkrfao
        private static string IV = "zxcvbnmdfrasdfgh";//zxcvbnmdfrasdfgh

        Usuario pUsuario = new Usuario();

        public Autentificacion()
        {
            InitializeComponent();
        }

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            string mensaje1 = "", mensaje2 = "";
            if (string.IsNullOrEmpty(txtUsuario.Text))
                mensaje1 = "Debe ingresar el usuario";
            if (string.IsNullOrEmpty(txtContraseña.Text))
                mensaje2 = "Debe ingresar La contraseña";
            if(mensaje1 != "" || mensaje2 != "")
            {
                MessageBox.Show(mensaje1+"\n"+ mensaje2, "Error de datos",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return;
            }

            string Cotraseña = Encrypt(txtContraseña.Text);
            if (BDComun.ObtnerCOnexion().State != ConnectionState.Open)
            {
                MessageBox.Show("Error en la Conexion", "Error en la Conexion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            pUsuario = UsuarioDAL.Autentificar(txtUsuario.Text, Cotraseña);
            if(pUsuario.Nombre!=null)
            {
                this.Hide();
                Form1 pForm1 = new Form1();

                if (((pForm1 == null) || (!pForm1.IsHandleCreated)))
                {
                    pForm1 = new Form1();
                }

                pForm1.pUsuario.Id = pUsuario.Id;
                pForm1.pUsuario.Nombre = pUsuario.Nombre;
                pForm1.ShowDialog();

                pForm1.Dispose();
                this.Show();
            }else
            MessageBox.Show("El Usuario y la contraseña que has introducido no coinciden", "Error de Autenticación", MessageBoxButtons.OK, MessageBoxIcon.Question);
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtContraseña_KeyPress(object sender, KeyPressEventArgs e)
        {
            //if (e.KeyChar == Convert.ToChar(Keys.Enter))
            //{
            //    string Cotraseña = Encrypt(txtContraseña.Text);
            //    pUsuario = UsuarioDAL.Autentificar(txtUsuario.Text, Cotraseña);
            //    if (pUsuario.Id > 0)
            //    {
            //        //this.Hide();
            //        Form1 f = new Form1();
            //        f.pUsuario.Id = pUsuario.Id;
            //        f.pUsuario.Nombre = pUsuario.Nombre;
            //        f.ShowDialog();
            //        MessageBox.Show("sape");
            //    }
            //    else
            //        MessageBox.Show("Error en los datos");

            //}
        }
        private static string Encrypt(string text)
        {
            byte[] plaintextbytes = System.Text.ASCIIEncoding.ASCII.GetBytes(text);
            AesCryptoServiceProvider aes = new AesCryptoServiceProvider();
            aes.BlockSize = 128;
            aes.KeySize = 256;
            aes.Key = System.Text.ASCIIEncoding.ASCII.GetBytes(Key);
            aes.IV = System.Text.ASCIIEncoding.ASCII.GetBytes(IV);
            aes.Padding = PaddingMode.PKCS7;
            aes.Mode = CipherMode.CBC;
            ICryptoTransform crypto = aes.CreateEncryptor(aes.Key, aes.IV);
            byte[] encrypted = crypto.TransformFinalBlock(plaintextbytes, 0, plaintextbytes.Length);
            crypto.Dispose();
            return Convert.ToBase64String(encrypted);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string rpta = "";
            //string CN = "Server = mcastro/SQLEXPRESS; Database = Fotografia; Trusted_Connection = True";
            string CN = "Data source=SOPORTETIi; Initial Catalog=sape; User Id=sa; Password=upt";
            SqlConnection sqlcon = new SqlConnection();

            try
            {
                sqlcon.ConnectionString = CN;
                sqlcon.Open();
            }

            catch (Exception ex)
            {
                rpta = ex.Message;
            }

            if (sqlcon.State == ConnectionState.Open)
                MessageBox.Show("ok");
            else
                MessageBox.Show("no se conecto");

            
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Autentificacion_Load(object sender, EventArgs e)
        {
            DateTime thisDay = DateTime.Today;

            label4.Text = thisDay.ToString("D");
        }
    }
}
