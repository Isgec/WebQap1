Partial Class EF_qapAttachmentStates
  Inherits SIS.SYS.UpdateBase
  Protected Sub FVqapAttachmentStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachmentStates.Init
    DataClassName = "EqapAttachmentStates"
    SetFormView = FVqapAttachmentStates
  End Sub
  Protected Sub TBLqapAttachmentStates_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapAttachmentStates.Init
    SetToolBar = TBLqapAttachmentStates
  End Sub
  Protected Sub FVqapAttachmentStates_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachmentStates.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapAttachmentStates.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapAttachmentStates") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapAttachmentStates", mStr)
    End If
  End Sub

End Class
