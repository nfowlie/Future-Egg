<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="User.aspx.vb" Inherits="User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Order History
    </h2>
    Select Order Date:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="OrderDateTime" DataValueField="OrderDateTime" AppendDataBoundItems="True">
        <asp:ListItem Text="--Select Order Date--" Value="" />
    </asp:DropDownList>
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="OrderNumber" DataValueField="OrderNumber">
        <asp:ListItem Text="--Select Order Number--" Value="" />
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [OrderNumber] FROM [OrderHistory] WHERE ([userName] = @userName) AND OrderDateTime = @OrderDate">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="userName" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="OrderDate" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [OrderDateTime] FROM [OrderHistory] WHERE ([userName] = @userName)">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="userName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="mGrid" PagerStyle-CssClass="pgr" GridLines="None" AlternatingRowStyle-CssClass="alt">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="OrderNumber" HeaderText="OrderNumber" SortExpression="OrderNumber" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Shipped Address" HeaderText="Shipped Address" SortExpression="Shipped Address" ReadOnly="True" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" DataFormatString="{0:c}" />
            <asp:BoundField DataField="ProductQuantity" HeaderText="ProductQuantity" SortExpression="ProductQuantity" />
        </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT OrderHistory.OrderNumber, PaymentInfo.firstName + ' ' + PaymentInfo.lastName AS Name, PaymentInfo.address + ' ' + PaymentInfo.city + ', ' + PaymentInfo.state + ' ' + PaymentInfo.zipcode AS [Shipped Address], OrderHistory.ProductName, OrderHistory.ProductPrice, OrderHistory.ProductQuantity FROM PaymentInfo INNER JOIN OrderHistory ON OrderHistory.userName = PaymentInfo.userName WHERE (OrderHistory.userName = @userName AND OrderHistory.userName = PaymentInfo.userName AND OrderHistory.PaymentID = PaymentInfo.ID) AND OrderHistory.OrderDateTime = @OrderDate">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="userName" />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="OrderDate" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="mGrid" PagerStyle-CssClass="pgr" GridLines="None" AlternatingRowStyle-CssClass="alt">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="OrderNumber" HeaderText="OrderNumber" SortExpression="OrderNumber" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Shipped Address" HeaderText="Shipped Address" ReadOnly="True" SortExpression="Shipped Address" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" DataFormatString="{0:c}" />
            <asp:BoundField DataField="ProductQuantity" HeaderText="ProductQuantity" SortExpression="ProductQuantity" />
        </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT OrderHistory.OrderNumber, PaymentInfo.firstName + ' ' + PaymentInfo.lastName AS Name, PaymentInfo.address + ' ' + PaymentInfo.city + ', ' + PaymentInfo.state + ' ' + PaymentInfo.zipcode AS [Shipped Address], OrderHistory.ProductName, OrderHistory.ProductPrice, OrderHistory.ProductQuantity FROM PaymentInfo INNER JOIN OrderHistory ON OrderHistory.userName = PaymentInfo.userName WHERE (OrderHistory.userName = @userName AND OrderHistory.userName = PaymentInfo.userName AND OrderHistory.PaymentID = PaymentInfo.ID) AND OrderHistory.OrderDateTime = @OrderDate AND OrderHistory.OrderNumber = @OrderNumber">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="userName" />
            <asp:ControlParameter ControlID="DropDownList1" Name="OrderDate" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="OrderNumber" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

