<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Clients_Cart.aspx.cs" Inherits="ECommerce_WebPortal.Clients_Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        <asp:GridView ID="GvCart" GridLines="None" CssClass="table table-hover" runat="server" AutoGenerateColumns="False">
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
                <asp:Button ID="Btncheckout" OnClick="Btncheckout_Click" Text="Checkout" CssClass="btn btn-sm" runat="server" />
            <asp:Button ID="btnDelete" Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-sm" runat="server" />

    </div>
</asp:Content>
