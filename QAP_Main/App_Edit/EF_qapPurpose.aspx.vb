Partial Class EF_qapPurpose
  Inherits SIS.SYS.UpdateBase
  Protected Sub FVqapPurpose_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapPurpose.Init
    DataClassName = "EqapPurpose"
    SetFormView = FVqapPurpose
  End Sub
  Protected Sub TBLqapPurpose_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapPurpose.Init
    SetToolBar = TBLqapPurpose
  End Sub
  Protected Sub FVqapPurpose_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapPurpose.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapPurpose.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapPurpose") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapPurpose", mStr)
    End If
  End Sub

End Class
