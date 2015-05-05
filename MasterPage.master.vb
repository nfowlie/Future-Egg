﻿
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim item As String = products.Text
        Response.Redirect("Catalog.aspx?ProductDescription=" + item)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (HttpContext.Current.User.Identity.IsAuthenticated) Then
            LoginView1.Visible = False
        Else
            LoginStatus1.Visible = False
            Label1.Visible = False
        End If
        products.Width = Unit.Percentage(80)
        Session("userName") = Page.User.Identity.Name
        Dim url As String = HttpContext.Current.Request.Url.AbsoluteUri


    End Sub

End Class

