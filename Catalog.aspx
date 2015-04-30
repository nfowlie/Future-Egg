<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Catalog.aspx.vb" Inherits="Catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" AllowPaging="True" CssClass="mGrid" PagerStyle-CssClass="pgr" GridLines="None" AlternatingRowStyle-CssClass="alt">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
            <Columns>
                <asp:ImageField DataImageUrlField="ProductImage" HeaderText="Product Image">
                </asp:ImageField>
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Product.aspx?id={0}" DataTextField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="ProductType" HeaderText="ProductType" SortExpression="ProductType" />
                <asp:HyperLinkField DataNavigateUrlFields="ID,ProductName,Price" DataNavigateUrlFormatString="cart.aspx?id={0}&amp;pn={1}&amp;pr={2}" HeaderText="Add to Cart" Text="Add to Cart" />
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Products.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * 
FROM [Products] 
WHERE 
([ProductDescription] LIKE '%' + @ProductDescription + '%')
OR
([ProductType] LIKE @Type)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductDescription" QueryStringField="ProductDescription" DefaultValue="&quot;&quot;" />
                <asp:QueryStringParameter DefaultValue="&quot;&quot;" Name="Type" QueryStringField="Type" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
     
</asp:Content>

