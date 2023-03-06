using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class Site_Clients : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActiveUsers.Text = "ONLINE USERS " + Application["ActiveUsers"].ToString();

            }
        }
        protected void BtnDeconnection_Click(object sender, EventArgs e)
        {
            //Application.Lock();
            //Application["ActiveUsers"] = (int)Application["ActiveUsers"] - 1;
            //Application.UnLock();

            Session.Clear();
            Response.Redirect("SingIn.aspx?Logout=1");
        }
    }
}