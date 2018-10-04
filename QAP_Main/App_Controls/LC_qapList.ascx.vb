
Partial Class LC_qapList
	Inherits System.Web.UI.UserControl

	Public Shared Function GetQAPData(ByVal DocumentType As String, ByVal ProjectID As String, ByVal SupplierID As String) As String

		Dim sn As Integer = 0
		Dim pagelength As Integer = 30


		Dim dbPage As Integer = 0
		Dim dbSize As Integer = 10
		Dim dbOrder As String = "Sequence"

		Dim tblTask As New HtmlTable
		Dim row As HtmlTableRow = Nothing
		Dim col As HtmlTableCell = Nothing
		Dim chk As HtmlInputCheckBox = Nothing
		Dim lbl As Label = Nothing
		Dim ColTot As Integer = 0


		tblTask.Border = 1
		'CLP Header
		row = New HtmlTableRow
		row.Style("color") = "black"
		row.Style("font-weight") = "bold"
		row.Style("background-color") = "orchid"

		col = New HtmlTableCell
		col.InnerText = "REQUEST NO"
		col.Style("width") = "80px"
		row.Cells.Add(col)

		col = New HtmlTableCell
		col.InnerText = "QAP No"
		col.Style("width") = "360px"
		row.Cells.Add(col)

		col = New HtmlTableCell
		col.InnerText = "QAP Rev."
		col.Style("width") = "70px"
		row.Cells.Add(col)
		ColTot += 1

		col = New HtmlTableCell
		col.InnerText = "MAIN ITEM"
		col.Style("width") = "200px"
		row.Cells.Add(col)
		ColTot += 1

		col = New HtmlTableCell
		col.InnerText = "SUB ITEM"
		col.Style("width") = "250px"
		row.Cells.Add(col)
		ColTot += 1

		col = New HtmlTableCell
		col.InnerText = "STATUS"
		col.Style("width") = "150px"
		row.Cells.Add(col)
		ColTot += 1
		tblTask.Rows.Add(row)

		'End of Header
		Dim Qaps As List(Of SIS.QAP.qapRequests) = SIS.QAP.qapRequests.qapList(DocumentType, ProjectID, SupplierID)

		For Each qap As SIS.QAP.qapRequests In Qaps
			Try

				row = New HtmlTableRow

				col = New HtmlTableCell
				col.InnerText = qap.RequestNo
				col.BgColor = "LightPink"
				row.Cells.Add(col)

				col = New HtmlTableCell
				col.InnerText = qap.QAPNo
				col.BgColor = "LightPink"
				row.Cells.Add(col)

				col = New HtmlTableCell
				col.InnerText = qap.QAPRevisionNo
				col.BgColor = "LightPink"
				row.Cells.Add(col)

				col = New HtmlTableCell
				col.InnerText = qap.MainItem
				col.BgColor = "LightPink"
				row.Cells.Add(col)

				col = New HtmlTableCell
				col.InnerText = qap.SubItem
				col.BgColor = "LightPink"
				row.Cells.Add(col)

				col = New HtmlTableCell
				col.InnerText = qap.FK_QAP_Requests_StatusID.QAPStatus
				col.BgColor = "LightPink"
				row.Cells.Add(col)

				tblTask.Rows.Add(row)

			Catch ex As Exception
				Print(ex.Message)
			End Try
		Next
		Dim sb As StringBuilder = New StringBuilder()
		Dim sw As IO.StringWriter = New IO.StringWriter(sb)
		Dim writer As HtmlTextWriter = New HtmlTextWriter(sw)
		Try
			tblTask.RenderControl(writer)
		Catch ex As Exception

		End Try
		Return "|" & sb.ToString
	End Function
End Class
