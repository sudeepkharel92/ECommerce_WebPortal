<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard_Clients.aspx.cs" Inherits="Ecommerce.Dashboard_Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .jumbotron {
            margin-top: 8% !important;
        }
    </style>

    <div class="jumbotron container">

        <asp:TextBox ID="TxtSearch" CssClass="form-control pull-right" Placeholder="'FirstName', 'LastName', 'City', ...'" Height="42px" Width="30%" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" DataSourceID="ClientsDataSource" AutoGenerateColumns="False" DataKeyNames="User_Id" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="User_Id" HeaderText="User No" InsertVisible="False" ReadOnly="True" SortExpression="User_Id" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Users] WHERE [User_Id] = @original_NumClient" InsertCommand="INSERT INTO [tbl_Users] ([FirstName], [LastName], [Address], [City], [Phone], [Login], [Password]) VALUES (@FirstName, @LastName, @Address, @City, @Phone, @Login, @Password)" SelectCommand="SELECT [User_Id], [FirstName], [LastName], [Address], [City], [Phone], [Login], [Password] FROM [tbl_Users]
                            WHERE User_Id LIKE @SearchValue + '%'
                            OR FirstName LIKE @SearchValue + '%'
                            OR LastName LIKE @SearchValue + '%'
                            OR Address LIKE @SearchValue + '%'
                            OR City LIKE @SearchValue + '%'
                            OR Phone LIKE @SearchValue + '%'
                            OR Login LIKE @SearchValue + '%'
                            OR Password LIKE @SearchValue + '%'"
            UpdateCommand="UPDATE [tbl_Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [Phone] = @Phone, [Login] = @Login, [Password] = @Password WHERE [User_Id] = @original_NumClient" OldValuesParameterFormatString="original_{0}" OnSelected="ClientsDataSource_Selected">
            <DeleteParameters>
                <asp:Parameter Name="original_NumClient" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Phone" Type="Int32" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Pass" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TxtSearch" DefaultValue="%" Name="SearchValue" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Phone" Type="Int32" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Pass" Type="String" />
                <asp:Parameter Name="original_NumClient" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <%--    <script type="text/javascript">
        function Search_Gridview(strKey, strGV) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById(strGV);
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }    
</script>--%>
</asp:Content>

