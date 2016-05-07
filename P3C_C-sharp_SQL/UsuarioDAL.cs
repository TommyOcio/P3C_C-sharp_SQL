using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace P3C_C_sharp_SQL
{
    class UsuarioDAL
    {

        public static int CrearCuentas(string pUsuario, string pContraseña)
        {
            int resultado = 0;

            SqlConnection Conn = BDComun.ObtnerCOnexion();

            SqlCommand Comando = new SqlCommand(string.Format("Insert Into Usuarios (Nombre, Contraseña) values ('{0}', '{1}')", pUsuario, pContraseña), Conn);

            resultado = Comando.ExecuteNonQuery();
            Conn.Close();

            return resultado;
        }



        public static Usuario Autentificar(String pUsuarios, String pContraseña)
        {
            Usuario pUsuario = new Usuario();

            SqlConnection conexion = BDComun.ObtnerCOnexion();

            SqlCommand comando = new SqlCommand(string.Format(
                "Select * From Usuarios Where Nombre = '{0}' and Contraseña = '{1}'", pUsuarios, pContraseña), conexion);

            SqlDataReader reader = comando.ExecuteReader();

            while (reader.Read())
            {
                pUsuario.Id = reader.GetInt32(0);
                pUsuario.Nombre = reader.GetString(1);
                pUsuario.Contraseña = reader.GetString(2);
            }

            conexion.Close();
            return pUsuario;
        }


    }
}
