<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard_Products.aspx.cs" Inherits="Ecommerce.Dashboard_Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <style>
        .jumbotron {
            margin-top: 8% !important;
        }
        .btn {
            padding: 6px 30px;
            background-color: #333;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
            min-width:100px;
        }
    </style>

    <div class="jumbotron container">

        <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>

        <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Product_Id" DataSourceID="ProductsDataSource" AllowSorting="True" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Product No" InsertVisible="False" SortExpression="Product_Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="BtnAdd" runat="server" CssClass="btn text-center" OnClick="BtnAdd_Click" Text="Add" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Product_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Designation" SortExpression="Designation">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Designation") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TxtDesignation" runat="server" CssClass="form-control"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image" SortExpression="URLImage">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" EnableTheming="True" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" EnableTheming="True" />
                        <asp:CustomValidator ID="CustomValidator1" ControlToValidate="FileUpload1" EnableClientScript="true" runat="server" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# Eval("URLImage") %>' Width="40px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="Pu">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("Price") %>' TextMode="Number"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" runat="server" ErrorMessage="Invalid Price"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TxtPrixU" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TxtPrixU" ForeColor="Red" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" runat="server" ErrorMessage="Invalid Price"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Products] WHERE [Product_Id] = @Product_Id" InsertCommand="INSERT INTO [tbl_Products] ([Designation], [URLImage], [Price]) VALUES (@Designation, @URLImage, @Price)" SelectCommand="SELECT [Product_Id], [Designation], [URLImage], [Price] FROM [tbl_Products]" UpdateCommand="UPDATE [tbl_Products] SET [Designation] = @Designation, [URLImage] = @URLImage, [Price] = @Price WHERE [Product_Id] = @Product_Id" OnSelected="ProductsDataSource_Selected">
            <DeleteParameters>
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Designation" Type="String" />
                <asp:Parameter Name="URLImage" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Designation" Type="String" />
                <asp:Parameter Name="URLImage" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
