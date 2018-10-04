<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_qapAttachments.aspx.vb" Inherits="AF_qapAttachments" title="Add: Attachments" %>
<asp:Content ID="CPHqapAttachments" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapAttachments" runat="server" >
  <ContentTemplate>
  <asp:Label ID="LabelqapAttachments" runat="server" Text="&nbsp;Add: Attachments" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapAttachments"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "qapAttachments"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapAttachments"
	runat = "server"
	DataKeyNames = "RequestNo,SerialNo"
	DataSourceID = "ODSqapAttachments"
	DefaultMode = "Insert" CssClass="sis_formview">
	<InsertItemTemplate>
    <br />
    <asp:Label ID="L_ErrMsgqapAttachments" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_RequestNo" ForeColor="#CC6633" runat="server" Text="Request No :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_RequestNo"
						CssClass = "mypktxt"
            Width="70px"
						Text='<%# Bind("RequestNo") %>'
						AutoCompleteType = "None"
						onfocus = "return this.select();"
            ToolTip="Enter value for Request No."
						ValidationGroup = "qapAttachments"
            onblur= "script_qapAttachments.validate_RequestNo(this);"
						Runat="Server" />
					<asp:Label
						ID = "F_RequestNo_Display"
						Text='<%# Eval("QAP_Requests1_QAPNo") %>'
						Runat="Server" />
					<asp:RequiredFieldValidator 
						ID = "RFVRequestNo"
						runat = "server"
						ControlToValidate = "F_RequestNo"
						Text = "Request No is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapAttachments"
						SetFocusOnError="true" />
          <AJX:AutoCompleteExtender
            ID="ACERequestNo"
            BehaviorID="B_ACERequestNo"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="RequestNoCompletionList"
            TargetControlID="F_RequestNo"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_qapAttachments.ACERequestNo_Selected"
            OnClientPopulating="script_qapAttachments.ACERequestNo_Populating"
            OnClientPopulated="script_qapAttachments.ACERequestNo_Populated"
            CompletionSetCount="10"
						CompletionListCssClass = "autocomplete_completionListElement"
						CompletionListItemCssClass = "autocomplete_listItem"
						CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SerialNo" ForeColor="#CC6633" runat="server" Text="Serial No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_SerialNo" Enabled="False" CssClass="mypktxt" width="70px" runat="server" Text="0" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_Description" runat="server" Text="Attachment :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_Description"
						Text='<%# Bind("Description") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapAttachments"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Attachment."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVDescription"
						runat = "server"
						ControlToValidate = "F_Description"
						Text = "Attachment is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapAttachments"
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
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapAttachments"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for File Name."
						MaxLength="250"
            Width="350px" Height="40px" TextMode="MultiLine"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVFileName"
						runat = "server"
						ControlToValidate = "F_FileName"
						Text = "File Name is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapAttachments"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DiskFile" runat="server" Text="DiskFile :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_DiskFile"
						Text='<%# Bind("DiskFile") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapAttachments"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for DiskFile."
						MaxLength="250"
            Width="350px" Height="40px" TextMode="MultiLine"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVDiskFile"
						runat = "server"
						ControlToValidate = "F_DiskFile"
						Text = "DiskFile is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapAttachments"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_StatusID" runat="server" Text="Status :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_StatusID"
						CssClass = "myfktxt"
            Width="70px"
						Text='<%# Bind("StatusID") %>'
						AutoCompleteType = "None"
						onfocus = "return this.select();"
            ToolTip="Enter value for Status."
						ValidationGroup = "qapAttachments"
            onblur= "script_qapAttachments.validate_StatusID(this);"
						Runat="Server" />
					<asp:Label
						ID = "F_StatusID_Display"
						Text='<%# Eval("QAP_AttachmentStates1_Description") %>'
						Runat="Server" />
					<asp:RequiredFieldValidator 
						ID = "RFVStatusID"
						runat = "server"
						ControlToValidate = "F_StatusID"
						Text = "Status is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapAttachments"
						SetFocusOnError="true" />
          <AJX:AutoCompleteExtender
            ID="ACEStatusID"
            BehaviorID="B_ACEStatusID"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="StatusIDCompletionList"
            TargetControlID="F_StatusID"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_qapAttachments.ACEStatusID_Selected"
            OnClientPopulating="script_qapAttachments.ACEStatusID_Populating"
            OnClientPopulated="script_qapAttachments.ACEStatusID_Populated"
            CompletionSetCount="10"
						CompletionListCssClass = "autocomplete_completionListElement"
						CompletionListItemCssClass = "autocomplete_listItem"
						CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
			</tr>
		</table>
		<br />
	</InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapAttachments"
  DataObjectTypeName = "SIS.QAP.qapAttachments"
  InsertMethod="qapAttachmentsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapAttachments"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</asp:Content>
