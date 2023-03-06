<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard_Orders.aspx.cs" Inherits="Ecommerce.Dashboard_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .jumbotron {
            margin-top: 8% !important;
        }
    </style>

    <div class="jumbotron container">
        
        <div class="row text-center">
            <div class="col-md-3">
                Search Option :<asp:DropDownList ID="DropDownList1" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="1">Order No</asp:ListItem>
                    <asp:ListItem Value="2">Order Date</asp:ListItem>
                    <asp:ListItem Value="3">Between two Date</asp:ListItem>
                    <asp:ListItem Value="4">User ID</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="div1" runat="server" class="col-sm-4">
                Order No :<asp:TextBox ID="TxtNumCmd" TextMode="Number" CssClass="form-control" Placeholder="'Enter Order No'" runat="server"></asp:TextBox>
            </div>
            <div id="div2" runat="server" class="col-sm-4" visible="false">
                Order Date :<asp:TextBox ID="TxtDate" CssClass="form-control" Placeholder="'Enter Order Date'" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Date" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDate" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtDate" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
            </div>
            <div id="div3" runat="server" class="col-sm-4" visible="false">
                Start Date :<asp:TextBox ID="TxtDate1" CssClass="form-control" Placeholder="'Enter Order Date'" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtDate1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Start Date" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDate1" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                <br />
                End Date :<asp:TextBox ID="TxtDate2" CssClass="form-control" Placeholder="'Enter Order Date'" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtDate2" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid End Date" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDate2" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
            </div>
            <div id="div4" runat="server" class="col-sm-4" visible="false">
                User No :<asp:TextBox ID="TxtUserId" TextMode="Number" CssClass="form-control" Placeholder="'Enter Date User'" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3 pull-right">
                <br />
                <asp:Button ID="BtnSearch" CssClass="btn" runat="server" Text="Search" OnClick="BtnSearch_Click"  />
            </div>
        </div>
                <br />
                <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
<br />
        <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Order_Id" DataSourceID="OrderListsDataSource" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Order_Id" HeaderText="Order No" InsertVisible="False" ReadOnly="True" SortExpression="User_Id" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
                <asp:BoundField DataField="User_Id" HeaderText="User No" SortExpression="User_Id" />
                <asp:BoundField DataField="Product_Id" HeaderText="Product No" SortExpression="Product_Id" />
                <asp:BoundField DataField="ProductQuantity" HeaderText="Product Quantity No" SortExpression="ProductQuantity" />
                <asp:BoundField DataField="OrderedAddress" HeaderText="Ordered Address" SortExpression="OrderedAddress" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="OrderListsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Orders] WHERE [Order_Id] = @Order_Id" InsertCommand="INSERT INTO [tbl_Orders] ([OrderDate], [User_Id], [Product_Id], [ProductQuantity],[OrderedAddress]) VALUES (@OrderDate, @User_Id, @Product_Id, @ProductQuantity,@OrderedAddress)" SelectCommand="SELECT [Order_Id], [OrderDate], [User_Id], [Product_Id], [ProductQuantity], [OrderedAddress] FROM [tbl_Orders]" UpdateCommand="UPDATE [tbl_Orders] SET [OrderDate] = @OrderDate, [User_Id] = @User_Id, [Product_Id] = @Product_Id, [ProductQuantity] = @ProductQuantity, [OrderedAddress] = @OrderedAddress WHERE [Order_Id] = @Order_Id" OnSelected="CommandesListeDataSource_Selected">
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
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="OrderDate" />
                <asp:Parameter Name="User_Id" Type="Int32" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
                <asp:Parameter Name="ProductQuantity" Type="Int32" />
                <asp:Parameter Name="OrderedAddress" Type="String" />
                <asp:Parameter Name="Order_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
