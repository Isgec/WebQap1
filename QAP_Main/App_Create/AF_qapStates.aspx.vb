Partial Class AF_qapStates
  Inherits SIS.SYS.InsertBase
  Protected Sub FVqapStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapStates.Init
    DataClassName = "AqapStates"
    SetFormView = FVqapStates
  End Sub
  Protected Sub TBLqapStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapStates.Init
    SetToolBar = TBLqapStates
  End Sub
  Protected Sub FVqapStates_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapStates.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Create") & "/AF_qapStates.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapStates") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapStates", mStr)
    End If
    If Request.QueryString("StatusID") IsNot Nothing Then
      CType(FVqapStates.FindControl("F_StatusID"), TextBox).Text = Request.QueryString("StatusID")
      CType(FVqapStates.FindControl("F_StatusID"), TextBox).Enabled = False
    End If
  End Sub

End Class
