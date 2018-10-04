<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapAttachments.ascx.vb" Inherits="LC_qapAttachments" %>
<asp:DropDownList 
  ID = "DDLqapAttachments"
  DataSourceID = "OdsDdlqapAttachments"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapAttachments"
  Runat = "server" 
  ControlToValidate = "DDLqapAttachments"
  Text = "Attachments is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapAttachments"
  runat = "server"
  TargetControlID = "DDLqapAttachments"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapAttachments"
  TypeName = "SIS.QAP.qapAttachments"
  SortParameterName = "OrderBy"
  SelectMethod = "qapAttachmentsSelectList"
  Runat="server" />
