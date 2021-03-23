Partial Class EF_qapRequestsReview
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
				Dim RequestNo As Int32 = CType(FVqapRequestsReview.FindControl("F_RequestNo"), TextBox).Text
				Dim oReq As SIS.QAP.qapAttachments = New SIS.QAP.qapAttachments
				oReq.RequestNo = RequestNo
				oReq.Description = .FileName
        oReq.FileName = String.Concat(.FileName.Split(IO.Path.GetInvalidFileNameChars()))
        oReq.DiskFile = tmpPath & "\" & tmpName
				oReq.StatusID = 2
				SIS.QAP.qapAttachments.InsertData(oReq)
				'Revert Status=1 to Superseeded
				Dim oAtchs As List(Of SIS.QAP.qapAttachments) = SIS.QAP.qapAttachments.qapAttachmentsSelectList(0, 999, "", False, "", RequestNo)
				For Each ath As SIS.QAP.qapAttachments In oAtchs
					If ath.StatusID < 2 Then
						ath.StatusID = 4
						SIS.QAP.qapAttachments.UpdateData(ath)
					End If
				Next
				'=====
				GVqapReviewerAttachments.DataBind()
			End If
		End With
	End Sub
	Protected Sub FVqapRequestsReview_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequestsReview.Init
		DataClassName = "EqapRequestsReview"
		SetFormView = FVqapRequestsReview
	End Sub
  Protected Sub TBLqapRequestsReview_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapRequestsReview.Init
    SetToolBar = TBLqapRequestsReview
  End Sub
  Protected Sub FVqapRequestsReview_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequestsReview.PreRender
		TBLqapRequestsReview.PrintUrl &= Request.QueryString("RequestNo") & "|"
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapRequestsReview.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapRequestsReview") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapRequestsReview", mStr)
		End If
		TBLqapRequestsReview.EnableDelete = False
		Dim oF_DocumentTypeID As TextBox = FVqapRequestsReview.FindControl("F_DocumentTypeID")
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
  Private WithEvents gvqapReviewerAttachmentsCC As New gvBase
  Protected Sub GVqapReviewerAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapReviewerAttachments.Init
		gvqapReviewerAttachmentsCC.DataClassName = "GqapReviewerAttachments"
		gvqapReviewerAttachmentsCC.SetGridView = GVqapReviewerAttachments
  End Sub
  Protected Sub TBLqapReviewerAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapReviewerAttachments.Init
		gvqapReviewerAttachmentsCC.SetToolBar = TBLqapReviewerAttachments
  End Sub
  Protected Sub GVqapReviewerAttachments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapReviewerAttachments.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim RequestNo As Int32 = GVqapReviewerAttachments.DataKeys(e.CommandArgument).Values("RequestNo")  
				Dim SerialNo As Int32 = GVqapReviewerAttachments.DataKeys(e.CommandArgument).Values("SerialNo")  
				Dim RedirectUrl As String = TBLqapReviewerAttachments.EditUrl & "?RequestNo=" & RequestNo & "&SerialNo=" & SerialNo
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
  Protected Sub TBLqapReviewerAttachments_AddClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles TBLqapReviewerAttachments.AddClicked
		Dim RequestNo As Int32 = CType(FVqapRequestsReview.FindControl("F_RequestNo"),TextBox).Text
		TBLqapReviewerAttachments.AddUrl &= "?RequestNo=" & RequestNo
  End Sub

	Protected Sub ODSqapRequestsReview_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapRequestsReview.Selected
		Editable = True
	End Sub
End Class
