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
using System.Security.Principal;
using System.Net;

namespace P3C_C_sharp_SQL
{
    public partial class Autentificacion : Form
    {
        private static string Key = "dofkrfaosrdedofkrfaosrdedofkrfao";
        private static string IV = "zxcvbnmdfrasdfgh";

        Usuario pUsuario = new Usuario();

        string direccionIp = "";
        string UsuarioPc = "";

        public Autentificacion()
        {
            InitializeComponent();


    //        string strHostName = string.Empty;
    //        // Getting Ip address of local machine…
    //        // First get the host name of local machine.
    //        strHostName = Dns.GetHostName();
    //        // Then using host name, get the IP address list..
    //        IPAddress[] hostIPs = Dns.GetHostAddresses(strHostName);
    //        for (int i = 0; i < hostIPs.Length; i++)
    //        {
    //            label1.Text = “Direccion IP: ” +hostIPs[i].ToString();
    //        }
    //        label2.Text = “Nombre de la computadora: ” +strHostName;
  


    //WindowsIdentity currentUser = WindowsIdentity.GetCurrent();
            UsuarioPc = Dns.GetHostName();

            IPAddress[] direcciones = Dns.GetHostAddresses(Dns.GetHostName());

            foreach (IPAddress ip in direcciones)
            {
                if (ip.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                    direccionIp = ip.ToString();
            }
        }

        public void Autenticar()
        {
            string mensaje1 = "", mensaje2 = "";
            if (string.IsNullOrEmpty(txtUsuario.Text))
                mensaje1 = "Debe ingresar el Usuario";
            if (string.IsNullOrEmpty(txtContraseña.Text))
                mensaje2 = "Debe ingresar la Contraseña";
            if (mensaje1 != "" || mensaje2 != "")
            {
                MessageBox.Show(mensaje1 + "\n" + mensaje2, "Error de datos", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            string Cotraseña = Encrypt(txtContraseña.Text);
            if (BDComun.ObtnerCOnexion().State != ConnectionState.Open)
            {
                MessageBox.Show("Error en la Conexion", "Error en la Conexion", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            pUsuario = UsuarioDAL.Autentificar(txtUsuario.Text, Cotraseña);
            if (pUsuario.Nombre != null)
            {
                this.Hide();
                
                UsuarioDAL.ControlAcceso(txtUsuario.Text, direccionIp, UsuarioPc, "Conectado");
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
            }
            else
            {
                MessageBox.Show("El Usuario y la contraseña que has introducido no coinciden", "Error de Autenticación", MessageBoxButtons.OK, MessageBoxIcon.Question);
                UsuarioDAL.ControlAcceso(txtUsuario.Text, direccionIp, UsuarioPc, "Error de acceso");
            }
                
            LimpiarControles();
        }

        private void LimpiarControles()
        {
            foreach (Control c in this.Controls)
            {
                if (c is TextBox)
                {
                    c.Text = "";
                    //Enfoco en el primer TextBox
                    this.txtUsuario.Focus();
                }
            }
            DateTime thisDay = DateTime.Today;
            label4.Text = thisDay.ToString("D");
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

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            Autenticar();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            //this.Close();

            IPAddress[] direcciones = Dns.GetHostAddresses(Dns.GetHostName());

            foreach (IPAddress ip in direcciones)
            {

                string input = ip.ToString();

                IPAddress address;
                if (IPAddress.TryParse(input, out address))
                {
                    switch (address.AddressFamily)
                    {
                        case System.Net.Sockets.AddressFamily.InterNetwork:
                            MessageBox.Show(ip.ToString());
                            break;
                        case System.Net.Sockets.AddressFamily.InterNetworkV6:
                            // we have IPv6
                            break;
                        default:
                            // umm... yeah... I'm going to need to take your red packet and...
                            break;
                    }
                }
            }
        }

        private void txtContraseña_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
            {
                Autenticar();
            }
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Autentificacion_Load(object sender, EventArgs e)
        {
            LimpiarControles();
            
        }
    }
}
