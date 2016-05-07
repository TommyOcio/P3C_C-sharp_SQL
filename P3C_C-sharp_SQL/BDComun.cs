using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace P3C_C_sharp_SQL
{
    class BDComun
    {
        public static SqlConnection ObtnerCOnexion()
        {
            SqlConnection Conn = new SqlConnection("Data source=SOPORTETI; Initial Catalog=sape; User Id=sa; Password=upt");
            Conn.Open();

            return Conn;

        }

    }
}
