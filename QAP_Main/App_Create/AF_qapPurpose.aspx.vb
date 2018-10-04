Partial Class AF_qapPurpose
  Inherits SIS.SYS.InsertBase
  Protected Sub FVqapPurpose_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapPurpose.Init
    DataClassName = "AqapPurpose"
    SetFormView = FVqapPurpose
  End Sub
  Protected Sub TBLqapPurpose_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapPurpose.Init
    SetToolBar = TBLqapPurpose
  End Sub
  Protected Sub FVqapPurpose_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapPurpose.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Create") & "/AF_qapPurpose.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapPurpose") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapPurpose", mStr)
    End If
    If Request.QueryString("PurposeID") IsNot Nothing Then
      CType(FVqapPurpose.FindControl("F_PurposeID"), TextBox).Text = Request.QueryString("PurposeID")
      CType(FVqapPurpose.FindControl("F_PurposeID"), TextBox).Enabled = False
    End If
  End Sub

End Class
