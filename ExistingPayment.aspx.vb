﻿
Partial Class ExistingPayment
    Inherits System.Web.UI.Page

    'Hides and shows appropriate information'
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Session("paymentID") = DropDownList1.SelectedValue
        If DropDownList1.SelectedIndex = 0 Then
            Label2.Visible = False
        Else
            Label2.Visible = True

            
        End If
    End Sub


    'Hides and shows appropriate information'
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If DropDownList1.SelectedIndex = 0 Then
            Label2.Visible = False
        Else
            Label2.Visible = True
        End If
        Session("userName") = Page.User.Identity.Name
    End Sub

    Protected Sub GridView1_PreRender(sender As Object, e As EventArgs) Handles GridView1.PreRender
        'Sets a tax based on the state of the shipped address'
        Dim x As String = ""
        For i As Integer = 0 To GridView1.Rows.Count - 1
            x = GridView1.Rows(i).Cells(6).Text
            If x = "NY" Then
                Session("stateTax") = 0.04
            ElseIf x = "CA" Then
                Session("stateTax") = 0.075
            ElseIf x = "FL" Then
                Session("stateTax") = 0.06
            ElseIf x = "SC" Then
                Session("stateTax") = 0.06
            ElseIf x = "NC" Then
                Session("stateTax") = 0.0475
            End If
        Next

    End Sub
End Class
