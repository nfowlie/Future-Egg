<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Cart page</h2>
    <p>&nbsp;</p>

    <%
    'Declare arrays prefixed as t (temp) and c (cart)
    'The first dimension is the number of items - rows
    'The second dimension is the attribute for each item - columns
    Dim tcart(10, 3), ccart(10, 3) As String
    
    'Declare a string to track if visit session
    Dim visited As Integer = Session("visit")
    
    'Declare other temporary variables, to track order number, order total, index variables, etc
    Dim orders As Integer
    Dim itemtotal As Double = 0
    Dim ordertotal As Double = 0
    Dim i, j, k, n As Integer
    
    'If this is first visit to the cart page, create new sessions variables
    If visited = 0 Then
        'Session variable to store cart
        Session("scart") = ccart
        'Session variable to store number of orders
        Session("orders") = 0
        'Session variable to store sum of orders
        Session("ordertotal") = 0.0
        'Session variable to store visited info
        Session("visit") = 1
    End If
    
    'If the cart program is called by shop.aspx, do the following
        'Note that id is one of the label names in the shop.aspx hyperlink query string
        If Request("id") > 0 And IsPostBack = False Then
            orders = Session("orders")
        
            orders = orders + 1
            If orders > 10 Then
                'I have assumed a limit of 10 orders in the cart
                'If the cart is full, display error message and cart
                Response.Write("<h2>Cart is full. You can have maximum 10 items at a time. ")
                Response.Write("Please delete one or more items before adding new.</h2>")
            Else
                'Get the current cart info from session variables
                'and store them in arrays
                ccart = Session("scart")
            
                'Find out if product already is in the cart
                'If it is, add 1 to quantity of that row
                'Do not change anything else
                Dim repeat As Integer = 0
                For i = 0 To (orders - 1)
                    If ccart(i, 0) = Request("id") Then
                        ccart(i, 3) = ccart(i, 3) + 1
                        repeat = 1
                        orders = orders - 1
                        Exit For
                    End If
                Next

                'if it is a new item not already in cart, add it to cart array
                If repeat = 0 Then
                    ccart(orders - 1, 0) = Request("id")
                    ccart(orders - 1, 1) = Request("pn")
                    ccart(orders - 1, 2) = Request("pr")
                    ccart(orders - 1, 3) = 1
                End If
            
                'Store arrays back into session variables
                Session("scart") = ccart
                Session("orders") = orders

            End If
        
        ElseIf IsPostBack = True Then 'This means Update Cart button is clicked 
            'store current session contents except quantity
            'into temporary arrays. The quantity are obtained
            'from the form textboxes.
            tcart = Session("scart")
            orders = Session("orders")
        
            'This For loop resets Quantity to 0 if the submitted form has 0 or deleted checkbox checked 
            'This is so it can be subsequently deleted from the cart as you will see later
            For i = 0 To (orders - 1)
                If Request("qty" & i) > 0 And Request("chk" & i) = "" Then
                    tcart(i, 3) = Request("qty" & i)
                Else
                    tcart(i, 3) = 0
                End If
            Next

            'The following is a process of copying values from the temp cart array to the regular cart array 
            'only for rows with qty>0, thereby deleting the row with qty=0

            n = 0
            For k = 0 To orders - 1
                If tcart(k, 3) > 0 Then
                    For j = 0 To 3
                        ccart(n, j) = tcart(k, j)
                    Next
                    n = n + 1
                End If
            Next

            'Store the new arrays into session variables
            Session("scart") = ccart
            Session("orders") = n

        End If

    'Display the current cart contents obtained from session
    'variables.  However, the quantity are displayed as
    'textboxes within a form so that they can be changed and
    'submitted for updating the cart
    ccart = Session("scart")
    orders = Session("orders")
    
        
    If orders > 0 Then
        ordertotal = 0
        
        Response.Write("<h3>Your orders are listed below.</h3>")
        Response.Write("<p>Number of items: " & orders & "</p>")
        
        'Displaying the table header row
        Response.Write("<div><table>")
            Response.Write("<tr><th>ID</th><th>ProductName</th>")
        Response.Write("<th>Price</th><th>Qty</th>")
        Response.Write("<th>Total</th><th>Delete</th></tr>")

        'For each row in the cart array, display a row in the table
        'Note how the quantity text boxes are declared with name=
        'and value= using i

            For i = 0 To orders - 1
                Response.Write("<tr>")
                Response.Write("<td>" & ccart(i, 0) & "</td>")
                Response.Write("<td>" & ccart(i, 1) & "</td>")
                Response.Write("<td>" & FormatCurrency(ccart(i, 2), 2) & "</td>")
                Response.Write("<td><input type='textbox' size='5' ")
                Response.Write(" name='qty" & i)
                Response.Write("' value = '" & ccart(i, 3) & "' /></td>")
                itemtotal = CDbl(ccart(i, 2)) * CInt(ccart(i, 3))
                'Adds appropriate tax by state'
                ordertotal = ordertotal + itemtotal + (itemtotal * Session("stateTax"))
                Response.Write("<td>" & FormatCurrency(itemtotal, 2) & "</td>")
                Response.Write("<td><input type='checkbox' ")
                Response.Write(" name='chk" & i & "' /></td>")
                Response.Write("</tr>")
            Next
        Response.Write("</table></div>")
        'We declare three buttons of type submit, which is submitted to form
        Response.Write("<div>The total order value is : " & FormatCurrency(ordertotal, 2) & "</div><br />")

            'Stores ccart in scart'
            Session("scart") = ccart
        'Store the ordertotal in a session variable
        Session("ordertotal") = ordertotal
            Response.Write("<p><input type='submit' name='submit' value='Update Cart' /></p>")
            'Displays if payment option selected'
            If Session("stateTax") Then
                Response.Write("<p><a href='Home.aspx'>Continue Shopping</a></p>")
                Response.Write("<p><a href='Checkout.aspx'>Checkout</a></p>")
                Response.Write("<p><a href='ExistingPayment.aspx'>Choose a different Payment option</a></p>")
                Response.Write("<p><a href='NewPayment.aspx'>Enter New Payment</a></p>")
            Else
                'displayes if no payment selected'
                Response.Write("<p><a href='Home.aspx'>Continue Shopping</a></p>")
                Response.Write("<p><a href='ExistingPayment.aspx'>Use Existing Payment</a></p>")
                Response.Write("<p><a href='NewPayment.aspx'>Enter New Payment</a></p>")
            End If
    Else
        Response.Write("<p> The shopping cart is empty. <a href='Home.aspx'>Click here </a> to go to shopping page. </p>")
        
    End If

    %>
</asp:Content>

