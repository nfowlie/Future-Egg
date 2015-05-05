
Partial Class ExistingPayment
    Inherits System.Web.UI.Page

    
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Session("paymentID") = DropDownList1.SelectedValue
    End Sub


End Class
