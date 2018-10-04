Partial Class AF_qapAttachmentStates
  Inherits SIS.SYS.InsertBase
  Protected Sub FVqapAttachmentStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachmentStates.Init
    DataClassName = "AqapAttachmentStates"
    SetFormView = FVqapAttachmentStates
  End Sub
  Protected Sub TBLqapAttachmentStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapAttachmentStates.Init
    SetToolBar = TBLqapAttachmentStates
  End Sub
  Protected Sub FVqapAttachmentStates_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachmentStates.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Create") & "/AF_qapAttachmentStates.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapAttachmentStates") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapAttachmentStates", mStr)
    End If
    If Request.QueryString("StatusID") IsNot Nothing Then
      CType(FVqapAttachmentStates.FindControl("F_StatusID"), TextBox).Text = Request.QueryString("StatusID")
      CType(FVqapAttachmentStates.FindControl("F_StatusID"), TextBox).Enabled = False
    End If
  End Sub

End Class
