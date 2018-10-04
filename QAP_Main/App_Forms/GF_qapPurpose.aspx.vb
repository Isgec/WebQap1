Partial Class GF_qapPurpose
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/QAP_Main/App_Display/DF_qapPurpose.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?PurposeID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVqapPurpose_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapPurpose.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim PurposeID As Int32 = GVqapPurpose.DataKeys(e.CommandArgument).Values("PurposeID")  
				Dim RedirectUrl As String = TBLqapPurpose.EditUrl & "?PurposeID=" & PurposeID
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
  Protected Sub GVqapPurpose_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapPurpose.Init
    DataClassName = "GqapPurpose"
    SetGridView = GVqapPurpose
  End Sub
  Protected Sub TBLqapPurpose_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapPurpose.Init
    SetToolBar = TBLqapPurpose
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
