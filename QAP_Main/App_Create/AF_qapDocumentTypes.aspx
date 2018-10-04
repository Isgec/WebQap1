<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_qapDocumentTypes.aspx.vb" Inherits="AF_qapDocumentTypes" title="Add: Document Types" %>
<asp:Content ID="CPHqapDocumentTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapDocumentTypes" runat="server" >
  <ContentTemplate>
  <asp:Label ID="LabelqapDocumentTypes" runat="server" Text="&nbsp;Add: Document Types" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapDocumentTypes"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "qapDocumentTypes"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapDocumentTypes"
	runat = "server"
	DataKeyNames = "DocumentTypeID"
	DataSourceID = "ODSqapDocumentTypes"
	DefaultMode = "Insert" CssClass="sis_formview">
	<InsertItemTemplate>
    <br />
    <asp:Label ID="L_ErrMsgqapDocumentTypes" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DocumentTypeID" ForeColor="#CC6633" runat="server" Text="Document Type :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_DocumentTypeID" Enabled="False" CssClass="mypktxt" width="70px" runat="server" Text="0" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DocumentName" runat="server" Text="Document Name :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_DocumentName"
						Text='<%# Bind("DocumentName") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapDocumentTypes"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Document Name."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVDocumentName"
						runat = "server"
						ControlToValidate = "F_DocumentName"
						Text = "Document Name is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapDocumentTypes"
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
  ID = "ODSqapDocumentTypes"
  DataObjectTypeName = "SIS.QAP.qapDocumentTypes"
  InsertMethod="qapDocumentTypesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapDocumentTypes"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</asp:Content>
