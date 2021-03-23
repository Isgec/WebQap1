Partial Class EF_qapRequests
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
  Protected Sub FVqapRequests_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequests.Init
    DataClassName = "EqapRequests"
    SetFormView = FVqapRequests
  End Sub
  Protected Sub TBLqapRequests_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapRequests.Init
    SetToolBar = TBLqapRequests
	End Sub
	Protected Sub FVqapRequests_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequests.PreRender
		TBLqapRequests.PrintUrl &= Request.QueryString("RequestNo") & "|"
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Edit") & "/EF_qapRequests.js")
		mStr = oTR.ReadToEnd
		oTR.Close()
		oTR.Dispose()
		If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapRequests") Then
			Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapRequests", mStr)
		End If
		TBLqapRequests.EnableSave = Editable
		TBLqapRequests.EnableDelete = Editable
		Dim oF_DocumentTypeID As LC_qapDocumentTypes = FVqapRequests.FindControl("F_DocumentTypeID")
		If oF_DocumentTypeID.SelectedValue <> "1" Then
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
		If oF_DocumentTypeID.SelectedValue = "2" Or oF_DocumentTypeID.SelectedValue = "4" Then
			For Each vl As BaseValidator In Page.Validators
				If vl.ID = "RFVProjectID" Then
					vl.Enabled = False
				End If
			Next
		Else
			For Each vl As BaseValidator In Page.Validators
				If vl.ID = "RFVProjectID" Then
					vl.Enabled = True
				End If
			Next
		End If
	End Sub
	Protected Sub cmdFileUpload_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles cmdFileUpload.Command
		With F_FileUpload
			If .HasFile Then
				Dim tmpPath As String = ConfigurationManager.AppSettings("QAPAttachmentPath")
				If Not IO.Directory.Exists(tmpPath) Then
					tmpPath = ConfigurationManager.AppSettings("QAPAttachmentPath1")
				End If
				Dim tmpName As String = IO.Path.GetRandomFileName()
				.SaveAs(tmpPath & "\\" & tmpName)
				Dim RequestNo As Int32 = CType(FVqapRequests.FindControl("F_RequestNo"), TextBox).Text
				Dim oReq As SIS.QAP.qapAttachments = New SIS.QAP.qapAttachments
				oReq.RequestNo = RequestNo
				oReq.Description = .FileName
        oReq.FileName = String.Concat(.FileName.Split(IO.Path.GetInvalidFileNameChars()))
        oReq.DiskFile = tmpPath & "\" & tmpName
				oReq.StatusID = 1
				SIS.QAP.qapAttachments.InsertData(oReq)
				GVqapAttachments.DataBind()
			End If
		End With
	End Sub
	Partial Class gvBase
		Inherits SIS.SYS.GridBase
	End Class
  Private WithEvents gvqapAttachmentsCC As New gvBase
  Protected Sub GVqapAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapAttachments.Init
		gvqapAttachmentsCC.DataClassName = "GqapAttachments"
		gvqapAttachmentsCC.SetGridView = GVqapAttachments
  End Sub
  Protected Sub TBLqapAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapAttachments.Init
		gvqapAttachmentsCC.SetToolBar = TBLqapAttachments
  End Sub
  Protected Sub GVqapAttachments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVqapAttachments.RowCommand
		If e.CommandName.ToLower = "lgedit".ToLower Then
			Try
				Dim RequestNo As Int32 = GVqapAttachments.DataKeys(e.CommandArgument).Values("RequestNo")  
				Dim SerialNo As Int32 = GVqapAttachments.DataKeys(e.CommandArgument).Values("SerialNo")  
				Dim RedirectUrl As String = TBLqapAttachments.EditUrl & "?RequestNo=" & RequestNo & "&SerialNo=" & SerialNo
				Response.Redirect(RedirectUrl)
			Catch ex As Exception
			End Try
		End If
  End Sub
  Protected Sub TBLqapAttachments_AddClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles TBLqapAttachments.AddClicked
		Dim RequestNo As Int32 = CType(FVqapRequests.FindControl("F_RequestNo"),TextBox).Text
		TBLqapAttachments.AddUrl &= "?RequestNo=" & RequestNo
  End Sub
	<System.Web.Services.WebMethod()> _
	<System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function ProjectIDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QCM.qcmProjects.SelectqcmProjectsAutoCompleteList(prefixText, count, contextKey)
  End Function
	<System.Web.Services.WebMethod()> _
	<System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function SupplierIDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QCM.qcmVendors.SelectqcmVendorsAutoCompleteList(prefixText, count, contextKey)
  End Function
  <System.Web.Services.WebMethod()>
  Public Shared Function validate_FK_QAP_Requests_ProjectID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String = "0|" & aVal(0)
    Dim ProjectID As String = CType(aVal(1), String).ToUpper
    Dim oVar As SIS.QCM.qcmProjects = SIS.QCM.qcmProjects.qcmProjectsGetByID(ProjectID)
    If oVar Is Nothing Then
      oVar = SIS.QCM.qcmProjects.GetProjectFromERP(ProjectID)
      If oVar Is Nothing Then
        mRet = "1|" & aVal(0) & "|Record not found IN ERP."
      Else
        mRet = "0|" & aVal(0) & "|" & oVar.DisplayField
      End If
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField
    End If
    Return mRet
  End Function
  <System.Web.Services.WebMethod()>
  Public Shared Function validate_FK_QAP_Requests_SupplierID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String = "0|" & aVal(0)
    Dim SupplierID As String = CType(aVal(1), String)
    Dim oVar As SIS.QCM.qcmVendors = SIS.QCM.qcmVendors.qcmVendorsGetByID(SupplierID)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found."
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField
    End If
    Return mRet
  End Function
  Protected Sub ODSqapRequests_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapRequests.Selected
		Dim oReq As SIS.QAP.qapRequests = CType(e.ReturnValue, SIS.QAP.qapRequests)
		Editable = True
		Select Case oReq.StatusID
			Case States.UnderReview, States.UnderApproval, States.Approved
				Editable = False
		End Select
	End Sub
	Public Overrides Sub Validate()
		Dim oF_DocumentTypeID As LC_qapDocumentTypes = FVqapRequests.FindControl("F_DocumentTypeID")
		If oF_DocumentTypeID.SelectedValue <> "1" Then
			For Each vl As BaseValidator In Page.Validators
				If vl.ID = "RFVQAPNo" Or vl.ID = "RFVQAPRevisionNo" Or vl.ID = "RFVSupplierID" Then
					vl.IsValid = True
					vl.Enabled = False
				End If
			Next
		End If
		MyBase.Validate()
	End Sub
	<System.Web.Services.WebMethod(EnableSession:=True)> _
 Public Shared Function GetQAPData(ByVal Context As String) As String
		Dim aVal() As String = Context.Split("|".ToCharArray)
		Dim DocumentType As String = aVal(0)
		Dim ProjectID As String = aVal(1)
		Dim SupplierID As String = aVal(2)
		Return LC_qapList.GetqapData(DocumentType, ProjectID, SupplierID)
	End Function
End Class
