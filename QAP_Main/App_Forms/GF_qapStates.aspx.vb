Partial Class GF_qapStates
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/QAP_Main/App_Display/DF_qapStates.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?StatusID=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVqapStates_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapStates.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim StatusID As Int32 = GVqapStates.DataKeys(e.CommandArgument).Values("StatusID")  
				Dim RedirectUrl As String = TBLqapStates.EditUrl & "?StatusID=" & StatusID
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
  Protected Sub GVqapStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapStates.Init
    DataClassName = "GqapStates"
    SetGridView = GVqapStates
  End Sub
  Protected Sub TBLqapStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapStates.Init
    SetToolBar = TBLqapStates
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
