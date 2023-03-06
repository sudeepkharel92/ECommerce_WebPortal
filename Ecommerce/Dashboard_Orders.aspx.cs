using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce
{
    public partial class Dashboard_Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Admin.aspx?Erreur=1");
            }
            
        }

        protected void BtnSearchNum_Click(object sender, EventArgs e)
        {
            //OrderListsDataSource.FilterExpression = "Order_Id = {0}";
            //OrderListsDataSource.FilterParameters.Add("Order_Id", TxtSearchNum.Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                div1.Visible = true;
                div2.Visible = false;
                div3.Visible = false;
            }
            switch (DropDownList1.SelectedValue)
            {
                case "1":
                    div1.Visible = true;
                    div2.Visible = false;
                    div3.Visible = false;
                    div4.Visible = false;
                    break;
                case "2":
                    div1.Visible = false;
                    div2.Visible = true;
                    div3.Visible = false;
                    div4.Visible = false;

                    break;
                case "3":
                    div1.Visible = false;
                    div2.Visible = false;
                    div3.Visible = true;
                    div4.Visible = false;

                    break;
                case "4":
                    div1.Visible = false;
                    div2.Visible = false;
                    div3.Visible = false;
                    div4.Visible = true;

                    break;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            OrderListsDataSource.FilterParameters.Clear();
            switch (DropDownList1.SelectedValue)
            {
                case "1":
                    OrderListsDataSource.FilterExpression = "Order_Id = {0}";
                    OrderListsDataSource.FilterParameters.Add("Order_Id", TxtNumCmd.Text);
                    break;
                case "2":
                    OrderListsDataSource.FilterExpression = "OrderDate = '{0}'";
                    OrderListsDataSource.FilterParameters.Add("OrderDate", Convert.ToDateTime(TxtDate.Text).ToString("yyyy-MM-dd"));
                    break;
                case "3":
                    OrderListsDataSource.FilterExpression = "OrderDate >= '{0}' AND dateCmd <= '{1}'";
                    OrderListsDataSource.FilterParameters.Add("OrderDate", Convert.ToDateTime(TxtDate1.Text).ToString("yyyy-MM-dd"));
                    OrderListsDataSource.FilterParameters.Add("OrderDate", Convert.ToDateTime(TxtDate2.Text).ToString("yyyy-MM-dd"));
                    break;
                case "4":
                    OrderListsDataSource.FilterExpression = "User_Id = {0}";
                    OrderListsDataSource.FilterParameters.Add("User_Id", TxtUserId.Text);
                    break;
                default:
                    //OrderListsDataSource.FilterExpression = "User_Id = ";
                    break;
            }
        }

        protected void CommandesListeDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1) LblMsg.Text = "No Data Found ...";
            else LblMsg.Text = string.Empty;
        }
    }
}