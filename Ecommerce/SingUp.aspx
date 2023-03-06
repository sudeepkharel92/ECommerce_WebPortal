<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Default.Master" AutoEventWireup="true" CodeBehind="SingUp.aspx.cs" Inherits="Ecommerce.SingUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">
    

    <!-- Container (TOUR Section) -->
    <div id="SingUp" class="bg-1">
        <div class="container text-center">
            <h3 class="text-center">Welcome to Sandy’s Souvenir Shop</h3>
            <p class="text-center">
                Create your own Account.<br>
                Remember to book your tickets!
            </p>
            <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Username</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtLogin" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtLogin" ErrorMessage="Required Field" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TxtLogin" OnServerValidate="TxtLogin_ServerValidate" ErrorMessage="Pseudo Exist déja" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
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

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Retype Password</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtPasswdR" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords are different" ControlToCompare="TxtPasswd" ControlToValidate="TxtPasswdR" ForeColor="Red"></asp:CompareValidator>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">First Name</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtNom" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtNom" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Last Name</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtPrenom" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtPrenom" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Address</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtAdresse" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtAdresse" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

<%--            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">City</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:DropDownList ID="CityList" CssClass="form-control" runat="server" DataSourceID="CityListDataSource" DataTextField="CityName" DataValueField="CityName"></asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="CityListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="SELECT [CityName] FROM [CityList]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>--%>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Phone</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtTele" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtTele" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <br />

            <asp:Button ID="BtnSingUp" runat="server" CssClass="btn" Text="Sign Up" OnClick="BtnSingUp_Click" />
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
