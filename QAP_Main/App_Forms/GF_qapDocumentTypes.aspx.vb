Partial Class GF_qapDocumentTypes
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/QAP_Main/App_Display/DF_qapDocumentTypes.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?DocumentTypeID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVqapDocumentTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapDocumentTypes.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim DocumentTypeID As Int32 = GVqapDocumentTypes.DataKeys(e.CommandArgument).Values("DocumentTypeID")  
				Dim RedirectUrl As String = TBLqapDocumentTypes.EditUrl & "?DocumentTypeID=" & DocumentTypeID
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
  Protected Sub GVqapDocumentTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapDocumentTypes.Init
    DataClassName = "GqapDocumentTypes"
    SetGridView = GVqapDocumentTypes
  End Sub
  Protected Sub TBLqapDocumentTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapDocumentTypes.Init
    SetToolBar = TBLqapDocumentTypes
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
