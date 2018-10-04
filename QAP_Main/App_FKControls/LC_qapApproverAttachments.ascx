<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapApproverAttachments.ascx.vb" Inherits="LC_qapApproverAttachments" %>
<asp:DropDownList 
  ID = "DDLqapApproverAttachments"
  DataSourceID = "OdsDdlqapApproverAttachments"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapApproverAttachments"
  Runat = "server" 
  ControlToValidate = "DDLqapApproverAttachments"
  Text = "Attachments By Approver is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapApproverAttachments"
  runat = "server"
  TargetControlID = "DDLqapApproverAttachments"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapApproverAttachments"
  TypeName = "SIS.QAP.qapApproverAttachments"
  SortParameterName = "OrderBy"
  SelectMethod = "qapApproverAttachmentsSelectList"
  Runat="server" />
