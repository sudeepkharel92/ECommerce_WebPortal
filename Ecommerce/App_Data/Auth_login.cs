using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce_WebPortal.App_Data
{
    public class Auth_login
    {
        public static int GetUserid(string Username)
        {
            var sql = "select User_Id from [tbl_Users] where Login='" + Username + "'";
            var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);
            var userid = Convert.ToInt32(dt.Rows[0][0].ToString());
            return userid;
        }
    }
}