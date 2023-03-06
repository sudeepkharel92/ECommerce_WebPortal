<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Clients_Orders.aspx.cs" Inherits="Ecommerce.Clients_Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Orders</title>
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

    <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" DataSourceID="OrderListDataSource" AutoGenerateColumns="False" DataKeyNames="Order_Id" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="User_Id" HeaderText="User ID" SortExpression="User_Id" />
            <asp:BoundField DataField="Order_Id" HeaderText="Order No" InsertVisible="False" ReadOnly="True" SortExpression="Order_Id" />
            <%--<asp:BoundField DataField="Product_Id" HeaderText="Product ID" SortExpression="Product_Id" />--%>
            <asp:BoundField DataField="Designation" HeaderText="Items" SortExpression="Designation" />
            <asp:BoundField DataField="OrderDate" HeaderText="Ordered Date" SortExpression="OrderDate" />
            <asp:BoundField DataField="ProductQuantity" HeaderText="Quantity" SortExpression="ProductQuantity" />
            <asp:BoundField DataField="OrderedAddress" HeaderText="Ordered Address" SortExpression="OrderedAddress" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Total Price" HeaderText="Total Price" ReadOnly="True" SortExpression="Total Price" />
        </Columns>
        </asp:GridView>

    </div>
    <asp:SqlDataSource ID="OrderListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Orders] WHERE [Order_Id] = @Order_Id" InsertCommand="INSERT INTO [tbl_Orders] ([OrderDate], [User_Id], [Product_Id], [ProductQuantity],[OrderedAddress]) VALUES (@OrderDate, @User_Id, @Product_Id, @ProductQuantity,@OrderedAddress)" SelectCommand="SELECT tbl_Orders.User_Id,Order_Id,tbl_Orders.Product_Id,Designation,OrderDate,ProductQuantity,OrderedAddress,Price,Price * ProductQuantity 'Total Price'
            FROM tbl_Orders JOIN tbl_Users
            ON tbl_Orders.User_Id = tbl_Users.User_Id
            JOIN tbl_Products
            ON tbl_Orders.Product_Id= tbl_Products.Product_Id
            WHERE tbl_Orders.User_Id = @User_Id" UpdateCommand="UPDATE [tbl_Orders] SET [OrderDate] = @OrderDate, [User_Id] = @User_Id, [Product_Id] = @Product_Id, [ProductQuantity] = @ProductQuantity,[OrderedAddress] =@OrderedAddress WHERE [Order_Id] = @Order_Id" OnSelected="ListCmdDataSource_Selected">
        <DeleteParameters>
            <asp:Parameter Name="Order_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="OrderDate" />
            <asp:Parameter Name="User_Id" Type="Int32" />
            <asp:Parameter Name="Product_Id" Type="Int32" />
            <asp:Parameter Name="ProductQuantity" Type="Int32" />
            <asp:Parameter Name="OrderedAddress" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="User_Id" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="OrderDate" />
            <asp:Parameter Name="User_Id" Type="Int32" />
            <asp:Parameter Name="Product_Id" Type="Int32" />
            <asp:Parameter Name="ProductQuantity" Type="Int32" />
            <asp:Parameter Name="OrderedAddress" Type="String" />
            <asp:Parameter Name="Order_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Users] WHERE [User_Id] = @User_Id" InsertCommand="INSERT INTO [tbl_Users] ([Login]) VALUES (@Login)" SelectCommand="SELECT [User_Id], [Login] FROM [tbl_Users]" UpdateCommand="UPDATE [tbl_Users] SET [Login] = @Login WHERE [User_Id] = @User_Id">
        <DeleteParameters>
            <asp:Parameter Name="User_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Login" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="User_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
