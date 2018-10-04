<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapRequests.ascx.vb" Inherits="LC_qapRequests" %>
<asp:DropDownList 
  ID = "DDLqapRequests"
  DataSourceID = "OdsDdlqapRequests"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapRequests"
  Runat = "server" 
  ControlToValidate = "DDLqapRequests"
  Text = "Requests is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapRequests"
  runat = "server"
  TargetControlID = "DDLqapRequests"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapRequests"
  TypeName = "SIS.QAP.qapRequests"
  SortParameterName = "OrderBy"
  SelectMethod = "qapRequestsSelectList"
  Runat="server" />
