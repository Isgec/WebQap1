Partial Class GF_qapAttachmentStates
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/QAP_Main/App_Display/DF_qapAttachmentStates.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?StatusID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVqapAttachmentStates_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapAttachmentStates.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim StatusID As Int32 = GVqapAttachmentStates.DataKeys(e.CommandArgument).Values("StatusID")  
				Dim RedirectUrl As String = TBLqapAttachmentStates.EditUrl & "?StatusID=" & StatusID
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
  Protected Sub GVqapAttachmentStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapAttachmentStates.Init
    DataClassName = "GqapAttachmentStates"
    SetGridView = GVqapAttachmentStates
  End Sub
  Protected Sub TBLqapAttachmentStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapAttachmentStates.Init
    SetToolBar = TBLqapAttachmentStates
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
