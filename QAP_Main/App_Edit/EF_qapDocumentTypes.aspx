<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_qapDocumentTypes.aspx.vb" Inherits="EF_qapDocumentTypes" title="Edit: Document Types" %>
<asp:Content ID="CPHqapDocumentTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapDocumentTypes" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabelqapDocumentTypes" runat="server" Text="&nbsp;Edit: Document Types" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapDocumentTypes"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "qapDocumentTypes"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapDocumentTypes"
	runat = "server"
	DataKeyNames = "DocumentTypeID"
	DataSourceID = "ODSqapDocumentTypes"
	DefaultMode = "Edit" CssClass="sis_formview">
	<EditItemTemplate>
    <br />
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DocumentTypeID" runat="server" ForeColor="#CC6633" Text="Document Type :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_DocumentTypeID"
						Text='<%# Bind("DocumentTypeID") %>'
            ToolTip="Value of Document Type."
            Enabled = "False"
						CssClass = "mypktxt"
            Width="70px"
						style="text-align: right"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DocumentName" runat="server" Text="Document Name :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_DocumentName"
						Text='<%# Bind("DocumentName") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapDocumentTypes"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Document Name."
						MaxLength="50"
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
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapDocumentTypes"
  DataObjectTypeName = "SIS.QAP.qapDocumentTypes"
  SelectMethod = "qapDocumentTypesGetByID"
  UpdateMethod="qapDocumentTypesUpdate"
  DeleteMethod="qapDocumentTypesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapDocumentTypes"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="DocumentTypeID" Name="DocumentTypeID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
