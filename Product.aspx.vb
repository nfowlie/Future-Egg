
Partial Class Product
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_PreRender(sender As Object, e As EventArgs) Handles DetailsView1.PreRender
        For i As Integer = 0 To DetailsView1.Rows.Count - 1
            DetailsView1.Rows(i).Cells(0).Visible = False
        Next
    End Sub
End Class
