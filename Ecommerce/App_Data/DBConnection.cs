using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace ECommerce_WebPortal.App_Data
{
    public class DBConnection
    {
        public static SqlConnection Connection()
        {
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(Convert.ToString(WebConfigurationManager.ConnectionStrings["Connectionstring"].ConnectionString));
                if (con.State == ConnectionState.Open)
                    con.Close();
                con.Open();
                return con;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message);
            }
            return con;
        }
    }
}