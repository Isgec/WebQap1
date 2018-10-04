Partial Class EF_qapReviewerAttachments
  Inherits SIS.SYS.UpdateBase
  Protected Sub FVqapReviewerAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapReviewerAttachments.Init
    DataClassName = "EqapReviewerAttachments"
    SetFormView = FVqapReviewerAttachments
  End Sub
  Protected Sub TBLqapReviewerAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapReviewerAttachments.Init
    SetToolBar = TBLqapReviewerAttachments
  End Sub
  Protected Sub FVqapReviewerAttachments_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapReviewerAttachments.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapReviewerAttachments.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapReviewerAttachments") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapReviewerAttachments", mStr)
		End If
		TBLqapReviewerAttachments.EnableDelete = Editable
		TBLqapReviewerAttachments.EnableSave = Editable
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
	Protected Sub ODSqapReviewerAttachments_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapReviewerAttachments.Selected
		Dim tmp As SIS.QAP.qapReviewerAttachments = CType(e.ReturnValue, SIS.QAP.qapReviewerAttachments)
		Editable = True
		If tmp.StatusID <> 2 Then
			Editable = False
		End If
	End Sub
End Class
