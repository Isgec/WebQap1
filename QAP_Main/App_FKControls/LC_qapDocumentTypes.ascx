<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapDocumentTypes.ascx.vb" Inherits="LC_qapDocumentTypes" %>
<script type="text/javascript">
	var script_QAP = {
		docType: '',
		validate_DT: function(o) {
			if (o.value == '1') {
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVQAPNo')), true);
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVQAPRevisionNo')), true);
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVSupplierID')), true);
			} else {
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVQAPNo')), false);
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVQAPRevisionNo')), false);
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVSupplierID')), false);
			}
			if (o.value == '2'||o.value == '4') {
				ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVProjectID')), false);
			} else {
			  ValidatorEnable($get(o.id.replace('F_DocumentTypeID_DDLqapDocumentTypes', 'RFVProjectID')), true);
  		}
			this.docType = o.value;
		}
	}
</script>
<asp:DropDownList 
  ID = "DDLqapDocumentTypes"
  DataSourceID = "OdsDdlqapDocumentTypes"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  onblur="try{script_QAP.validate_DT(this);}catch(ex){}"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorqapDocumentTypes"
  Runat = "server" 
  ControlToValidate = "DDLqapDocumentTypes"
  Text = "Document Types is required."
  ErrorMessage = "[Required!]"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<AJX:ListSearchExtender
  ID="DDSEqapDocumentTypes"
  runat = "server"
  TargetControlID = "DDLqapDocumentTypes"
  PromptCssClass="ddsearchprompt">
</AJX:ListSearchExtender>
<asp:ObjectDataSource 
  ID = "OdsDdlqapDocumentTypes"
  TypeName = "SIS.QAP.qapDocumentTypes"
  SortParameterName = "OrderBy"
  SelectMethod = "qapDocumentTypesSelectList"
  Runat="server" />
