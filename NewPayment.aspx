<%@ Page Title="" Language="VB" AutoEventWireup="false" CodeFile="NewPayment.aspx.vb" Inherits="Payment" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
                <header>
            <div id="userInfo">
                <a href="Cart.aspx"><asp:Label ID="Label1" runat="server" Text="Cart"></asp:Label></a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:LoginStatus ID="LoginStatus1" runat="server" />
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
    <p>
        Payment Page</p>
    <p>
    <asp:Label ID="checkoutOrder" runat="server"></asp:Label>
    </p>
            
    <p>
        First name:
        <asp:TextBox ID="fname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" Display="Dynamic" ErrorMessage="Please enter first name"></asp:RequiredFieldValidator>
    </p>
    <p>
        Last name:
        <asp:TextBox ID="lname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" Display="Dynamic" ErrorMessage="Please enter last name"></asp:RequiredFieldValidator>
    </p>
    <p id="Email">
        Email:
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please enter email" ControlToValidate="email" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Please enter correct email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p>
        Address:
        <asp:TextBox ID="address" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="Please enter address"></asp:RequiredFieldValidator>
    </p>
    <p>
        City:
        <asp:TextBox ID="city" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="city" Display="Dynamic" ErrorMessage="Please enter city"></asp:RequiredFieldValidator>
    </p>
    <p>
        Zipcode:
        <asp:TextBox ID="zipcode" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="zipcode" Display="Dynamic" ErrorMessage="Please enter a zipcode"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="zipcode" Display="Dynamic" ErrorMessage="Please enter corect zipcode" ValidationExpression="\d{5}(-\d{4})?"></asp:RegularExpressionValidator>
    </p>
    <p>
        State:
        <asp:DropDownList ID="state" runat="server" AppendDataBoundItems="True">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>NC</asp:ListItem>
            <asp:ListItem>SC</asp:ListItem>
            <asp:ListItem>FL</asp:ListItem>
            <asp:ListItem>CA</asp:ListItem>
            <asp:ListItem>NY</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="state" Display="Dynamic" ErrorMessage="Please select a state"></asp:RequiredFieldValidator>
    </p>
    <p>
        Card number:
        <asp:TextBox ID="cardNumber" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cardNumber" Display="Dynamic" ErrorMessage="Please enter card number"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="cardNumber" ErrorMessage="Enter in valid Card number" ValidationExpression="\b4[0-9]{12}(?:[0-9]{3})?\b"></asp:RegularExpressionValidator>
    </p>
    <p>
        Card expiration date:
        <asp:TextBox ID="cardExpirationdate" runat="server" TextMode="Month" Width="148px"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="cardExpirationdate" Display="Dynamic" ErrorMessage="Please enter expiration date"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="cardExpirationdate" ErrorMessage="Month/Year" ValidationExpression="^(1[0-2]|0[1-9]|\d)\/(20\d{2}|19\d{2}|0(?!0)\d|[1-9]\d)$"></asp:RegularExpressionValidator>
    </p>
    <p>
        Security code:
        <asp:TextBox ID="securityCode" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="securityCode" Display="Dynamic" ErrorMessage="Please enter the card security code"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="securityCode" ErrorMessage="Enter in a valid security code" ValidationExpression="[0-9][0-9][0-9]"></asp:RegularExpressionValidator>
    </p>
            <p>
                <asp:Button ID="Button3" runat="server" Text="Add Payment" />
            </p>
            </section>
    </form>
</body>
</html>
