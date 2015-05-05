<%@ Page Title="" Language="VB" AutoEventWireup="false" CodeFile="ExistingPayment.aspx.vb" Inherits="ExistingPayment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Future Egg - Eggsisting Payment</title>
    <%-- Favicon --%>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png" />
    <link rel="manifest" href="favicon/manifest.json" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="favicon/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />
</head>
<body>
    <form id="form2" runat="server">
                <header>
            <div id="userInfo">
                <a href="User.aspx"><Asp:LoginName id ="LoginName1" runat="server" FormatString="{0}" />&nbsp;&nbsp;&nbsp;&nbsp;</a><a href="Cart.aspx"><asp:Label ID="Label1" runat="server"  Text="Cart"></asp:Label></a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Home.aspx" />
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="Login1" runat="server" CreateUserText="Register" CreateUserUrl="register.aspx" Orientation="Horizontal" RememberMeText="Remember me" TitleText="">
                        </asp:Login>
                    </AnonymousTemplate>
                </asp:LoginView>
            </div>
            <div id="logo">
                <a href="Home.aspx"><img src="Images/Future-Egg-Logo.png" /></a>
            </div>
            <div id="advertisement">
                <a href="http://www.newegg.com"><img src="Images/new.jpg" /></a>
            </div>
        </header>
        
        <nav>
            <ul>
                <li>
                    <a href="Home.aspx"><span>Home</span></a>
                </li>
                <li class="active has-sub">
                    <a href="#"><span>Hardware</span></a>
                    <ul>
                        <li><a href="Catalog.aspx?Type=CPU"><span>CPU</span></a></li>
                        <li><a href="Catalog.aspx?Type=RAM"><span>RAM</span></a></li>
                        <li><a href="Catalog.aspx?Type=Case"><span>Case</span></a></li>
                        <li class="has-sub"><a href="#"><span>Hard Drives</span></a>
                            <ul>
                                <li><a href="Catalog.aspx?Type=HDD"><span>HDD</span></a></li>
                                <li><a href="Catalog.aspx?Type=SSD"><span>SSD</span></a></li>
                            </ul>
                        </li>
                        <li><a href="Catalog.aspx?Type=Graphics Card"><span>Graphics Card</span></a></li>
                        <li><a href="Catalog.aspx?Type=Power Supply"><span>Power Supply</span></a></li>
                        <li><a href="Catalog.aspx?Type=Motherboards"><span>Motherboard</span></a></li>
                    </ul>
                </li>
                <li>
                    <a href="FAQ.aspx"><span>FAQ</span></a>
                </li>
                <li>
                    <a href="ContactUs.aspx"><span>Contact Us</span></a>
                </li>
                <li>
                    <a href="AboutUs.aspx"><span>About Us</span></a>
                </li>
            </ul>            
        </nav>
        <section>
    <h2>
        Payment Page
    </h2>
        
    <p>
    <asp:Label ID="checkoutOrder" runat="server"></asp:Label>
    </p>
            <p>
    Select Payment Info:&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cardNumber" DataValueField="Id" AppendDataBoundItems="True">
                    <asp:ListItem Text="--Select--" Value="" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [cardNumber] FROM [PaymentInfo] WHERE ([userName] = @userName)">
                    <SelectParameters>
                        <asp:SessionParameter Name="userName" SessionField="userName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="mGrid" PagerStyle-CssClass="pgr" GridLines="None" AlternatingRowStyle-CssClass="alt">
                    <Columns>
                        <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                        <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="zipcode" HeaderText="zipcode" SortExpression="zipcode" />
                        <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                        <asp:BoundField DataField="cardNumber" HeaderText="cardNumber" SortExpression="cardNumber" />
                        <asp:BoundField DataField="cardExpireDate" HeaderText="cardExpireDate" SortExpression="cardExpireDate" />
                        <asp:BoundField DataField="securityCode" HeaderText="securityCode" SortExpression="securityCode" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [firstName], [lastName], [email], [address], [city], [zipcode], [state], [cardNumber], [cardExpireDate], [securityCode] FROM [PaymentInfo] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                <a href="Cart.aspx"><asp:Label ID="Label2" runat="server" Text="Continue to checkout"></asp:Label></a></p>
                <a href="NewPayment.aspx">Add New Payment Option</a>
            <br />
            
            

            </section>
    </form>
</body>
</html>
