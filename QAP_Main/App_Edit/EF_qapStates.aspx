<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_qapStates.aspx.vb" Inherits="EF_qapStates" title="Edit: QAP States" %>
<asp:Content ID="CPHqapStates" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapStates" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabelqapStates" runat="server" Text="&nbsp;Edit: QAP States" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapStates"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "qapStates"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVqapStates"
	runat = "server"
	DataKeyNames = "StatusID"
	DataSourceID = "ODSqapStates"
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
					<b><asp:Label ID="L_QAPStatus" runat="server" Text="QAP Status :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_QAPStatus"
						Text='<%# Bind("QAPStatus") %>'
            Width="350px"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapStates"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for QAP Status."
						MaxLength="50"
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
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSqapStates"
  DataObjectTypeName = "SIS.QAP.qapStates"
  SelectMethod = "qapStatesGetByID"
  UpdateMethod="qapStatesUpdate"
  DeleteMethod="qapStatesDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapStates"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="StatusID" Name="StatusID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
