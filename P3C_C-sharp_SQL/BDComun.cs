using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace P3C_C_sharp_SQL
{
    class BDComun
    {
        public static SqlConnection ObtnerCOnexion()
        {

            SqlConnection Conn = new SqlConnection("Data source=SOPORTETI; Initial Catalog=sape; User Id=sa; Password=upt");

            try
            {
                Conn.Open();
            }
            catch (Exception ex)
            {
                Conn.Close();
            }

            return Conn;
        }

        public static void CerrarConexion(SqlConnection conexion)
        {
            conexion.Close();
        }

    }
}
