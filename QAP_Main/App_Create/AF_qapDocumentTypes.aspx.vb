Partial Class AF_qapDocumentTypes
  Inherits SIS.SYS.InsertBase
  Protected Sub FVqapDocumentTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapDocumentTypes.Init
    DataClassName = "AqapDocumentTypes"
    SetFormView = FVqapDocumentTypes
  End Sub
  Protected Sub TBLqapDocumentTypes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapDocumentTypes.Init
    SetToolBar = TBLqapDocumentTypes
  End Sub
  Protected Sub FVqapDocumentTypes_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapDocumentTypes.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Create") & "/AF_qapDocumentTypes.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapDocumentTypes") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapDocumentTypes", mStr)
    End If
    If Request.QueryString("DocumentTypeID") IsNot Nothing Then
      CType(FVqapDocumentTypes.FindControl("F_DocumentTypeID"), TextBox).Text = Request.QueryString("DocumentTypeID")
      CType(FVqapDocumentTypes.FindControl("F_DocumentTypeID"), TextBox).Enabled = False
    End If
  End Sub

End Class
