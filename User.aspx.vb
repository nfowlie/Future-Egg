
Partial Class User
    Inherits System.Web.UI.Page

    
    'Hides and shows appropriate information'
    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        If DropDownList2.SelectedIndex = 0 Then
            GridView1.Visible = True
        Else
            GridView1.Visible = False
        End If
    End Sub
    'Hides and shows appropriate information'
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.SelectedIndex = 0
        'Clears items in dropdownlist2 to remove redundancy'
        If DropDownList1.SelectedIndex = 0 Then
            GridView1.Visible = True
            Label2.Visible = False
            DropDownList2.Visible = False
            Dim first As ListItem = DropDownList2.Items(0)
            DropDownList2.Items.Clear()
            DropDownList2.Items.Add(first)
        Else
            DropDownList2.Visible = True
            Label2.Visible = True
            Label2.Text = "Select Order Number"
        End If
    End Sub
    'Hides and shows appropriate information'
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If DropDownList1.SelectedIndex = 0 Then
            DropDownList2.Visible = False
        End If
    End Sub
End Class
