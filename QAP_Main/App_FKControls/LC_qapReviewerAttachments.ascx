<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapReviewerAttachments.ascx.vb" Inherits="LC_qapReviewerAttachments" %>
<asp:DropDownList 
  ID = "DDLqapReviewerAttachments"
  DataSourceID = "OdsDdlqapReviewerAttachments"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapReviewerAttachments"
  Runat = "server" 
  ControlToValidate = "DDLqapReviewerAttachments"
  Text = "Attachments By Reviewer is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapReviewerAttachments"
  runat = "server"
  TargetControlID = "DDLqapReviewerAttachments"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapReviewerAttachments"
  TypeName = "SIS.QAP.qapReviewerAttachments"
  SortParameterName = "OrderBy"
  SelectMethod = "qapReviewerAttachmentsSelectList"
  Runat="server" />
