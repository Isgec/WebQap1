<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapRequestsReview.ascx.vb" Inherits="LC_qapRequestsReview" %>
<asp:DropDownList 
  ID = "DDLqapRequestsReview"
  DataSourceID = "OdsDdlqapRequestsReview"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapRequestsReview"
  Runat = "server" 
  ControlToValidate = "DDLqapRequestsReview"
  Text = "Requests Review is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapRequestsReview"
  runat = "server"
  TargetControlID = "DDLqapRequestsReview"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapRequestsReview"
  TypeName = "SIS.QAP.qapRequestsReview"
  SortParameterName = "OrderBy"
  SelectMethod = "qapRequestsReviewSelectList"
  Runat="server" />
