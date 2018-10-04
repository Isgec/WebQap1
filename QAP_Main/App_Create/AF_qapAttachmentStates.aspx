<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_qapAttachmentStates.aspx.vb" Inherits="AF_qapAttachmentStates" title="Add: Attachment States" %>
<asp:Content ID="CPHqapAttachmentStates" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapAttachmentStates" runat="server" >
  <ContentTemplate>
  <asp:Label ID="LabelqapAttachmentStates" runat="server" Text="&nbsp;Add: Attachment States" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapAttachmentStates"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "qapAttachmentStates"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapAttachmentStates"
	runat = "server"
	DataKeyNames = "StatusID"
	DataSourceID = "ODSqapAttachmentStates"
	DefaultMode = "Insert" CssClass="sis_formview">
	<InsertItemTemplate>
    <br />
    <asp:Label ID="L_ErrMsgqapAttachmentStates" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_StatusID" ForeColor="#CC6633" runat="server" Text="Status :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_StatusID" Enabled="False" CssClass="mypktxt" width="70px" runat="server" Text="0" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_Description" runat="server" Text="Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_Description"
						Text='<%# Bind("Description") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapAttachmentStates"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Description."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVDescription"
						runat = "server"
						ControlToValidate = "F_Description"
						Text = "Description is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapAttachmentStates"
						SetFocusOnError="true" />
				</td>
			</tr>
		</table>
		<br />
	</InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapAttachmentStates"
  DataObjectTypeName = "SIS.QAP.qapAttachmentStates"
  InsertMethod="qapAttachmentStatesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapAttachmentStates"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</asp:Content>
