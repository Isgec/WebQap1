<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Informations.ascx.vb" Inherits="Informations" %>

<table id="TblEmp" width="100%" runat="server">
	<tr>
		<td style="width: 290px; text-align:left">
			<asp:Panel ID="pnlMenuHdr" runat="server">
				<asp:Image ID="lgMenu" runat="server" AlternateText="menu" ImageUrl="~/App_Themes/Default/Images/menu_0.png" Style="cursor: pointer" />
			</asp:Panel>
			<asp:Panel ID="pnlMenu" runat="server" Style="position: absolute; z-index: auto; display: none">
				<table>
					<tr>
						<td class="b1">
						</td>
						<td class="b2">
						</td>
						<td class="b3">
						</td>
					</tr>
					<tr>
						<td class="b8">
						</td>
						<td align="left" class="b9">
							<asp:TreeView ID="TreeView1" runat="server" DataSourceID="XmlDataSource1" Width="100%" ExpandDepth="FullyExpand">
								<DataBindings>
									<asp:TreeNodeBinding DataMember="Menu" TextField="Text" ValueField="Text" SelectAction="Expand" />
									<asp:TreeNodeBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text" ValueField="Text" ImageUrlField="LGImageUrl" />
									<asp:TreeNodeBinding DataMember="SISMenu" SelectAction="Expand" />
								</DataBindings>
								<SelectedNodeStyle ImageUrl="~/App_Themes/Default/Images/folder_open.png" />
								<RootNodeStyle ImageUrl="~/App_Themes/Default/Images/Home.png" />
								<NodeStyle ImageUrl="~/App_Themes/Default/Images/folder.png" />
								<LeafNodeStyle ImageUrl="~/App_Themes/Default/Images/application.png" />
							</asp:TreeView>
							<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Default_Menu.xml"></asp:XmlDataSource>
						</td>
						<td class="b4">
						</td>
					</tr>
					<tr>
						<td class="b7">
						</td>
						<td class="b6">
						</td>
						<td class="b5">
						</td>
					</tr>
				</table>
			</asp:Panel>
			<AJX:CollapsiblePanelExtender ID="cpeMenu" TargetControlID="pnlMenu" ExpandControlID="pnlMenuHdr" CollapseControlID="pnlMenuHdr" Collapsed="True" ImageControlID="lgMenu" ExpandedImage="~/App_Themes/Default/Images/menu_1.png" CollapsedImage="~/App_Themes/Default/Images/menu_0.png" SuppressPostBack="true" runat="Server" />
		</td>
		<td style="width: 60px;text-align:right">
			<asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#848484" Font-Size="10px" Text="Name:"></asp:Label>
		</td>
		<td style="width: 150px;text-align:left">
			<asp:Label ID="F_EmployeeName" runat="server" Font-Bold="False"></asp:Label>
		</td>
		<td style="width: 100px; text-align: right;">
			<asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#848484" Font-Size="10px" Text="Department:"></asp:Label>
		</td>
		<td style="width: 150px;text-align: left">
			<asp:Label ID="F_Department" runat="server" Font-Bold="False"></asp:Label>
		</td>
		<td style="width: 100px; text-align: right;">
			<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#848484" Font-Size="10px" Text="Designation:"></asp:Label>
		</td>
		<td style="width: 150px;text-align: left">
			<asp:Label ID="F_Designation" runat="server" Font-Bold="False"></asp:Label>
		</td>
	</tr>
</table>
