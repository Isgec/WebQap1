<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapPurpose.ascx.vb" Inherits="LC_qapPurpose" %>
<script type="text/javascript">
	var script_Purpose = {
		validate_DT: function(o) {
			if (o.value == '2') {
				alert('Pl ensure commented QAP  is attached.');
			}
		}
	}
</script>
<asp:DropDownList 
  ID = "DDLqapPurpose"
  DataSourceID = "OdsDdlqapPurpose"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  onchange="try{script_Purpose.validate_DT(this);return true;}catch(ex){}" 
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapPurpose"
  Runat = "server" 
  ControlToValidate = "DDLqapPurpose"
  Text = "QAP Purpose is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapPurpose"
  runat = "server"
  TargetControlID = "DDLqapPurpose"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapPurpose"
  TypeName = "SIS.QAP.qapPurpose"
  SortParameterName = "OrderBy"
  SelectMethod = "qapPurposeSelectList"
  Runat="server" />
