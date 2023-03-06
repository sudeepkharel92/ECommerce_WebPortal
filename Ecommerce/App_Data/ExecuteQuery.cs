using ECommerce_WebPortal.App_Data;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ECommerce_WebPortal.App_Data
{
    public class ExecuteQuery
    {
        public static DataTable Execute(string query, bool forReport = false)
        {
            try
            {
                var dt = new DataTable();
                var cmd = new SqlCommand(query, DBConnection.Connection()) { CommandType = CommandType.Text };
                cmd.CommandTimeout = 0;
                IDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
                cmd.Dispose();
                return dt;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message);
            }
            finally
            {
                DBConnection.Connection().Close();
            }
        }
        public static DataSet Execute_Query(string query)
        {
            var cmd = new SqlCommand();
            var ds = new DataSet();
            try
            {
                cmd.CommandText = query;
                cmd.Connection = DBConnection.Connection();
                var da = new SqlDataAdapter(cmd.CommandText, cmd.Connection);
                cmd.CommandTimeout = 0;
                da.SelectCommand = cmd;
                da.Fill(ds);
                cmd.Dispose();
                da.Dispose();
                return ds;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message);
            }
            finally
            {
                DBConnection.Connection().Close();
            }
        }
    }
}