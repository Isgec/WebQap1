<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_qapPurpose.aspx.vb" Inherits="EF_qapPurpose" title="Edit: QAP Purpose" %>
<asp:Content ID="CPHqapPurpose" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapPurpose" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabelqapPurpose" runat="server" Text="&nbsp;Edit: QAP Purpose" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapPurpose"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "qapPurpose"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapPurpose"
	runat = "server"
	DataKeyNames = "PurposeID"
	DataSourceID = "ODSqapPurpose"
	DefaultMode = "Edit" CssClass="sis_formview">
	<EditItemTemplate>
    <br />
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_PurposeID" runat="server" ForeColor="#CC6633" Text="PurposeID :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_PurposeID"
						Text='<%# Bind("PurposeID") %>'
            ToolTip="Value of PurposeID."
            Enabled = "False"
						CssClass = "mypktxt"
            Width="70px"
						style="text-align: right"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_PurposeName" runat="server" Text="PurposeName :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_PurposeName"
						Text='<%# Bind("PurposeName") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapPurpose"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for PurposeName."
						MaxLength="50"
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
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapPurpose"
  DataObjectTypeName = "SIS.QAP.qapPurpose"
  SelectMethod = "qapPurposeGetByID"
  UpdateMethod="qapPurposeUpdate"
  DeleteMethod="qapPurposeDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapPurpose"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="PurposeID" Name="PurposeID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
