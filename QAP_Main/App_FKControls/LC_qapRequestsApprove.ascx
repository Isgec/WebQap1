<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapRequestsApprove.ascx.vb" Inherits="LC_qapRequestsApprove" %>
<asp:DropDownList 
  ID = "DDLqapRequestsApprove"
  DataSourceID = "OdsDdlqapRequestsApprove"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapRequestsApprove"
  Runat = "server" 
  ControlToValidate = "DDLqapRequestsApprove"
  Text = "Requests Approve is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapRequestsApprove"
  runat = "server"
  TargetControlID = "DDLqapRequestsApprove"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapRequestsApprove"
  TypeName = "SIS.QAP.qapRequestsApprove"
  SortParameterName = "OrderBy"
  SelectMethod = "qapRequestsApproveSelectList"
  Runat="server" />
