<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Checkout_Products.aspx.cs" Inherits="ECommerce_WebPortal.Checkout_Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function successalert(msg) {
            console.log("test");
            swal({
                title: 'Congratulations!',
                text: msg,
                type: 'success'
            });
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">

    <style>
        body{
                background-color:#2d2d30;
        }
        .jumbotron{
                margin-top:8% !important;
        }
    </style>
    <div class="jumbotron container">
        
        <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="HiddenField1" runat="server" />

        <div class="row">
            <div class="col-md-3">
                        <label class="control-label">CreditCard No</label>
                    </div>
            <div class="col-md-5">
                <div class="form-group label-floating">
                    <asp:TextBox ID="txtCreditCard" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCreditCard" ErrorMessage="Required Field" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                        <label class="control-label">Address</label>
                    </div>
            <div class="col-md-5">
                <div class="form-group label-floating">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ErrorMessage="Required Field" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <asp:GridView ID="GvChkProduct" GridLines="None" CssClass="table table-hover" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Order Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderId" Text='<%#Bind("Cart_Id") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblProductId" Text='<%#Bind("Product_Id") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Items">
                    <ItemTemplate>
                        <asp:Label ID="lblItem" Text='<%#Bind("items") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderDate" Text='<%#Bind("OrderDate") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="lblQuantity" Text='<%#Bind("Quantity") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" Text='<%#Bind("Price") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                
         </asp:GridView>

        <asp:Button ID="BtnBuy" OnClick="BtnBuy_Click" CommandName="Buy" CommandArgument='<%# Bind("Cart_Id") %>' Text="Buy" CssClass="btn btn-sm" runat="server" />

    </div>
</asp:Content>