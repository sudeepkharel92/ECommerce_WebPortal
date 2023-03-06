using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce_WebPortal
{
    public partial class Checkout_Products : System.Web.UI.Page
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
            var sql = "select Cart_Id,P.Designation items,P.Product_Id,CONVERT(varchar,C.AddedDate,103) [OrderDate],C.Quantity,P.Price from tbl_Cart C with(NOLOCK)";
            sql += "inner join tbl_Products P WITH(NOLOCK) ON P.Product_Id = C.Product_Id where C.Status=0 and C.User_Id = '" + User_Id + "'";
            var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);
            GvChkProduct.DataSource = dt;
            GvChkProduct.DataBind();
        }

        protected void BtnBuy_Click(object sender, EventArgs e)
        {
            int User_Id = ECommerce_WebPortal.App_Data.Auth_login.GetUserid(Session["Pseudo"].ToString());
            foreach (GridViewRow row in GvChkProduct.Rows)
            {
                var lblProductId = (Label)row.FindControl("lblProductId");
                var lblQuantity = (Label)row.FindControl("lblQuantity");

                var sql = "INSERT INTO tbl_Orders(OrderDate,User_Id,Product_Id,ProductQuantity,OrderedAddress) values(GETDATE(),'" + User_Id + "','" + lblProductId.Text + "','" + lblQuantity.Text + "','" + txtAddress.Text + "')";
                var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);

                var sql1 = "update tbl_Cart set Status=1 where User_Id='" + User_Id + "'";
                var dt1 = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql1);

                lblQuantity.Text = "";
                lblProductId.Text = "";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "successalert('Order Successfully')", true);
            FillGv();
        }
    }
}