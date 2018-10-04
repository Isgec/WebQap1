Partial Class AF_qapAttachments
  Inherits SIS.SYS.InsertBase
  Protected Sub FVqapAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachments.Init
    DataClassName = "AqapAttachments"
    SetFormView = FVqapAttachments
  End Sub
  Protected Sub TBLqapAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapAttachments.Init
    SetToolBar = TBLqapAttachments
  End Sub
  Protected Sub FVqapAttachments_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVqapAttachments.PreRender
    Dim oF_RequestNo_Display As Label  = FVqapAttachments.FindControl("F_RequestNo_Display")
    oF_RequestNo_Display.Text = String.Empty
    If Not Session("F_RequestNo_Display") Is Nothing Then
      If Session("F_RequestNo_Display") <> String.Empty Then
        oF_RequestNo_Display.Text = Session("F_RequestNo_Display")
      End If
    End If
    Dim oF_RequestNo As TextBox  = FVqapAttachments.FindControl("F_RequestNo")
    oF_RequestNo.Enabled = True
    oF_RequestNo.Text = String.Empty
    If Not Session("F_RequestNo") Is Nothing Then
      If Session("F_RequestNo") <> String.Empty Then
        oF_RequestNo.Text = Session("F_RequestNo")
      End If
    End If
    Dim oF_StatusID_Display As Label  = FVqapAttachments.FindControl("F_StatusID_Display")
    Dim oF_StatusID As TextBox  = FVqapAttachments.FindControl("F_StatusID")
		Dim mStr As String = ""
		Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/QAP_Main/App_Create") & "/AF_qapAttachments.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptqapAttachments") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptqapAttachments", mStr)
    End If
    If Request.QueryString("RequestNo") IsNot Nothing Then
      CType(FVqapAttachments.FindControl("F_RequestNo"), TextBox).Text = Request.QueryString("RequestNo")
      CType(FVqapAttachments.FindControl("F_RequestNo"), TextBox).Enabled = False
    End If
    If Request.QueryString("SerialNo") IsNot Nothing Then
      CType(FVqapAttachments.FindControl("F_SerialNo"), TextBox).Text = Request.QueryString("SerialNo")
      CType(FVqapAttachments.FindControl("F_SerialNo"), TextBox).Enabled = False
    End If
  End Sub
	<System.Web.Services.WebMethod()> _
	<System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function RequestNoCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QAP.qapRequests.SelectqapRequestsAutoCompleteList(prefixText, count, contextKey)
  End Function
	<System.Web.Services.WebMethod()> _
	<System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function StatusIDCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QAP.qapAttachmentStates.SelectqapAttachmentStatesAutoCompleteList(prefixText, count, contextKey)
  End Function
	<System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_QAP_Attachments_StatusID(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
		Dim StatusID As Int32 = CType(aVal(1),Int32)
		Dim oVar As SIS.QAP.qapAttachmentStates = SIS.QAP.qapAttachmentStates.qapAttachmentStatesGetByID(StatusID)
    If oVar Is Nothing Then
			mRet = "1|" & aVal(0) & "|Record not found." 
    Else
			mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
	<System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_QAP_Attachments_RequestNo(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
		Dim RequestNo As Int32 = CType(aVal(1),Int32)
		Dim oVar As SIS.QAP.qapRequests = SIS.QAP.qapRequests.qapRequestsGetByID(RequestNo)
    If oVar Is Nothing Then
			mRet = "1|" & aVal(0) & "|Record not found." 
    Else
			mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function

End Class
