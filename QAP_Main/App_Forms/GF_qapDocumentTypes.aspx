<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="GF_qapDocumentTypes.aspx.vb" Inherits="GF_qapDocumentTypes" title="Maintain List: Document Types" %>
<asp:Content ID="CPHqapDocumentTypes" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLqapDocumentTypes" runat="server">
  <ContentTemplate>
    <asp:Label ID="LabelqapDocumentTypes" runat="server" Text="&nbsp;List: Document Types" Width="100%" CssClass="sis_formheading"></asp:Label>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLqapDocumentTypes"
      ToolType = "lgNMGrid"
      EditUrl = "~/QAP_Main/App_Edit/EF_qapDocumentTypes.aspx"
      AddUrl = "~/QAP_Main/App_Create/AF_qapDocumentTypes.aspx"
      ValidationGroup = "qapDocumentTypes"
      Skin = "tbl_blue"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSqapDocumentTypes" runat="server" AssociatedUpdatePanelID="UPNLqapDocumentTypes" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVqapDocumentTypes" SkinID="gv_silver" BorderColor="#A9A9A9" width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="ODSqapDocumentTypes" DataKeyNames="DocumentTypeID">
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
						<Table><tr>
              <td><asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' /></td>
						</tr></Table>
          </ItemTemplate>
          <HeaderStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Document Type" SortExpression="DocumentTypeID">
          <ItemTemplate>
            <asp:Label ID="LabelDocumentTypeID" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("DocumentTypeID") %>'></asp:Label>
          </ItemTemplate>
          <HeaderStyle CssClass="alignright" />
          <ItemStyle CssClass="alignright" />
          <HeaderStyle Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Document Name" SortExpression="DocumentName">
          <ItemTemplate>
            <asp:Label ID="LabelDocumentName" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("DocumentName") %>'></asp:Label>
          </ItemTemplate>
        <HeaderStyle Width="100px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSqapDocumentTypes"
      runat = "server"
      DataObjectTypeName = "SIS.QAP.qapDocumentTypes"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "qapDocumentTypesSelectList"
      TypeName = "SIS.QAP.qapDocumentTypes"
      SelectCountMethod = "qapDocumentTypesSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVqapDocumentTypes" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</asp:Content>
