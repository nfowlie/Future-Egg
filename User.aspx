<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="User.aspx.vb" Inherits="User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    Select Order Date:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="OrderDateTime" DataValueField="OrderDateTime">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [OrderDateTime] FROM [OrderHistory] WHERE ([userName] = @userName)">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="userName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Shipped Address" HeaderText="Shipped Address" ReadOnly="True" SortExpression="Shipped Address" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" />
            <asp:BoundField DataField="ProductQuantity" HeaderText="ProductQuantity" SortExpression="ProductQuantity" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT PaymentInfo.firstName + ' ' + PaymentInfo.lastName AS Name, PaymentInfo.address + ' ' + PaymentInfo.city + ', ' + PaymentInfo.state + ' ' + PaymentInfo.zipcode AS [Shipped Address], OrderHistory.ProductName, OrderHistory.ProductPrice, OrderHistory.ProductQuantity FROM PaymentInfo INNER JOIN OrderHistory ON OrderHistory.userName = PaymentInfo.userName WHERE OrderHistory.userName = @userName AND OrderHistory.userName = PaymentInfo.userName AND OrderHistory.OrderDateTime = @OrderDate AND OrderHistory.PaymentID = PaymentInfo.ID">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="userName" />
            <asp:ControlParameter ControlID="DropDownList1" Name="OrderDate" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

