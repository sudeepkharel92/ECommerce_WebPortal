<%@ Page Title="Products" Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Clients_Products.aspx.cs" Inherits="Ecommerce.Clients_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Products</title>
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

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="Images/Clothes.jpg" alt="Clothes" width="1200" height="700">
                <div class="carousel-caption">
                    <h1>Clothes Now Available</h1>
                    <p>Buy online and get fast, free shipping.</p>
                </div>
            </div>

            <div class="item">
                <img src="Images/Gifts.jpg" alt="Gifts" width="1200" height="700">
                <div class="carousel-caption">
                    <h1>Handmade Gifts</h1>
                    <p>A touch of genius.</p>
                </div>
            </div>

            <div class="item">
                <img src="Images/Antiques.jpg" alt="Antiques" width="1200" height="700">
                <div class="carousel-caption">
                    <h1>Antiques</h1>
                    <p>Buy online and pick up available items in an hour.</p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="BtnPay" />--%>
            <%--            <asp:AsyncPostBackTrigger ControlID="BtnBuy" EventName="Click" />--%>
        </Triggers>
        <ContentTemplate>
            <div id="band" class="container">
                <h2 class="text-center">Buy Your Product Now.</h2>
                <br />
                <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
                <br />

                <asp:ListView ID="ListView1" runat="server" GroupItemCount="3" GroupPlaceholderID="groupPlaceHolder1" OnItemCommand="ListView1_ItemCommand"
                    ItemPlaceholderID="itemPlaceHolder1">
                    <LayoutTemplate>
                        <div class="row text-center">
                            <table>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("URLImage") %>' alt="Product Image" Height="200" />
                                <asp:Label ID="LblDesignation" runat="server" Text='<%#Eval("Designation")%>' Font-Bold="true" />
                                <br />
                                <asp:HiddenField ID="hdnProduct" Value='<%# Eval("Product_Id") %>' runat="server" />
                                <asp:Label ID="LblPu" runat="server" Text='<%#Eval("Price") + " MYR"%>' Font-Bold="true" />
                                <br />
                                Quantity
                               
                                <asp:DropDownList ID="TxtQty" runat="server">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />
                                <%--<asp:Button ID="btnCart" OnClick="btnCart_Click" runat="server" CssClass="btn btn-sm" Text="Add to Cart" Width="40%" />--%>
                                <asp:LinkButton ID="lnkbutton" runat="server" Text="Add To Cart" CommandName="Cart" CommandArgument='<%#Bind("Product_Id") %>'></asp:LinkButton>
                                <br />
                                <br />
                                <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                <%--<asp:Button ID="BtnBuy" OnClick="BtnBuy_Click" runat="server" CssClass="btn btn-sm" Text="Buy" Width="60%" OnClientClick="return confirm('Confirm : Pay your Purchase ?')" />--%>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>

            <!-- Modal -->
            <%--    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4><span class="glyphicon glyphicon-lock"></span>Confirm purchase</h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="usrname"><span class="glyphicon glyphicon-user"></span>Send To</label>
                        </div>
                        <asp:Button ID="BtnPay" OnClick="BtnPay_Click" CssClass="btn btn-block" runat="server" Text="Pay" />
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span>Cancel
                    </button>
                    <p>Need <a href="#contact" class="close">help?</a></p>
                </div>
            </div>
        </div>
    </div>--%>





            <!-- Container (Contact Section) -->
            <div id="contact" class="container">
                <h2 class="text-center">Feedback</h2>
                <div class="row">
                    <div class="col-md-4">
                        <p><span class="glyphicon glyphicon-map-marker"></span>Kaula Lumpur, Malaysia</p>
                        <p><span class="glyphicon glyphicon-phone"></span>Phone: +602 524000000</p>
                        <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <input class="form-control" id="inpName" runat="server" name="name" placeholder="Name" type="text">
                            </div>
                            <div class="col-sm-6 form-group">
                                <input class="form-control" id="inpEmail" runat="server" name="email" placeholder="Email" type="email">
                            </div>
                        </div>
                        <textarea class="form-control" id="txtareaComments" runat="server" name="comments" placeholder="Comment" rows="5"></textarea>
                        <br>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <asp:Button ID="btnFeedBack" runat="server" OnClick="btnFeedBack_Click" CssClass="btn btn-sm" Text="Send" Width="60%" />
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:SqlDataSource ID="FeedbackDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" InsertCommand="INSERT INTO [tbl_FeedBacks] ([Name], [Message], [Email]) VALUES (@Name, @Message, @Email)">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="string" />
            <asp:Parameter Name="Message" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CartDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Cart] WHERE [Cart_Id] = @Cart_Id" InsertCommand="INSERT INTO [tbl_Cart] ([AddedDate], [User_Id], [Product_Id], [Quantity]) VALUES (@AddedDate, @User_Id, @Product_Id, @Quantity)" SelectCommand="SELECT [Cart_Id], [AddedDate], [User_Id], [Product_Id], [Quantity] FROM [tbl_Cart]" UpdateCommand="UPDATE [tbl_Cart] SET [AddedDate] = @AddedDate, [User_Id] = @User_Id, [Product_Id] = @Product_Id, [Product_Id] = @Product_Id WHERE [Cart_Id] = @Cart_Id">
        <DeleteParameters>
            <asp:Parameter Name="Cart_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="AddedDate" />
            <asp:Parameter Name="User_Id" Type="Int32" />
            <asp:Parameter Name="Product_Id" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="AddedDate" />
            <asp:Parameter Name="User_Id" Type="Int32" />
            <asp:Parameter Name="Product_Id" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Cart_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ProductListeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Products] WHERE [Product_Id] = @Product_Id" InsertCommand="INSERT INTO [tbl_Products] ([Product_Id], [Designation], [URLImage], [Price]) VALUES (@Product_Id, @Designation, @URLImage, @Price)" SelectCommand="SELECT [Product_Id], [Designation], [URLImage], [Price] FROM [tbl_Products]" UpdateCommand="UPDATE [tbl_Products] SET [Designation] = @Designation, [URLImage] = @URLImage, [Price] = @Price WHERE [Product_Id] = @Product_Id">
        <DeleteParameters>
            <asp:Parameter Name="Product_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Product_Id" Type="Int32" />
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


    <asp:SqlDataSource ID="OrderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" DeleteCommand="DELETE FROM [tbl_Orders] WHERE [Order_Id] = @Order_Id" InsertCommand="INSERT INTO [tbl_Orders] ([OrderDate], [User_Id], [Product_Id], [ProductQuantity],[OrderedAddress]) VALUES (@OrderDate, @User_Id, @Product_Id, @ProductQuantity,@OrderedAddress)" SelectCommand="SELECT [Order_Id], [OrderDate], [User_Id], [Product_Id], [ProductQuantity],[OrderedAddress] FROM [tbl_Orders]" UpdateCommand="UPDATE [tbl_Orders] SET [OrderDate] = @OrderDate, [User_Id] = @User_Id, [Product_Id] = @Product_Id, [ProductQuantity] = @ProductQuantity,[OrderedAddress] = @OrderedAddress WHERE [Order_Id] = @Order_Id">
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


    <!-- Add Google Maps -->
    <div id="googleMap"></div>
    <script>
        function myMap() {
            var myCenter = new google.maps.LatLng(31.62196, -8.04704);
            var mapProp = { center: myCenter, zoom: 14, scrollwheel: false, draggable: false, mapTypeId: 'hybrid' };
            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            var marker = new google.maps.Marker({ position: myCenter });
            marker.setMap(map);
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKQSxsyNq91yDKVj2Ak-kCyfexcr1s6GI&callback=myMap"></script>

</asp:Content>
