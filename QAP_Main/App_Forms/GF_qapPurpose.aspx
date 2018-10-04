<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GF_qapPurpose.aspx.vb" Inherits="GF_qapPurpose" title="Maintain List: QAP Purpose" %>
<asp:Content ID="CPHqapPurpose" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapPurpose" runat="server">
  <ContentTemplate>
    <asp:Label ID="LabelqapPurpose" runat="server" Text="&nbsp;List: QAP Purpose" Width="100%" CssClass="sis_formheading"></asp:Label>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLqapPurpose"
      ToolType = "lgNMGrid"
      EditUrl = "~/QAP_Main/App_Edit/EF_qapPurpose.aspx"
      AddUrl = "~/QAP_Main/App_Create/AF_qapPurpose.aspx"
      ValidationGroup = "qapPurpose"
      Skin = "tbl_blue"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSqapPurpose" runat="server" AssociatedUpdatePanelID="UPNLqapPurpose" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVqapPurpose" SkinID="gv_silver" BorderColor="#A9A9A9" width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ODSqapPurpose" DataKeyNames="PurposeID">
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
						<Table><tr>
              <td><asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' /></td>
						</tr></Table>
          </ItemTemplate>
          <HeaderStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PurposeID" SortExpression="PurposeID">
          <ItemTemplate>
            <asp:Label ID="LabelPurposeID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("PurposeID") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="alignright" />
          <ItemStyle CssClass="alignright" />
          <HeaderStyle Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PurposeName" SortExpression="PurposeName">
          <ItemTemplate>
            <asp:Label ID="LabelPurposeName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("PurposeName") %>'></asp:Label>
          </ItemTemplate>
        <HeaderStyle Width="100px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSqapPurpose"
      runat = "server"
      DataObjectTypeName = "SIS.QAP.qapPurpose"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "qapPurposeSelectList"
      TypeName = "SIS.QAP.qapPurpose"
      SelectCountMethod = "qapPurposeSelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
				<asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
				<asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVqapPurpose" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</asp:Content>
