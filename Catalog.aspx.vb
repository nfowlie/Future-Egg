
Partial Class Catalog
    Inherits System.Web.UI.Page
    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender
        For i As Integer = 0 To GridView1.Rows.Count - 1
            If (HttpContext.Current.User.Identity.IsAuthenticated) Then
            Else
                GridView1.Rows(i).Cells(4).Text = "Must be logged in to order"
            End If
        Next
    End Sub
End Class
