<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_qapAttachmentStates.aspx.vb" Inherits="EF_qapAttachmentStates" title="Edit: Attachment States" %>
<asp:Content ID="CPHqapAttachmentStates" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapAttachmentStates" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabelqapAttachmentStates" runat="server" Text="&nbsp;Edit: Attachment States" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapAttachmentStates"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "qapAttachmentStates"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapAttachmentStates"
	runat = "server"
	DataKeyNames = "StatusID"
	DataSourceID = "ODSqapAttachmentStates"
	DefaultMode = "Edit" CssClass="sis_formview">
	<EditItemTemplate>
    <br />
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_StatusID" runat="server" ForeColor="#CC6633" Text="Status :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_StatusID"
						Text='<%# Bind("StatusID") %>'
            ToolTip="Value of Status."
            Enabled = "False"
						CssClass = "mypktxt"
            Width="70px"
						style="text-align: right"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_Description" runat="server" Text="Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_Description"
						Text='<%# Bind("Description") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapAttachmentStates"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Description."
						MaxLength="50"
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
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapAttachmentStates"
  DataObjectTypeName = "SIS.QAP.qapAttachmentStates"
  SelectMethod = "qapAttachmentStatesGetByID"
  UpdateMethod="qapAttachmentStatesUpdate"
  DeleteMethod="qapAttachmentStatesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapAttachmentStates"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="StatusID" Name="StatusID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
