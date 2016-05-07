using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;


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
            string Cotraseña = Encrypt(txtContraseña.Text);
            pUsuario = UsuarioDAL.Autentificar(txtUsuario.Text, Cotraseña);
            if (pUsuario.Id > 0)
            {
                this.Hide();
                Form1 f = new Form1();
                //f.pUsuario.Id = pUsuario.Id;
                //f.pUsuario.Nombre = pUsuario.Nombre;
                //f.ShowDialog();


                if (((f == null) || (!f.IsHandleCreated)))
                {
                    f = new Form1();
                }

                // Llamamos al formulario de manera modal.
                //
                f.pUsuario.Id = pUsuario.Id;
                f.pUsuario.Nombre = pUsuario.Nombre;
                f.ShowDialog();

                //MessageBox.Show("Se ha cerrado el formulario.");

                // Destruimos el formulario.
                //
                f.Dispose();
                this.Show();
            }
            else
                MessageBox.Show("Error en los datos");
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




    }
}
