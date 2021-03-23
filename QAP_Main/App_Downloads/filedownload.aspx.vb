
Partial Class filedownload
    Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim docPK As String = ""
		Dim filePK As String = ""
		Dim val() As String
		Try
			val = Request.QueryString("req").Split("|".ToCharArray)
			docPK = val(0)
			filePK = val(1)
		Catch ex As Exception
			docPK = ""
			filePK = ""
		End Try
		Try
			Dim oFl As SIS.QAP.qapAttachments = SIS.QAP.qapAttachments.qapAttachmentsGetByID(docPK, filePK)
			If IO.File.Exists(oFl.DiskFile) Then
				Response.Clear()
        Response.AppendHeader("content-disposition", "attachment; filename=" & String.Concat(oFl.FileName.Split(IO.Path.GetInvalidFileNameChars())))
        Response.ContentType = SIS.SYS.Utilities.ApplicationSpacific.ContentType(oFl.FileName)
				Response.WriteFile(oFl.DiskFile)
				Response.End()
			End If
		Catch ex As Exception
		End Try
	End Sub
End Class
