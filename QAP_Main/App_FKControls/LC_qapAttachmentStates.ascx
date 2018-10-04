<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapAttachmentStates.ascx.vb" Inherits="LC_qapAttachmentStates" %>
<asp:DropDownList 
  ID = "DDLqapAttachmentStates"
  DataSourceID = "OdsDdlqapAttachmentStates"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapAttachmentStates"
  Runat = "server" 
  ControlToValidate = "DDLqapAttachmentStates"
  Text = "Attachment States is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapAttachmentStates"
  runat = "server"
  TargetControlID = "DDLqapAttachmentStates"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapAttachmentStates"
  TypeName = "SIS.QAP.qapAttachmentStates"
  SortParameterName = "OrderBy"
  SelectMethod = "qapAttachmentStatesSelectList"
  Runat="server" />
