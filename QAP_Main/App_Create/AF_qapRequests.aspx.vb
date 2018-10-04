Partial Class AF_qapRequests
  Inherits SIS.SYS.InsertBase
  Protected Sub FVqapRequests_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequests.Init
    DataClassName = "AqapRequests"
    SetFormView = FVqapRequests
  End Sub
  Protected Sub TBLqapRequests_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapRequests.Init
    SetToolBar = TBLqapRequests
  End Sub
  Protected Sub ODSqapRequests_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSqapRequests.Inserted
		If e.Exception Is Nothing Then
			Dim oDC As SIS.QAP.qapRequests = CType(e.ReturnValue,SIS.QAP.qapRequests)
			Dim tmpURL As String = "?tmp=1"
			tmpURL &= "&RequestNo=" & oDC.RequestNo
			TBLqapRequests.AfterInsertURL &= tmpURL 
		End If
  End Sub
  Protected Sub FVqapRequests_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapRequests.PreRender
    Dim oF_DocumentTypeID As LC_qapDocumentTypes = FVqapRequests.FindControl("F_DocumentTypeID")
    oF_DocumentTypeID.Enabled = True
		'oF_DocumentTypeID.SelectedValue = String.Empty
    If Not Session("F_DocumentTypeID") Is Nothing Then
      If Session("F_DocumentTypeID") <> String.Empty Then
        oF_DocumentTypeID.SelectedValue = Session("F_DocumentTypeID")
      End If
    End If
    Dim oF_ProjectID_Display As Label  = FVqapRequests.FindControl("F_ProjectID_Display")
    oF_ProjectID_Display.Text = String.Empty
    If Not Session("F_ProjectID_Display") Is Nothing Then
      If Session("F_ProjectID_Display") <> String.Empty Then
        oF_ProjectID_Display.Text = Session("F_ProjectID_Display")
      End If
    End If
    Dim oF_ProjectID As TextBox  = FVqapRequests.FindControl("F_ProjectID")
    oF_ProjectID.Enabled = True
    oF_ProjectID.Text = String.Empty
    If Not Session("F_ProjectID") Is Nothing Then
      If Session("F_ProjectID") <> String.Empty Then
        oF_ProjectID.Text = Session("F_ProjectID")
      End If
    End If
    Dim oF_SupplierID_Display As Label  = FVqapRequests.FindControl("F_SupplierID_Display")
    oF_SupplierID_Display.Text = String.Empty
    If Not Session("F_SupplierID_Display") Is Nothing Then
      If Session("F_SupplierID_Display") <> String.Empty Then
        oF_SupplierID_Display.Text = Session("F_SupplierID_Display")
      End If
    End If
    Dim oF_SupplierID As TextBox  = FVqapRequests.FindControl("F_SupplierID")
    oF_SupplierID.Enabled = True
    oF_SupplierID.Text = String.Empty
    If Not Session("F_SupplierID") Is Nothing Then
      If Session("F_SupplierID") <> String.Empty Then
        oF_SupplierID.Text = Session("F_SupplierID")
      End If
    End If
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Create") & "/AF_qapRequests.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapRequests") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapRequests", mStr)
    End If
    If Request.QueryString("RequestNo") IsNot Nothing Then
      CType(FVqapRequests.FindControl("F_RequestNo"), TextBox).Text = Request.QueryString("RequestNo")
      CType(FVqapRequests.FindControl("F_RequestNo"), TextBox).Enabled = False
    End If
		'Dim oF_DocumentTypeID As LC_qapDocumentTypes = FVqapRequests.FindControl("F_DocumentTypeID")
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
	<System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_QAP_Requests_ProjectID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
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
	<System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_QAP_Requests_SupplierID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
		Dim SupplierID As String = CType(aVal(1),String)
		Dim oVar As SIS.QCM.qcmVendors = SIS.QCM.qcmVendors.qcmVendorsGetByID(SupplierID)
    If oVar Is Nothing Then
			mRet = "1|" & aVal(0) & "|Record not found." 
    Else
			mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
	<System.Web.Services.WebMethod(EnableSession:=True)> _
 Public Shared Function GetQAPData(ByVal Context As String) As String
		Dim aVal() As String = Context.Split("|".ToCharArray)
		Dim DocumentType As String = aVal(0)
		Dim ProjectID As String = aVal(1)
		Dim SupplierID As String = aVal(2)
		Return LC_qapList.GetQAPData(DocumentType, ProjectID, SupplierID)
	End Function
End Class
