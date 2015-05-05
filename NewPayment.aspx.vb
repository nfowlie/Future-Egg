Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient

Partial Class Payment
    Inherits System.Web.UI.Page
    'Displays order total'
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        checkoutOrder.Text = "Your total order value is: " & FormatCurrency(Session("ordertotal"))
        Session("userName") = Page.User.Identity.Name
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim sql As String
        Dim n As Integer
        Dim connString As String
        'Connects to database'
        connString = "Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\OrderHistory.mdf;Integrated Security=True"

        Dim sqlConnection1 As New SqlConnection(connString)
        'Query to add payment info'
        sql = "INSERT INTO PaymentInfo (userName, firstName, lastName, email, address, city, zipcode, state, cardNumber, cardExpireDate, securityCode) VALUES (@userName, @firstNameDB,@lastNameDB, @emailDB,@addressDB,@cityDB,@zipcodeDB,@stateDB,@cardNumberDB,@cardExpireDateDB, @securityCodeDB);"

        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = sql
        cmd.Connection = sqlConnection1

        sqlConnection1.Open()
        'Adds payment info to database'
        cmd.Parameters.AddWithValue("@userName", Session("userName"))
        cmd.Parameters.AddWithValue("@firstNameDB", fname.Text)
        cmd.Parameters.AddWithValue("@lastNameDB", lname.Text)
        cmd.Parameters.AddWithValue("@emailDB", email.Text)
        cmd.Parameters.AddWithValue("@addressDB", address.Text)
        cmd.Parameters.AddWithValue("@cityDB", city.Text)
        cmd.Parameters.AddWithValue("@zipcodeDB", zipcode.Text)
        cmd.Parameters.AddWithValue("@stateDB", state.Text)
        cmd.Parameters.AddWithValue("@cardNumberDB", cardNumber.Text)
        cmd.Parameters.AddWithValue("@cardExpireDateDB", cardExpirationdate.Text)
        cmd.Parameters.AddWithValue("@securityCodeDB", securityCode.Text)

        Try
            n = cmd.ExecuteNonQuery()
        Catch ex As SqlException

        End Try

        If n > 0 Then

        End If


        cmd.Connection.Close()

        Response.Redirect("Cart.aspx")
    End Sub
End Class
