<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_qapApproverAttachments.aspx.vb" Inherits="EF_qapApproverAttachments" title="Edit: Attachments By Approver" %>
<asp:Content ID="CPHqapApproverAttachments" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapApproverAttachments" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabelqapApproverAttachments" runat="server" Text="&nbsp;Edit: Attachments By Approver" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapApproverAttachments"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "qapApproverAttachments"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapApproverAttachments"
	runat = "server"
	DataKeyNames = "RequestNo,SerialNo"
	DataSourceID = "ODSqapApproverAttachments"
	DefaultMode = "Edit" CssClass="sis_formview">
	<EditItemTemplate>
    <br />
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_RequestNo" runat="server" ForeColor="#CC6633" Text="Request No :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_RequestNo"
            Width="70px"
						Text='<%# Bind("RequestNo") %>'
						CssClass = "mypktxt"
            Enabled = "False"
            ToolTip="Value of Request No."
						Runat="Server" />
					<asp:Label
						ID = "F_RequestNo_Display"
						Text='<%# Eval("QAP_Requests1_QAPNo") %>'
						Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SerialNo" runat="server" ForeColor="#CC6633" Text="Serial No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_SerialNo"
						Text='<%# Bind("SerialNo") %>'
            ToolTip="Value of Serial No."
            Enabled = "False"
						CssClass = "mypktxt"
            Width="70px"
						style="text-align: right"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_Description" runat="server" Text="Attachment :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_Description"
						Text='<%# Bind("Description") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapApproverAttachments"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Attachment."
						MaxLength="50"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVDescription"
						runat = "server"
						ControlToValidate = "F_Description"
						Text = "Attachment is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapApproverAttachments"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_FileName" runat="server" Text="File Name :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_FileName"
						Text='<%# Bind("FileName") %>'
            ToolTip="Value of File Name."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DiskFile" runat="server" Text="DiskFile :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_DiskFile"
						Text='<%# Bind("DiskFile") %>'
            ToolTip="Value of DiskFile."
            Enabled = "False"
            Width="350px" Height="40px"
						CssClass = "dmytxt"
						runat="server" />
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
						Text='<%# Eval("QAP_AttachmentStates1_Description") %>'
						Runat="Server" />
        </td>
			</tr>
		</table>
	<br />
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapApproverAttachments"
  DataObjectTypeName = "SIS.QAP.qapApproverAttachments"
  SelectMethod = "qapApproverAttachmentsGetByID"
  UpdateMethod="UZ_qapApproverAttachmentsUpdate"
  DeleteMethod="UZ_qapApproverAttachmentsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapApproverAttachments"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="RequestNo" Name="RequestNo" Type="Int32" />
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="SerialNo" Name="SerialNo" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
