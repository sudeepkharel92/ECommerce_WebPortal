using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class Clients_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Pseudo"] == null)
            {
                Response.Redirect("SingIn.aspx?Erreur=1");
            }

            if (!IsPostBack)
            {
                ListView1.DataSource = ProductListeDataSource;
                ListView1.DataBind();

            }
        }
        //public double PrixTTC;
        protected void BtnBuy_Click(object sender, EventArgs e)
        {
            //Button myButton = (Button)sender;
            //HiddenField myHiddenField = (HiddenField)myButton.NamingContainer.FindControl("HiddenField1");
            //DropDownList TxtQty = (DropDownList)myButton.NamingContainer.FindControl("TxtQty");
            ////Label LblPu = (Label)myButton.NamingContainer.FindControl("LblPu");
            //string Product_Id = myHiddenField.Value;
            //string User_Id = null;

            //DataView dv = (DataView)ClientsDataSource.Select(DataSourceSelectArguments.Empty);
            //for (int i = 0; i < dv.Table.Rows.Count; i++)
            //{
            //    string Pseudo = dv.Table.Rows[i]["Login"].ToString();
            //    if (Session["Pseudo"].ToString() == Pseudo)
            //    {
            //        User_Id = dv.Table.Rows[i]["User_Id"].ToString();
            //        //TotalPrice = Convert.ToDouble(LblPu.Text) * Convert.ToDouble(TxtQty.Text);
            //        break;
            //    }
            //}

            //OrderDataSource.InsertParameters["User_Id"].DefaultValue = User_Id;
            //OrderDataSource.InsertParameters["OrderDate"].DefaultValue = DateTime.Now.ToString();
            //OrderDataSource.InsertParameters["Product_Id"].DefaultValue = Product_Id;
            //OrderDataSource.InsertParameters["ProductQuantity"].DefaultValue = TxtQty.SelectedValue;
            //OrderDataSource.Insert();
            Response.Redirect("Checkout_Products.aspx");
            //LblMsg.Text = "Thank you for shopping at our store. Your order is confirmed.";
            //LblMsg.ForeColor = System.Drawing.Color.Green;
            //LblMsg.Focus();
        }

        protected void btnFeedBack_Click(object sender, EventArgs e)
        {
            FeedbackDataSource.InsertParameters["Name"].DefaultValue = inpName.Value;
            FeedbackDataSource.InsertParameters["Message"].DefaultValue = txtareaComments.Value;
            FeedbackDataSource.InsertParameters["Email"].DefaultValue = inpEmail.Value;
            FeedbackDataSource.Insert();
            clear();
        }

        public void clear()
        {
            inpName.Value = "";
            txtareaComments.Value = "";
            inpEmail.Value = "";
        }

        //protected void btnCart_Click(object sender, EventArgs e)
        //{
        //    string User_Id = "";
        //    DataView dv = (DataView)ClientsDataSource.Select(DataSourceSelectArguments.Empty);
        //    for (int i = 0; i < dv.Table.Rows.Count; i++)
        //    {
        //        string Pseudo = dv.Table.Rows[i]["Login"].ToString();
        //        if (Session["Pseudo"].ToString() == Pseudo)
        //        {
        //            User_Id = dv.Table.Rows[i]["User_Id"].ToString();
        //            //TotalPrice = Convert.ToDouble(LblPu.Text) * Convert.ToDouble(TxtQty.Text);
        //            break;
        //        }
        //    }
        //    var sql = "INSERT INTO tbl_Cart(Product_Id,AddedDate,User_Id,Quantity,Status) values('',GETDATE(),'','','')";
        //    var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "successalert('Added to cart successfully')", true);
        //}

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int User_Id = ECommerce_WebPortal.App_Data.Auth_login.GetUserid(Session["Pseudo"].ToString());
            if (e.CommandName== "Cart")
            {
                var productid = e.CommandArgument.ToString();
                foreach (ListViewItem itemRow in ListView1.Items)
                {
                    var lblserialno = (DropDownList)itemRow.FindControl("TxtQty");
                    var hdnProduct = ((HiddenField)itemRow.FindControl("hdnProduct")).Value;
                    if(productid==hdnProduct)
                    {
                        var sql = "INSERT INTO tbl_Cart(Product_Id,AddedDate,User_Id,Quantity,Status) values('" + productid + "',GETDATE(),'" + User_Id + "','"+ lblserialno .SelectedValue+ "',0)";
                        var dt = ECommerce_WebPortal.App_Data.ExecuteQuery.Execute(sql);
                    }
                }
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "successalert('Added to cart successfully')", true);
            LblMsg.Text = "Added to Cart Successfully";
            LblMsg.ForeColor = System.Drawing.Color.Green;
        }
    }
}