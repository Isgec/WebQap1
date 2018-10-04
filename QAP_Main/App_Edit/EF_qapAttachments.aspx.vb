Partial Class EF_qapAttachments
  Inherits SIS.SYS.UpdateBase
  Protected Sub FVqapAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachments.Init
    DataClassName = "EqapAttachments"
    SetFormView = FVqapAttachments
  End Sub
  Protected Sub TBLqapAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapAttachments.Init
    SetToolBar = TBLqapAttachments
  End Sub
  Protected Sub FVqapAttachments_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachments.PreRender
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapAttachments.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapAttachments") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapAttachments", mStr)
		End If
		TBLqapAttachments.EnableSave = Editable
		TBLqapAttachments.EnableDelete = Editable
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
	Protected Sub ODSqapAttachments_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapAttachments.Selected
		Dim tmp As SIS.QAP.qapAttachments = CType(e.ReturnValue, SIS.QAP.qapAttachments)
		Editable = True
		Select Case tmp.FK_QAP_Attachments_RequestNo.StatusID
			Case States.UnderReview, States.UnderApproval, States.Approved
				Editable = False
		End Select
	End Sub
End Class
