Partial Class GF_qapReviewerAttachments
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/QAP_Main/App_Display/DF_qapReviewerAttachments.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?RequestNo=" & aVal(0) & "&SerialNo=" & aVal(1)
    Response.Redirect(RedirectUrl)
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
  Protected Sub GVqapReviewerAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVqapReviewerAttachments.Init
    DataClassName = "GqapReviewerAttachments"
    SetGridView = GVqapReviewerAttachments
  End Sub
  Protected Sub TBLqapReviewerAttachments_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLqapReviewerAttachments.Init
    SetToolBar = TBLqapReviewerAttachments
  End Sub
  Protected Sub F_RequestNo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles F_RequestNo.TextChanged
    Session("F_RequestNo") = F_RequestNo.Text
    Session("F_RequestNo_Display") = F_RequestNo_Display.Text
    InitGridPage()
  End Sub
	<System.Web.Services.WebMethod()> _
	<System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function RequestNoCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.QAP.qapRequests.SelectqapRequestsAutoCompleteList(prefixText, count, contextKey)
  End Function
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
    F_RequestNo_Display.Text = String.Empty
    If Not Session("F_RequestNo_Display") Is Nothing Then
      If Session("F_RequestNo_Display") <> String.Empty Then
        F_RequestNo_Display.Text = Session("F_RequestNo_Display")
      End If
    End If
    F_RequestNo.Text = String.Empty
    If Not Session("F_RequestNo") Is Nothing Then
      If Session("F_RequestNo") <> String.Empty Then
        F_RequestNo.Text = Session("F_RequestNo")
      End If
    End If
		Dim strScriptRequestNo As String = "<script type=""text/javascript""> " & _
			"function ACERequestNo_Selected(sender, e) {" & _
			"  var F_RequestNo = $get('" & F_RequestNo.ClientID & "');" & _
			"  var F_RequestNo_Display = $get('" & F_RequestNo_Display.ClientID & "');" & _
			"  var retval = e.get_value();" & _
			"  var p = retval.split('|');" & _
			"  F_RequestNo.value = p[0];" & _
			"  F_RequestNo_Display.innerHTML = e.get_text();" & _
			"}" & _
			"</script>"
			If Not Page.ClientScript.IsClientScriptBlockRegistered("F_RequestNo") Then
				Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "F_RequestNo", strScriptRequestNo)
			End If
		Dim strScriptPopulatingRequestNo As String = "<script type=""text/javascript""> " & _
			"function ACERequestNo_Populating(o,e) {" & _
			"  var p = $get('" & F_RequestNo.ClientID & "');" & _
			"  p.style.backgroundImage  = 'url(../../images/loader.gif)';" & _
			"  p.style.backgroundRepeat= 'no-repeat';" & _
			"  p.style.backgroundPosition = 'right';" & _
			"  o._contextKey = '';" & _
			"}" & _
			"function ACERequestNo_Populated(o,e) {" & _
			"  var p = $get('" & F_RequestNo.ClientID & "');" & _
			"  p.style.backgroundImage  = 'none';" & _
			"}" & _
			"</script>"
			If Not Page.ClientScript.IsClientScriptBlockRegistered("F_RequestNoPopulating") Then
				Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "F_RequestNoPopulating", strScriptPopulatingRequestNo)
			End If
		Dim validateScriptRequestNo As String = "<script type=""text/javascript"">" & _
			"  function validate_RequestNo(o) {" & _
			"    validated_FK_QAP_Attachments_RequestNo_main = true;" & _
			"    validate_FK_QAP_Attachments_RequestNo(o);" & _
			"  }" & _
		  "</script>"
		If Not Page.ClientScript.IsClientScriptBlockRegistered("validateRequestNo") Then
			Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateRequestNo", validateScriptRequestNo)
		End If
		Dim validateScriptFK_QAP_Attachments_RequestNo As String = "<script type=""text/javascript"">" & _
			"  function validate_FK_QAP_Attachments_RequestNo(o) {" & _
			"    var value = o.id;" & _
			"    var RequestNo = $get('" & F_RequestNo.ClientID & "');" & _
			"    try{" & _
			"    if(RequestNo.value==''){" & _
			"      if(validated_FK_QAP_Attachments_RequestNo.main){" & _
			"        var o_d = $get(o.id +'_Display');" & _
			"        try{o_d.innerHTML = '';}catch(ex){}" & _
			"      }" & _
			"    }" & _
			"    value = value + ',' + RequestNo.value ;" & _
			"    }catch(ex){}" & _
			"    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';" & _
			"    o.style.backgroundRepeat= 'no-repeat';" & _
			"    o.style.backgroundPosition = 'right';" & _
			"    PageMethods.validate_FK_QAP_Attachments_RequestNo(value, validated_FK_QAP_Attachments_RequestNo);" & _
			"  }" & _
			"  validated_FK_QAP_Attachments_RequestNo_main = false;" & _
			"  function validated_FK_QAP_Attachments_RequestNo(result) {" & _
			"    var p = result.split('|');" & _
			"    var o = $get(p[1]);" & _
			"    var o_d = $get(p[1]+'_Display');" & _
			"    try{o_d.innerHTML = p[2];}catch(ex){}" & _
			"    o.style.backgroundImage  = 'none';" & _
			"    if(p[0]=='1'){" & _
			"      o.value='';" & _
			"      try{o_d.innerHTML = '';}catch(ex){}" & _
			"      __doPostBack(o.id, o.value);" & _
			"    }" & _
			"    else" & _
			"      __doPostBack(o.id, o.value);" & _
			"  }" & _
		  "</script>"
		If Not Page.ClientScript.IsClientScriptBlockRegistered("validateFK_QAP_Attachments_RequestNo") Then
			Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateFK_QAP_Attachments_RequestNo", validateScriptFK_QAP_Attachments_RequestNo)
		End If
  End Sub
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
