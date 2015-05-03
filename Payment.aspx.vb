
Partial Class Payment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        checkoutOrder.Text = "Your total order value is: " & FormatCurrency(Session("ordertotal"))
    End Sub



End Class
