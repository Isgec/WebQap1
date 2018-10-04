Partial Class RP_qapRequests
  Inherits System.Web.UI.Page
  Private _InfoUrl As String = "~/QAP_Main/App_Display/DF_qapRequests.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?RequestNo=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Dim aVal() As String = Request.QueryString("pk").Split("|".ToCharArray)
		Dim RequestNo As Int32 = CType(aVal(0),Int32)
		Dim oVar As SIS.QAP.qapRequests = SIS.QAP.qapRequests.qapRequestsGetByID(RequestNo)
    Dim oTbl As New Table
    oTbl.Width = 1000
    Dim oCol As TableCell = Nothing
    Dim oRow As TableRow = Nothing
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Request No"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.RequestNo
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Document Type"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.DocumentTypeID
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.QAP_DocumentTypes9_DocumentName
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "QAP Revision No"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.QAPRevisionNo
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "QAP No"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.QAPNo
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Project"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ProjectID
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.IDM_Projects7_Description
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Supplier"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.SupplierID
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.IDM_Vendors8_Description
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Sub Supplier"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.SubSupplier
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Main Item Description"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.MainItem
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Sub Item Description"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.SubItem
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Client Approval Required"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = IIf(oVar.ClientApprovalRequired, "YES", "NO")
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Remarks"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.Remarks
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Created By"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.CreatedBy
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.aspnet_Users1_UserFullName
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Created On"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.CreatedOn
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Creaters Division"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.CreatersDivision
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.HRM_Divisions6_Description
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Reviewed By"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ReviewBy
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.aspnet_Users2_UserFullName
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Reviewed On"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ReviewOn
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Reviewer Remarks"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ReviewerRemarks
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Reviewer Division"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ReviewerDivision
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.HRM_Divisions5_Description
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Approved By"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ApproveBy
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.aspnet_Users3_UserFullName
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Approved On"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ApproveOn
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Approver Remarks"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ApproverRemarks
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Approver Division"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.ApproverDivision
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.HRM_Divisions4_Description
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Status"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.StatusID
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = oVar.QAP_States12_QAPStatus
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = ""
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    form1.Controls.Add(oTbl)
    Dim oqapAttachmentss As List(Of SIS.QAP.qapAttachments) = SIS.QAP.qapAttachments.qapAttachmentsSelectList(0, 999, "", False, "", RequestNo)
    oTbl = New Table
    oTbl.GridLines = GridLines.Both
    oRow = New TableRow
    oCol = New TableCell
    oCol.Text = "Request No"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "QAP No"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Serial No"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Attachment"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "File Name"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "DiskFile"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Status"
    oRow.Cells.Add(oCol)
    oCol = New TableCell
    oCol.Text = "Description"
    oRow.Cells.Add(oCol)
    oTbl.Rows.Add(oRow)
    For Each oqapAttachments As SIS.QAP.qapAttachments In oqapAttachmentss
      oRow = New TableRow
      oCol = New TableCell
      oCol.Text = oqapAttachments.RequestNo
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.QAP_Requests1_QAPNo
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.SerialNo
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.Description
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.FileName
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.DiskFile
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.StatusID
      oRow.Cells.Add(oCol)
      oCol = New TableCell
      oCol.Text = oqapAttachments.QAP_AttachmentStates1_Description
      oRow.Cells.Add(oCol)
      oTbl.Rows.Add(oRow)
    Next
    form1.Controls.Add(oTbl)
  End Sub
End Class
