Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient

Partial Class Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        checkoutOrder.Text = "Your total order value is: " & FormatCurrency(Session("ordertotal"))
        Dim orderProductName As String = ""
        Dim orderProductQuantity As String = ""
        Dim orderPrice As String = ""

        Dim itemCount As Integer = Session("orders")
        For i As Integer = 0 To itemCount - 1
            orderProductName = orderProductName & ", " & Session("scart")(i, 1)
            orderPrice = orderPrice & ", " & Session("scart")(i, 2).ToString
            orderProductQuantity = orderProductQuantity & ", " & Session("scart")(i, 3).ToString
        Next
        Label1.Text = orderProductName
        Label2.Text = orderPrice
        Label3.Text = orderProductQuantity






        Dim sql As String
        Dim n As Integer
        Dim connString As String

        connString = "Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Neil\Dropbox\Group8\App_Data\OrderHistory.mdf;Integrated Security=True"

        Dim sqlConnection1 As New SqlConnection(connString)

        sql = "INSERT INTO OrderHistory (ProductName, ProductPrice, ProductQuantity) VALUES (@ProductName, @ProductPrice, @ProductQuantity);"

        Dim cmd As New System.Data.SqlClient.SqlCommand
        cmd.CommandType = System.Data.CommandType.Text
        cmd.CommandText = sql
        cmd.Connection = sqlConnection1

        sqlConnection1.Open()

        cmd.Parameters.AddWithValue("@ProductName", orderProductName)
        cmd.Parameters.AddWithValue("@ProductPrice", orderPrice)
        cmd.Parameters.AddWithValue("@ProductQuantity", orderProductQuantity)

        Try
            n = cmd.ExecuteNonQuery()
        Catch ex As SqlException
            
        End Try

        If n > 0 Then
            
        End If


        cmd.Connection.Close()

















        Session.Clear()


    End Sub

End Class
