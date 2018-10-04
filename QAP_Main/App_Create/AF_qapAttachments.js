<script type="text/javascript"> 
var script_qapAttachments = {
		ACERequestNo_Selected: function(sender, e) {
		  var Prefix = sender._element.id.replace('RequestNo','');
		  var F_RequestNo = $get(sender._element.id);
		  var F_RequestNo_Display = $get(sender._element.id + '_Display');
		  var retval = e.get_value();
		  var p = retval.split('|');
		  F_RequestNo.value = p[0];
		  F_RequestNo_Display.innerHTML = e.get_text();
		},
		ACERequestNo_Populating: function(sender,e) {
		  var p = sender.get_element();
		  var Prefix = sender._element.id.replace('RequestNo','');
		  p.style.backgroundImage  = 'url(../../images/loader.gif)';
		  p.style.backgroundRepeat= 'no-repeat';
		  p.style.backgroundPosition = 'right';
		  sender._contextKey = '';
		},
		ACERequestNo_Populated: function(sender,e) {
		  var p = sender.get_element();
		  p.style.backgroundImage  = 'none';
		},
		ACEStatusID_Selected: function(sender, e) {
		  var Prefix = sender._element.id.replace('StatusID','');
		  var F_StatusID = $get(sender._element.id);
		  var F_StatusID_Display = $get(sender._element.id + '_Display');
		  var retval = e.get_value();
		  var p = retval.split('|');
		  F_StatusID.value = p[0];
		  F_StatusID_Display.innerHTML = e.get_text();
		},
		ACEStatusID_Populating: function(sender,e) {
		  var p = sender.get_element();
		  var Prefix = sender._element.id.replace('StatusID','');
		  p.style.backgroundImage  = 'url(../../images/loader.gif)';
		  p.style.backgroundRepeat= 'no-repeat';
		  p.style.backgroundPosition = 'right';
		  sender._contextKey = '';
		},
		ACEStatusID_Populated: function(sender,e) {
		  var p = sender.get_element();
		  p.style.backgroundImage  = 'none';
		},
		validate_RequestNo: function(sender) {
		  var Prefix = sender.id.replace('RequestNo','');
		  this.validated_FK_QAP_Attachments_RequestNo_main = true;
		  this.validate_FK_QAP_Attachments_RequestNo(sender,Prefix);
		  },
		validate_StatusID: function(sender) {
		  var Prefix = sender.id.replace('StatusID','');
		  this.validated_FK_QAP_Attachments_StatusID_main = true;
		  this.validate_FK_QAP_Attachments_StatusID(sender,Prefix);
		  },
		validate_FK_QAP_Attachments_StatusID: function(o,Prefix) {
		  var value = o.id;
		  var StatusID = $get(Prefix + 'StatusID');
		  if(StatusID.value==''){
		    if(this.validated_FK_QAP_Attachments_StatusID_main){
		      var o_d = $get(Prefix + 'StatusID' + '_Display');
		      try{o_d.innerHTML = '';}catch(ex){}
		    }
		    return true;
		  }
		  value = value + ',' + StatusID.value ;
		    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
		    o.style.backgroundRepeat= 'no-repeat';
		    o.style.backgroundPosition = 'right';
		    PageMethods.validate_FK_QAP_Attachments_StatusID(value, this.validated_FK_QAP_Attachments_StatusID);
		  },
		validated_FK_QAP_Attachments_StatusID_main: false,
		validated_FK_QAP_Attachments_StatusID: function(result) {
		  var p = result.split('|');
		  var o = $get(p[1]);
		  if(script_qapAttachments.validated_FK_QAP_Attachments_StatusID_main){
		    var o_d = $get(p[1]+'_Display');
		    try{o_d.innerHTML = p[2];}catch(ex){}
		  }
		  o.style.backgroundImage  = 'none';
		  if(p[0]=='1'){
		    o.value='';
		    o.focus();
		  }
		},
		validate_FK_QAP_Attachments_RequestNo: function(o,Prefix) {
		  var value = o.id;
		  var RequestNo = $get(Prefix + 'RequestNo');
		  if(RequestNo.value==''){
		    if(this.validated_FK_QAP_Attachments_RequestNo_main){
		      var o_d = $get(Prefix + 'RequestNo' + '_Display');
		      try{o_d.innerHTML = '';}catch(ex){}
		    }
		    return true;
		  }
		  value = value + ',' + RequestNo.value ;
		    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';
		    o.style.backgroundRepeat= 'no-repeat';
		    o.style.backgroundPosition = 'right';
		    PageMethods.validate_FK_QAP_Attachments_RequestNo(value, this.validated_FK_QAP_Attachments_RequestNo);
		  },
		validated_FK_QAP_Attachments_RequestNo_main: false,
		validated_FK_QAP_Attachments_RequestNo: function(result) {
		  var p = result.split('|');
		  var o = $get(p[1]);
		  if(script_qapAttachments.validated_FK_QAP_Attachments_RequestNo_main){
		    var o_d = $get(p[1]+'_Display');
		    try{o_d.innerHTML = p[2];}catch(ex){}
		  }
		  o.style.backgroundImage  = 'none';
		  if(p[0]=='1'){
		    o.value='';
		    o.focus();
		  }
		},
		temp: function() {
		}
		}
</script>
