Partial Class EF_qapDocumentTypes
  Inherits SIS.SYS.UpdateBase
  Protected Sub FVqapDocumentTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapDocumentTypes.Init
    DataClassName = "EqapDocumentTypes"
    SetFormView = FVqapDocumentTypes
  End Sub
  Protected Sub TBLqapDocumentTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapDocumentTypes.Init
    SetToolBar = TBLqapDocumentTypes
  End Sub
  Protected Sub FVqapDocumentTypes_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapDocumentTypes.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapDocumentTypes.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapDocumentTypes") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapDocumentTypes", mStr)
    End If
  End Sub

End Class
