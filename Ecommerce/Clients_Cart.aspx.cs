using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce_WebPortal
{
    public partial class Clients_Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Pseudo"] == null)
            {
                Response.Redirect("SingIn.aspx?Erreur=1");
            }
            if(!IsPostBack)
            {
                FillGv();
            }
        }

        private void FillGv()
        {
            int User_Id = ECommerce_WebPortal.App_Data.Auth_login.GetUserid(Session["Pseudo"].ToString());
            var sql = "select Cart_Id,P.Designation items,CONVERT(varchar,C.AddedDate,103) [OrderDate],C.Quantity,P.Price from tbl_Cart C with(NOLOCK)";
            sql += "inner join tbl_Products P WITH(NOLOCK) ON P.Product_Id = C.Product_Id where C.Status=0 and C.User_Id = '" + User_Id + "'";
            var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);
            GvCart.DataSource = dt;
            GvCart.DataBind();
            if(!(dt.Rows.Count > 0))
            {
                btnDelete.Visible = false;
                Btncheckout.Visible = false;
                LblMsg.Text = "No Items added in Cart";
                LblMsg.ForeColor = System.Drawing.Color.Green;
                //LblMsg.Focus();
            }
        }

        protected void Btncheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout_Products.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow row in GvCart.Rows)
            {
                var lblOrderId = (Label)row.FindControl("lblOrderId");
                int id = Convert.ToInt32(lblOrderId.Text);
                var sql = "delete from tbl_cart where Cart_Id='" + id + "'";
                var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);
            }
            FillGv();
        }
    }
}