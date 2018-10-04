Partial Class EF_qapApproverAttachments
  Inherits SIS.SYS.UpdateBase
  Protected Sub FVqapApproverAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapApproverAttachments.Init
    DataClassName = "EqapApproverAttachments"
    SetFormView = FVqapApproverAttachments
  End Sub
  Protected Sub TBLqapApproverAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapApproverAttachments.Init
    SetToolBar = TBLqapApproverAttachments
  End Sub
  Protected Sub FVqapApproverAttachments_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapApproverAttachments.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapApproverAttachments.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapApproverAttachments") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapApproverAttachments", mStr)
		End If
		TBLqapApproverAttachments.EnableDelete = Editable
		TBLqapApproverAttachments.EnableSave = Editable
  End Sub
	Public Property Editable() As Boolean
		Get
			If ViewState("Editable") IsNot Nothing Then
				Return ViewState("Editable")
			Else
				Return False
			End If
		End Get
		Set(ByVal value As Boolean)
			ViewState("Editable") = value
		End Set
	End Property
	Protected Sub ODSqapApproverAttachments_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapApproverAttachments.Selected
		Dim tmp As SIS.QAP.qapApproverAttachments = CType(e.ReturnValue, SIS.QAP.qapApproverAttachments)
		Editable = True
		If tmp.StatusID <> 3 Then
			Editable = False
		End If
	End Sub
End Class
