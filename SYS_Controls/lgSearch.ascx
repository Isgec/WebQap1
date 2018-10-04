<%@ Control Language="VB" AutoEventWireup="false" CodeFile="lgSearch.ascx.vb" Inherits="lgSearch" %>
<table>
	<tr>
		<td style="vertical-align: middle; text-align: center">
			<asp:CheckBox 
				ID="lg_End"
				runat="server"
				Enabled="false"
				AutoPostBack="true"
				ToolTip="Uncheck for normal view." />
		</td>
		<td style="vertical-align: middle; text-align: center">
			<asp:TextBox 
				ID="lg_Search" 
				runat="server" 
				CssClass="mytxt" 
				ToolTip="Enter keywords to search." 
				ValidationGroup = "lg_vgsearch"
				Width="80px"
				Font-Size="9px" MaxLength="250" />
			<AJX:TextBoxWatermarkExtender 
				ID="lg_wm" 
				runat="server" 
				TargetControlID="lg_Search"
				WatermarkText="[Search]">
			</AJX:TextBoxWatermarkExtender>
			<asp:RequiredFieldValidator 
				ID = "lg_rfvst"
				runat = "server"
				ControlToValidate = "lg_Search"
				Display="none"
				EnableClientScript = "true"
				ValidationGroup = "lg_vgsearch"
				SetFocusOnError="true" />
		</td>
		<td style="vertical-align: middle; width: 34px; text-align: center">
			<asp:ImageButton 
				ID="lg_cmdSearch" 
				runat="server" 
				ImageUrl="~/TblImages/srh0.png" 
				AlternateText="Search" 
				ToolTip="Click to search" 
				ValidationGroup = "lg_vgsearch" />
		</td>
	</tr>
</table>

