<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapStates.ascx.vb" Inherits="LC_qapStates" %>
<asp:DropDownList 
  ID = "DDLqapStates"
  DataSourceID = "OdsDdlqapStates"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapStates"
  Runat = "server" 
  ControlToValidate = "DDLqapStates"
  Text = "QAP States is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapStates"
  runat = "server"
  TargetControlID = "DDLqapStates"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapStates"
  TypeName = "SIS.QAP.qapStates"
  SortParameterName = "OrderBy"
  SelectMethod = "qapStatesSelectList"
  Runat="server" />
