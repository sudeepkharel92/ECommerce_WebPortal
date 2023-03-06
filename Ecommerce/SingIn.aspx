<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Default.Master" AutoEventWireup="true" CodeBehind="SingIn.aspx.cs" Inherits="Ecommerce.SingIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">
    
    <!-- Container (TOUR Section) -->
    <div id="SingIN" class="bg-1">
        <div class="container text-center">
            <h3 class="text-center">Welcome to Sandy’s Souvenir Shop </h3>
            <p class="text-center">Login to your Account.<br>
                Remember to Get Best deals!</p>
            <p class="text-center">Log in with <a href="Admin.aspx"><strong>Admin Account ?</strong></a></p>
            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Username</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtLogin" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLogin" ErrorMessage="Required Field" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Password</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtPasswd" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtPasswd" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <asp:Label ID="LblMsg" runat="server" CssClass="control-label" ForeColor="Red"></asp:Label>

            <br />

            <asp:Button ID="BtnSingIn" CssClass="btn" runat="server" Text="Sign In" OnClick="BtnSingIn_Click" />
        </div>
    </div>

    
    <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Users] WHERE [User_Id] = @User_Id" InsertCommand="INSERT INTO [tbl_Users] ([FirstName], [LastName], [Address], [City], [Phone], [Login], [Password]) VALUES (@FirstName, @LastName, @Address, @City, @Phone, @Login, @Password)" SelectCommand="SELECT [User_Id], [FirstName], [LastName], [Address], [City], [Phone], [Login], [Password] FROM [tbl_Users]" UpdateCommand="UPDATE [tbl_Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [Phone] = @Phone, [Login] = @Login, [Password] = @Password WHERE [User_Id] = @User_Id">
        <DeleteParameters>
            <asp:Parameter Name="User_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Phone" Type="Int32" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Phone" Type="Int32" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="User_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
