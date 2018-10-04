<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_qapStates.aspx.vb" Inherits="AF_qapStates" title="Add: QAP States" %>
<asp:Content ID="CPHqapStates" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapStates" runat="server" >
  <ContentTemplate>
  <asp:Label ID="LabelqapStates" runat="server" Text="&nbsp;Add: QAP States" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapStates"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "qapStates"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapStates"
	runat = "server"
	DataKeyNames = "StatusID"
	DataSourceID = "ODSqapStates"
	DefaultMode = "Insert" CssClass="sis_formview">
	<InsertItemTemplate>
    <br />
    <asp:Label ID="L_ErrMsgqapStates" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
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
					<b><asp:Label ID="L_QAPStatus" runat="server" Text="QAP Status :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_QAPStatus"
						Text='<%# Bind("QAPStatus") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapStates"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for QAP Status."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVQAPStatus"
						runat = "server"
						ControlToValidate = "F_QAPStatus"
						Text = "QAP Status is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapStates"
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
  ID = "ODSqapStates"
  DataObjectTypeName = "SIS.QAP.qapStates"
  InsertMethod="qapStatesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapStates"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</asp:Content>
