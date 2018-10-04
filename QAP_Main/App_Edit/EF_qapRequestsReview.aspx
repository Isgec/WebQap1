<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_qapRequestsReview.aspx.vb" Inherits="EF_qapRequestsReview" title="Edit: Requests Review" %>
<asp:Content ID="CPHqapRequestsReview" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapRequestsReview" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabelqapRequestsReview" runat="server" Text="&nbsp;Edit: Requests Review" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapRequestsReview"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    EnableDelete = "False"
    EnablePrint = "True"
    PrintUrl = "../App_Print/RP_qapRequestsReview.aspx?pk="
    ValidationGroup = "qapRequestsReview"
    Skin = "tbl_blue"
    runat = "server" />
    <script type="text/javascript">
      var pcnt = 0;
      function print_report(o) {
        pcnt = pcnt + 1;
        var nam = 'wTask' + pcnt;
        var url = self.location.href.replace('App_Forms/GF_','App_Print/RP_');
        url = url + '?pk=' + o.alt;
        url = o.alt;
        window.open(url, nam, 'left=20,top=20,width=1000,height=600,toolbar=1,resizable=1,scrollbars=1');
        return false;
      }
    </script>
<asp:FormView ID="FVqapRequestsReview"
	runat = "server"
	DataKeyNames = "RequestNo"
	DataSourceID = "ODSqapRequestsReview"
	DefaultMode = "Edit" CssClass="sis_formview">
	<EditItemTemplate>
    <br />
    <table>
			<tr>
				<td>
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_RequestNo" runat="server" ForeColor="#CC6633" Text="Request No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_RequestNo"
						Text='<%# Bind("RequestNo") %>'
            ToolTip="Value of Request No."
            Enabled = "False"
						CssClass = "mypktxt"
            Width="70px"
						style="text-align: right"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DocumentTypeID" runat="server" Text="Document Type :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_DocumentTypeID"
            Width="70px"
						Text='<%# Bind("DocumentTypeID") %>'
            Enabled = "False"
            ToolTip="Value of Document Type."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_DocumentTypeID_Display"
						Text='<%# Eval("QAP_DocumentTypes9_DocumentName") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_QAPNo" runat="server" Text="QAP No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_QAPNo"
						Text='<%# Bind("QAPNo") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequestsReview"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for QAP No."
						MaxLength="50"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVQAPNo"
						runat = "server"
						ControlToValidate = "F_QAPNo"
						Text = "QAP No is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapRequestsReview"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_QAPRevisionNo" runat="server" Text="QAP Revision No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_QAPRevisionNo"
						Text='<%# Bind("QAPRevisionNo") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequestsReview"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for QAP Revision No."
						MaxLength="50"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVQAPRevisionNo"
						runat = "server"
						ControlToValidate = "F_QAPRevisionNo"
						Text = "QAP Revision No is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapRequestsReview"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ReviewerRemarks" runat="server" Text="Reviewer Remarks :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_ReviewerRemarks"
						Text='<%# Bind("ReviewerRemarks") %>'
            Width="350px" Height="40px" TextMode="MultiLine"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequestsReview"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Reviewer Remarks."
						MaxLength="250"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVReviewerRemarks"
						runat = "server"
						ControlToValidate = "F_ReviewerRemarks"
						Text = "Reviewer Remarks is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapRequestsReview"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ProjectID" runat="server" Text="Project :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_ProjectID"
            Width="42px"
						Text='<%# Bind("ProjectID") %>'
            Enabled = "False"
            ToolTip="Value of Project."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_ProjectID_Display"
						Text='<%# Eval("IDM_Projects7_Description") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SupplierID" runat="server" Text="Supplier :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_SupplierID"
            Width="42px"
						Text='<%# Bind("SupplierID") %>'
            Enabled = "False"
            ToolTip="Value of Supplier."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_SupplierID_Display"
						Text='<%# Eval("IDM_Vendors8_Description") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SubSupplier" runat="server" Text="Sub Supplier :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_SubSupplier"
						Text='<%# Bind("SubSupplier") %>'
            ToolTip="Value of Sub Supplier."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_MainItem" runat="server" Text="Main Item Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_MainItem"
						Text='<%# Bind("MainItem") %>'
            ToolTip="Value of Main Item Description."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SubItem" runat="server" Text="Sub Item Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_SubItem"
						Text='<%# Bind("SubItem") %>'
            ToolTip="Value of Sub Item Description."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			</table>
				</td>
				<td>
			<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ClientApprovalRequired" runat="server" Text="Client Approval Required :" /></b>
				</td>
				<td>
          <asp:CheckBox ID="F_ClientApprovalRequired"
					  Checked='<%# Bind("ClientApprovalRequired") %>'
            Enabled = "False"
            runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_Remarks" runat="server" Text="Remarks :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_Remarks"
						Text='<%# Bind("Remarks") %>'
            ToolTip="Value of Remarks."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_CreatedBy" runat="server" Text="Created By :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_CreatedBy"
            Width="56px"
						Text='<%# Bind("CreatedBy") %>'
            Enabled = "False"
            ToolTip="Value of Created By."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_CreatedBy_Display"
						Text='<%# Eval("aspnet_Users1_UserFullName") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_CreatedOn" runat="server" Text="Created On :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_CreatedOn"
						Text='<%# Bind("CreatedOn") %>'
            ToolTip="Value of Created On."
            Enabled = "False"
            Width="140px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_CreatersDivision" runat="server" Text="Creaters Division :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_CreatersDivision"
            Width="42px"
						Text='<%# Bind("CreatersDivision") %>'
            Enabled = "False"
            ToolTip="Value of Creaters Division."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_CreatersDivision_Display"
						Text='<%# Eval("HRM_Divisions6_Description") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ApproveBy" runat="server" Text="Approved By :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_ApproveBy"
            Width="56px"
						Text='<%# Bind("ApproveBy") %>'
            Enabled = "False"
            ToolTip="Value of Approved By."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_ApproveBy_Display"
						Text='<%# Eval("aspnet_Users3_UserFullName") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ApproveOn" runat="server" Text="Approved On :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_ApproveOn"
						Text='<%# Bind("ApproveOn") %>'
            ToolTip="Value of Approved On."
            Enabled = "False"
            Width="140px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ApproverRemarks" runat="server" Text="Approver Remarks :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_ApproverRemarks"
						Text='<%# Bind("ApproverRemarks") %>'
            ToolTip="Value of Approver Remarks."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ApproverDivision" runat="server" Text="Approver Division :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_ApproverDivision"
            Width="42px"
						Text='<%# Bind("ApproverDivision") %>'
            Enabled = "False"
            ToolTip="Value of Approver Division."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_ApproverDivision_Display"
						Text='<%# Eval("HRM_Divisions4_Description") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_StatusID" runat="server" Text="Status :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_StatusID"
            Width="70px"
						Text='<%# Bind("StatusID") %>'
            Enabled = "False"
            ToolTip="Value of Status."
						CssClass = "dmyfktxt"
						Runat="Server" />
					<asp:Label
						ID = "F_StatusID_Display"
						Text='<%# Eval("QAP_States12_QAPStatus") %>'
						Runat="Server" />
        </td>
			</tr>
		</table>
				</td>
			</tr>
    </table>
<asp:UpdatePanel ID="UPNLqapReviewerAttachments" runat="server">
  <ContentTemplate>
    <asp:Label ID="LabelqapReviewerAttachments" runat="server" Text="&nbsp;List: Attachments By Reviewer" Width="100%" CssClass="sis_formheading"></asp:Label>
		<table id="F_Upload" runat="server" visible="<%# Editable %>" >
				<tr>
					<td>
						<asp:Label ID="L_FileUpload" runat="server" Font-Bold="true" Text="Attatch File :"></asp:Label>
					</td>
					<td style="text-align:left">
						<input type="text" id="fileName" style="width:300px" class="file_input_textbox" readonly="readonly">
 					</td>
					<td>
						<div class="file_input_div">
							<input type="button" value="Search file" class="file_input_button" />
							<asp:FileUpload ID="F_FileUpload" runat="server" Width="100px"  class="file_input_hidden" onchange="document.getElementById('fileName').value = this.value;" ToolTip="Attatch File" />
						</div>
					</td>
					<td>
						<asp:Button ID="cmdFileUpload" CssClass="file_upload_button" Text="Upload File" runat="server" ToolTip="Click to attatch file." CommandName="Upload" CommandArgument="" />
            <asp:RegularExpressionValidator
							id="RegularExpressionValidator1" runat="server"
							ErrorMessage="Only PDF files are allowed!"
						  Font-Bold="true"
						  Font-Size="Small"
							ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"
							ControlToValidate="F_FileUpload" >
						</asp:RegularExpressionValidator>
					</td>
				</tr>
			</table>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLqapReviewerAttachments"
      ToolType = "lgNMGrid"
      EditUrl = "~/QAP_Main/App_Edit/EF_qapReviewerAttachments.aspx"
      EnableAdd="false"
      EnableExit = "false"
      ValidationGroup = "qapReviewerAttachments"
      Skin = "tbl_blue"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSqapReviewerAttachments" runat="server" AssociatedUpdatePanelID="UPNLqapReviewerAttachments" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVqapReviewerAttachments" SkinID="gv_silver" BorderColor="#A9A9A9" width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ODSqapReviewerAttachments" DataKeyNames="RequestNo,SerialNo">
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
						<Table><tr>
              <td><asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' /></td>
						</tr></Table>
          </ItemTemplate>
          <HeaderStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Attachment" SortExpression="Description">
          <ItemTemplate>
						<asp:LinkButton ID="LabelDescription" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("Description") %>' OnClientClick='<%# Eval("GetLink") %>'></asp:LinkButton>
          </ItemTemplate>
        <HeaderStyle Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status" SortExpression="QAP_AttachmentStates1_Description">
          <ItemTemplate>
             <asp:Label ID="L_StatusID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("StatusID") %>' Text='<%# Eval("QAP_AttachmentStates1_Description") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle Width="100px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSqapReviewerAttachments"
      runat = "server"
      DataObjectTypeName = "SIS.QAP.qapReviewerAttachments"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "qapReviewerAttachmentsSelectList"
      TypeName = "SIS.QAP.qapReviewerAttachments"
      SelectCountMethod = "qapReviewerAttachmentsSelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:ControlParameter ControlID="F_RequestNo" PropertyName="Text" Name="RequestNo" Type="Int32" Size="10" />
				<asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
				<asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVqapReviewerAttachments" EventName="PageIndexChanged" />
    <asp:PostBackTrigger ControlID="cmdFileUpload" />
  </Triggers>
</asp:UpdatePanel>
	<br />
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapRequestsReview"
  DataObjectTypeName = "SIS.QAP.qapRequestsReview"
  SelectMethod = "qapRequestsReviewGetByID"
  UpdateMethod="UZ_qapRequestsReviewUpdate"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapRequestsReview"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="RequestNo" Name="RequestNo" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
