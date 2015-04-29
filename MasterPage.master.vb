
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim item As String = products.Text
        Response.Redirect("Catalog.aspx?ProductDescription=" + item)
    End Sub

    Protected Sub TreeView1_SelectedNodeChanged(sender As Object, e As EventArgs) Handles TreeView1.SelectedNodeChanged
        Dim type As String = TreeView1.SelectedNode.Value
        Response.Redirect("Catalog.aspx?Type=" + type)
    End Sub
End Class

