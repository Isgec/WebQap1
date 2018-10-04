<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_qapPurpose.aspx.vb" Inherits="AF_qapPurpose" title="Add: QAP Purpose" %>
<asp:Content ID="CPHqapPurpose" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapPurpose" runat="server" >
  <ContentTemplate>
  <asp:Label ID="LabelqapPurpose" runat="server" Text="&nbsp;Add: QAP Purpose" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapPurpose"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "qapPurpose"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapPurpose"
	runat = "server"
	DataKeyNames = "PurposeID"
	DataSourceID = "ODSqapPurpose"
	DefaultMode = "Insert" CssClass="sis_formview">
	<InsertItemTemplate>
    <br />
    <asp:Label ID="L_ErrMsgqapPurpose" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_PurposeID" ForeColor="#CC6633" runat="server" Text="PurposeID :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_PurposeID" Enabled="False" CssClass="mypktxt" width="70px" runat="server" Text="0" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_PurposeName" runat="server" Text="PurposeName :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_PurposeName"
						Text='<%# Bind("PurposeName") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapPurpose"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for PurposeName."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVPurposeName"
						runat = "server"
						ControlToValidate = "F_PurposeName"
						Text = "PurposeName is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapPurpose"
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
  ID = "ODSqapPurpose"
  DataObjectTypeName = "SIS.QAP.qapPurpose"
  InsertMethod="qapPurposeInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapPurpose"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</asp:Content>
