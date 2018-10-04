<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_qapRequests.aspx.vb" Inherits="AF_qapRequests" title="Add: Requests" %>
<asp:Content ID="CPHqapRequests" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">

<asp:UpdatePanel ID="UPNLqapRequests" runat="server" >
  <ContentTemplate>
  <asp:Label ID="LabelqapRequests" runat="server" Text="&nbsp;Add: Requests" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLqapRequests"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    AfterInsertURL = "~/QAP_Main/App_Edit/EF_qapRequests.aspx"
    ValidationGroup = "qapRequests"
    Skin = "tbl_blue"
    runat = "server" />


<asp:FormView ID="FVqapRequests"
	runat = "server"
	DataKeyNames = "RequestNo"
	DataSourceID = "ODSqapRequests"
	DefaultMode = "Insert" CssClass="sis_formview">
	<InsertItemTemplate>
    <br />
    <asp:Label ID="L_ErrMsgqapRequests" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_RequestNo" ForeColor="#CC6633" runat="server" Text="Request No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_RequestNo" Enabled="False" CssClass="mypktxt" width="70px" runat="server" Text="0" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_PurposeID" runat="server" Text="Purpose :" /></b>
				</td>
        <td>
          <LGM:LC_qapPurpose
            ID="F_PurposeID"
            SelectedValue='<%# Bind("PurposeID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
						ValidationGroup = "qapRequests"
            RequiredFieldErrorMessage = "Purpose is required."
            Runat="Server" />
          </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_DocumentTypeID" runat="server" Text="Document Type :" /></b>
				</td>
        <td>
          <LGM:LC_qapDocumentTypes
            ID="F_DocumentTypeID"
            SelectedValue='<%# Bind("DocumentTypeID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
						ValidationGroup = "qapRequests"
            RequiredFieldErrorMessage = "Document Type is required."
            Runat="Server" />
          </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="Label1" runat="server" Text="Division :" /></b>
				</td>
			<td>
			   <asp:DropDownList
            ID="F_Division"
            SelectedValue='<%# Bind("Division") %>'
            Width="200px"
						ValidationGroup = "qapRequests"
						CssClass = "myddl"
            Runat="Server" >
            <asp:ListItem Value="">-- SELECT --</asp:ListItem>
            <asp:ListItem Value="BOILER">BOILER</asp:ListItem>
            <asp:ListItem Value="SMD">SMD</asp:ListItem>
            <asp:ListItem Value="EPC">EPC</asp:ListItem>
            <asp:ListItem Value="PC">PC</asp:ListItem>
            <asp:ListItem Value="APCE">APCE</asp:ListItem>
          </asp:DropDownList>
     </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_QAPNo" runat="server" Text="QAP No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_QAPNo"
						Text='<%# Bind("QAPNo") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequests"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for QAP No."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVQAPNo"
						runat = "server"
						ControlToValidate = "F_QAPNo"
						Text = "QAP No is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
					  Enabled="true"
						ValidationGroup = "qapRequests"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_QAPRevisionNo" runat="server" Text="QAP Revision No :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_QAPRevisionNo"
						Text='<%# Bind("QAPRevisionNo") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequests"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for QAP Revision No."
						MaxLength="50"
            Width="350px"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVQAPRevisionNo"
						runat = "server"
						ControlToValidate = "F_QAPRevisionNo"
						Text = "QAP Revision No is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
					  Enabled="true"
						ValidationGroup = "qapRequests"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ProjectID" runat="server" Text="Project :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_ProjectID"
						CssClass = "myfktxt"
            Width="60px"
						Text='<%# Bind("ProjectID") %>'
						AutoCompleteType = "None"
						onfocus = "return this.select();"
            ToolTip="Enter value for Project."
						ValidationGroup = "qapRequests"
            onblur= "script_qapRequests.validate_ProjectID(this);"
						Runat="Server" />
					<asp:Label
						ID = "F_ProjectID_Display"
						Text='<%# Eval("IDM_Projects7_Description") %>'
						Runat="Server" />
					<asp:RequiredFieldValidator 
						ID = "RFVProjectID"
						runat = "server"
						ControlToValidate = "F_ProjectID"
						Text = "Project is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapRequests"
						SetFocusOnError="true" />
          <AJX:AutoCompleteExtender
            ID="ACEProjectID"
            BehaviorID="B_ACEProjectID"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="ProjectIDCompletionList"
            TargetControlID="F_ProjectID"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_qapRequests.ACEProjectID_Selected"
            OnClientPopulating="script_qapRequests.ACEProjectID_Populating"
            OnClientPopulated="script_qapRequests.ACEProjectID_Populated"
            CompletionSetCount="10"
						CompletionListCssClass = "autocomplete_completionListElement"
						CompletionListItemCssClass = "autocomplete_listItem"
						CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SupplierID" runat="server" Text="Supplier :" /></b>
				</td>
        <td>
					<asp:TextBox
						ID = "F_SupplierID"
						CssClass = "myfktxt"
            Width="90px"
						Text='<%# Bind("SupplierID") %>'
						AutoCompleteType = "None"
						onfocus = "return this.select();"
            ToolTip="Enter value for Supplier."
						ValidationGroup = "qapRequests"
            onblur= "script_qapRequests.validate_SupplierID(this);"
						Runat="Server" />
					<asp:Label
						ID = "F_SupplierID_Display"
						Text='<%# Eval("IDM_Vendors8_Description") %>'
						Runat="Server" />
					<asp:RequiredFieldValidator 
						ID = "RFVSupplierID"
						runat = "server"
						ControlToValidate = "F_SupplierID"
						Text = "Supplier is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapRequests"
						SetFocusOnError="true" />
          <AJX:AutoCompleteExtender
            ID="ACESupplierID"
            BehaviorID="B_ACESupplierID"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="SupplierIDCompletionList"
            TargetControlID="F_SupplierID"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_qapRequests.ACESupplierID_Selected"
            OnClientPopulating="script_qapRequests.ACESupplierID_Populating"
            OnClientPopulated="script_qapRequests.ACESupplierID_Populated"
            CompletionSetCount="10"
						CompletionListCssClass = "autocomplete_completionListElement"
						CompletionListItemCssClass = "autocomplete_listItem"
						CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
			</tr>
			<tr>
				<td></td>
				<td align="center">
					<asp:Button ID="cmdQapList" runat="server" Text="  Get already created QAP List  " OnClientClick="lc_qapList.getQap(this); return false;" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SubSupplier" runat="server" Text="Sub Supplier :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_SubSupplier"
						Text='<%# Bind("SubSupplier") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequests"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Sub Supplier."
						MaxLength="250"
            Width="350px" Height="40px" TextMode="MultiLine"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_MainItem" runat="server" Text="Main Item Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_MainItem"
						Text='<%# Bind("MainItem") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequests"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Main Item Description."
						MaxLength="250"
            Width="350px" Height="40px" TextMode="MultiLine"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVMainItem"
						runat = "server"
						ControlToValidate = "F_MainItem"
						Text = "Main Item Description is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "qapRequests"
						SetFocusOnError="true" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_SubItem" runat="server" Text="Sub Item Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_SubItem"
						Text='<%# Bind("SubItem") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequests"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Sub Item Description."
						MaxLength="250"
            Width="350px" Height="40px" TextMode="MultiLine"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ClientApprovalRequired" runat="server" Text="Client Approval Required :" /></b>
				</td>
				<td>
          <asp:CheckBox ID="F_ClientApprovalRequired"
					 Checked='<%# Bind("ClientApprovalRequired") %>'
           runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_Remarks" runat="server" Text="Remarks :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_Remarks"
						Text='<%# Bind("Remarks") %>'
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="qapRequests"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Remarks."
						MaxLength="250"
            Width="350px" Height="40px" TextMode="MultiLine"
						runat="server" />
				</td>
			</tr>
		</table>
		<br />
	</InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<LGM:LC_qapList ID="LC_qapList1" runat="server" />
<asp:ObjectDataSource 
  ID = "ODSqapRequests"
  DataObjectTypeName = "SIS.QAP.qapRequests"
  InsertMethod="UZ_qapRequestsInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QAP.qapRequests"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</asp:Content>
