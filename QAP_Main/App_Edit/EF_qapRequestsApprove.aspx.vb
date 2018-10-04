Partial Class EF_qapRequestsApprove
  Inherits SIS.SYS.UpdateBase
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
	Protected Sub cmdFileUpload_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles cmdFileUpload.Command
		With F_FileUpload
			If .HasFile Then
				Dim tmpPath As String = ConfigurationManager.AppSettings("QAPAttachmentPath")
				If Not IO.Directory.Exists(tmpPath) Then
					tmpPath = ConfigurationManager.AppSettings("QAPAttachmentPath1")
				End If
				Dim tmpName As String = IO.Path.GetRandomFileName()
				.SaveAs(tmpPath & "\\" & tmpName)
				Dim RequestNo As Int32 = CType(FVqapRequestsApprove.FindControl("F_RequestNo"), TextBox).Text
				Dim oReq As SIS.QAP.qapAttachments = New SIS.QAP.qapAttachments
				oReq.RequestNo = RequestNo
				oReq.Description = .FileName
				oReq.FileName = .FileName
				oReq.DiskFile = tmpPath & "\" & tmpName
				oReq.StatusID = 3
				SIS.QAP.qapAttachments.InsertData(oReq)
				'Revert Status=1 to Superseeded
				Dim oAtchs As List(Of SIS.QAP.qapAttachments) = SIS.QAP.qapAttachments.qapAttachmentsSelectList(0, 999, "", False, "", RequestNo)
				For Each ath As SIS.QAP.qapAttachments In oAtchs
					If ath.StatusID < 3 Then
						ath.StatusID = 4
						SIS.QAP.qapAttachments.UpdateData(ath)
					End If
				Next
				'=====
				GVqapApproverAttachments.DataBind()
			End If
		End With
	End Sub
	Protected Sub FVqapRequestsApprove_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequestsApprove.Init
		DataClassName = "EqapRequestsApprove"
		SetFormView = FVqapRequestsApprove
	End Sub
  Protected Sub TBLqapRequestsApprove_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapRequestsApprove.Init
    SetToolBar = TBLqapRequestsApprove
  End Sub
  Protected Sub FVqapRequestsApprove_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequestsApprove.PreRender
		TBLqapRequestsApprove.PrintUrl &= Request.QueryString("RequestNo") & "|"
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapRequestsApprove.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapRequestsApprove") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapRequestsApprove", mStr)
    End If
		TBLqapRequestsApprove.EnableDelete = False
		Dim oF_DocumentTypeID As TextBox = FVqapRequestsApprove.FindControl("F_DocumentTypeID")
		If oF_DocumentTypeID.Text <> "1" Then
			For Each vl As BaseValidator In Page.Validators
				If vl.ID = "RFVQAPNo" Or vl.ID = "RFVQAPRevisionNo" Or vl.ID = "RFVSupplierID" Then
					vl.Enabled = False
				End If
			Next
		Else
			For Each vl As BaseValidator In Page.Validators
				If vl.ID = "RFVQAPNo" Or vl.ID = "RFVQAPRevisionNo" Or vl.ID = "RFVSupplierID" Then
					vl.Enabled = True
				End If
			Next
		End If
	End Sub
  Partial Class gvBase
		Inherits SIS.SYS.GridBase
  End Class
  Private WithEvents gvqapApproverAttachmentsCC As New gvBase
  Protected Sub GVqapApproverAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapApproverAttachments.Init
		gvqapApproverAttachmentsCC.DataClassName = "GqapApproverAttachments"
		gvqapApproverAttachmentsCC.SetGridView = GVqapApproverAttachments
  End Sub
  Protected Sub TBLqapApproverAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapApproverAttachments.Init
		gvqapApproverAttachmentsCC.SetToolBar = TBLqapApproverAttachments
  End Sub
  Protected Sub GVqapApproverAttachments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapApproverAttachments.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim RequestNo As Int32 = GVqapApproverAttachments.DataKeys(e.CommandArgument).Values("RequestNo")  
				Dim SerialNo As Int32 = GVqapApproverAttachments.DataKeys(e.CommandArgument).Values("SerialNo")  
				Dim RedirectUrl As String = TBLqapApproverAttachments.EditUrl & "?RequestNo=" & RequestNo & "&SerialNo=" & SerialNo
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
	Protected Sub ODSqapRequestsApprove_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapRequestsApprove.Selected
		Editable = True
	End Sub
End Class
